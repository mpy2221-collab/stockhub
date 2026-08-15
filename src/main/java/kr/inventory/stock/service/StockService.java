package kr.inventory.stock.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MailSender;
import kr.inventory.common.MybatisUtil;
import kr.inventory.member.dao.MemberDao;
import kr.inventory.member.dto.Member;
import kr.inventory.stock.dao.RequestDao;
import kr.inventory.stock.dao.StockDao;
import kr.inventory.stock.dto.HistorySearch;
import kr.inventory.stock.dto.RequestSearch;
import kr.inventory.stock.dto.StockHistory;
import kr.inventory.stock.dto.StockRequest;
import org.apache.ibatis.session.SqlSession;

/**
 * 창고별 재고 변경과 이력을 한 트랜잭션으로 처리한다.
 */
public class StockService {
  public static final String[] HISTORY_EXCEL_HEADERS = {
      "일시", "유형", "품목코드", "품목명", "창고", "수량", "변동전", "변동후", "처리자", "메모"
  };

  private StockDao stockDao;
  private RequestDao requestDao;
  private MemberDao memberDao;
  private MailSender mailSender;
  private SqlSession sqlSession;

  public StockService() {
  }

  public StockService(StockDao stockDao, RequestDao requestDao, SqlSession sqlSession) {
    this.stockDao = stockDao;
    this.requestDao = requestDao;
    this.sqlSession = sqlSession;
  }

  public StockService(StockDao stockDao, RequestDao requestDao, MemberDao memberDao,
      MailSender mailSender, SqlSession sqlSession) {
    this.stockDao = stockDao;
    this.requestDao = requestDao;
    this.memberDao = memberDao;
    this.mailSender = mailSender;
    this.sqlSession = sqlSession;
  }

  public int stockIn(int warehouseNo, int goodsNo, int qty, String memberId) {
    return stockIn(warehouseNo, goodsNo, qty, memberId, null);
  }

  public int stockIn(int warehouseNo, int goodsNo, int qty, String memberId, String memo) {
    if (qty <= 0) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      Integer current = dao.selectQty(warehouseNo, goodsNo);
      int before = current == null ? 0 : current;
      if (current == null) {
        dao.insertStock(warehouseNo, goodsNo, qty);
      } else {
        dao.increase(warehouseNo, goodsNo, qty);
      }
      dao.insertHistory(history(dao.nextGroupNo(), AppConstants.HISTORY_TYPE_IN,
          warehouseNo, goodsNo, qty, before, before + qty, memberId, null, memo));
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public int stockOut(int warehouseNo, int goodsNo, int qty, String memberId, Integer requestNo) {
    return stockOut(warehouseNo, goodsNo, qty, memberId, requestNo, null);
  }

  /**
   * 해당 창고 수량이 qty 이상일 때만 출고한다.
   */
  public int stockOut(int warehouseNo, int goodsNo, int qty, String memberId, Integer requestNo,
      String memo) {
    if (qty <= 0) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      Integer current = dao.selectQty(warehouseNo, goodsNo);
      int before = current == null ? 0 : current;
      if (before < qty) {
        session.rollback();
        return 0;
      }
      int updated = dao.decrease(warehouseNo, goodsNo, qty);
      if (updated == 0) {
        session.rollback();
        return 0;
      }
      dao.insertHistory(history(dao.nextGroupNo(), AppConstants.HISTORY_TYPE_OUT,
          warehouseNo, goodsNo, qty, before, before - qty, memberId, requestNo, memo));
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public int move(int goodsNo, int fromWh, int toWh, int qty, String memberId) {
    return move(goodsNo, fromWh, toWh, qty, memberId, null);
  }

  /**
   * A창고에서 B창고로 이동. 출발 재고가 부족하면 전체 롤백한다.
   * history는 OUT+IN 두 행, 같은 group_no.
   */
  public int move(int goodsNo, int fromWh, int toWh, int qty, String memberId, String memo) {
    if (qty <= 0 || fromWh == toWh) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      Integer fromQty = dao.selectQty(fromWh, goodsNo);
      int fromBefore = fromQty == null ? 0 : fromQty;
      if (fromBefore < qty) {
        session.rollback();
        return 0;
      }
      int decreased = dao.decrease(fromWh, goodsNo, qty);
      if (decreased == 0) {
        session.rollback();
        return 0;
      }
      Integer toQty = dao.selectQty(toWh, goodsNo);
      int toBefore = toQty == null ? 0 : toQty;
      if (toQty == null) {
        dao.insertStock(toWh, goodsNo, qty);
      } else {
        dao.increase(toWh, goodsNo, qty);
      }
      int groupNo = dao.nextGroupNo();
      dao.insertHistory(history(groupNo, AppConstants.HISTORY_TYPE_OUT,
          fromWh, goodsNo, qty, fromBefore, fromBefore - qty, memberId, null, memo));
      dao.insertHistory(history(groupNo, AppConstants.HISTORY_TYPE_IN,
          toWh, goodsNo, qty, toBefore, toBefore + qty, memberId, null, memo));
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  /**
   * 입고 또는 출고 요청을 WAIT로 남긴다. 재고와 history는 건드리지 않는다.
   */
  public int insertRequest(int warehouseNo, int goodsNo, int qty, String memberId,
      String requestType, String memo) {
    if (qty <= 0 || warehouseNo <= 0 || goodsNo <= 0 || memberId == null || memberId.isEmpty()) {
      return 0;
    }
    if (!AppConstants.REQUEST_TYPE_IN.equals(requestType)
        && !AppConstants.REQUEST_TYPE_OUT.equals(requestType)) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      StockRequest req = new StockRequest();
      req.setWarehouseNo(warehouseNo);
      req.setGoodsNo(goodsNo);
      req.setQty(qty);
      req.setMemberId(memberId);
      req.setRequestType(requestType);
      req.setMemo(memo);
      req.setStatus(AppConstants.REQUEST_WAIT);
      rDao.insert(req);
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  /**
   * 본인 WAIT 요청만 CANCEL. 재고는 유지한다.
   */
  public int cancelRequest(int requestNo, String memberId) {
    if (memberId == null || memberId.isEmpty()) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      StockRequest req = rDao.selectOne(requestNo);
      if (req == null || !AppConstants.REQUEST_WAIT.equals(req.getStatus())
          || !memberId.equals(req.getMemberId())) {
        session.rollback();
        return 0;
      }
      int updated = rDao.updateCancel(requestNo, memberId);
      if (updated == 0) {
        session.rollback();
        return 0;
      }
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public List<StockRequest> selectMyRequestList(String memberId) {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      return rDao.selectMyList(memberId);
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public int countWaitRequest() {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      return rDao.countWait();
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public List<StockRequest> selectRequestList() {
    return selectRequestList(new RequestSearch());
  }

  public List<StockRequest> selectRequestList(RequestSearch search) {
    RequestSearch cond = search == null ? new RequestSearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      return filterRequest(rDao.selectBySearch(cond), cond);
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  private List<StockRequest> filterRequest(List<StockRequest> raw, RequestSearch cond) {
    if (raw == null) {
      return new ArrayList<>();
    }
    String status = cond.getStatus();
    String type = cond.getRequestType();
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    List<StockRequest> result = new ArrayList<>();
    for (StockRequest r : raw) {
      if (status != null && !status.isEmpty() && !"ALL".equals(status)
          && !status.equals(r.getStatus())) {
        continue;
      }
      if (type != null && !type.isEmpty() && !type.equals(r.getRequestType())) {
        continue;
      }
      if (!key.isEmpty()) {
        String id = nvl(r.getMemberId()).toLowerCase();
        String code = nvl(r.getGoodsCode()).toLowerCase();
        String name = nvl(r.getGoodsName()).toLowerCase();
        if (!id.contains(key) && !code.contains(key) && !name.contains(key)) {
          continue;
        }
      }
      result.add(r);
    }
    return result;
  }

  /**
   * 건마다 기존 승인·거절을 호출한다. 한 트랜잭션으로 묶지 않는다.
   * @return [성공 건수, 실패 건수]
   */
  public int[] processRequestBatch(int[] requestNos, String adminId, boolean approve) {
    int ok = 0;
    int fail = 0;
    if (requestNos == null) {
      return new int[] {0, 0};
    }
    for (int requestNo : requestNos) {
      int result = approve ? approveRequest(requestNo, adminId) : rejectRequest(requestNo, adminId);
      if (result > 0) {
        ok++;
      } else {
        fail++;
      }
    }
    return new int[] {ok, fail};
  }

  /**
   * WAIT 요청만 승인. 입고는 증가+IN, 출고는 감소+OUT. 한 트랜잭션.
   */
  public int approveRequest(int requestNo, String adminId) {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao sDao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      StockRequest req = rDao.selectOne(requestNo);
      if (req == null || !AppConstants.REQUEST_WAIT.equals(req.getStatus())) {
        session.rollback();
        return 0;
      }
      String type = req.getRequestType();
      if (type == null || type.isEmpty()) {
        type = AppConstants.REQUEST_TYPE_OUT;
      }
      Integer current = sDao.selectQty(req.getWarehouseNo(), req.getGoodsNo());
      int before = current == null ? 0 : current;
      if (AppConstants.REQUEST_TYPE_IN.equals(type)) {
        if (current == null) {
          sDao.insertStock(req.getWarehouseNo(), req.getGoodsNo(), req.getQty());
        } else {
          sDao.increase(req.getWarehouseNo(), req.getGoodsNo(), req.getQty());
        }
        sDao.insertHistory(history(sDao.nextGroupNo(), AppConstants.HISTORY_TYPE_IN,
            req.getWarehouseNo(), req.getGoodsNo(), req.getQty(),
            before, before + req.getQty(), adminId, requestNo, null));
      } else if (AppConstants.REQUEST_TYPE_OUT.equals(type)) {
        if (before < req.getQty()) {
          session.rollback();
          return 0;
        }
        int decreased = sDao.decrease(req.getWarehouseNo(), req.getGoodsNo(), req.getQty());
        if (decreased == 0) {
          session.rollback();
          return 0;
        }
        sDao.insertHistory(history(sDao.nextGroupNo(), AppConstants.HISTORY_TYPE_OUT,
            req.getWarehouseNo(), req.getGoodsNo(), req.getQty(),
            before, before - req.getQty(), adminId, requestNo, null));
      } else {
        session.rollback();
        return 0;
      }
      rDao.updateApprove(requestNo, adminId);
      session.commit();
      notifyRequestMail(req, true, owned, session);
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  /**
   * WAIT 요청만 거절. 재고는 유지한다.
   */
  public int rejectRequest(int requestNo, String adminId) {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
    try {
      StockRequest req = rDao.selectOne(requestNo);
      if (req == null || !AppConstants.REQUEST_WAIT.equals(req.getStatus())) {
        session.rollback();
        return 0;
      }
      rDao.updateReject(requestNo, adminId);
      session.commit();
      notifyRequestMail(req, false, owned, session);
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  /**
   * 승인·거절 후 요청자 안내 메일. 운영에서는 기다리지 않고 보낸다.
   * 실패해도 처리 결과는 유지한다.
   */
  private void notifyRequestMail(StockRequest req, boolean approved, boolean owned,
      SqlSession session) {
    if (mailSender == null && !owned) {
      return;
    }
    try {
      MailSender sender = mailSender != null ? mailSender : new MailSender();
      MemberDao mDao = memberDao != null ? memberDao : session.getMapper(MemberDao.class);
      Member member = mDao.selectById(req.getMemberId());
      if (member == null || member.getMemberEmail() == null || member.getMemberEmail().isEmpty()) {
        return;
      }
      String result = approved ? "승인" : "거절";
      String type = AppConstants.REQUEST_TYPE_IN.equals(req.getRequestType()) ? "입고" : "출고";
      String email = member.getMemberEmail();
      String subject = "[StockHub] 입출고 요청 " + result;
      String body = type + " 요청이 " + result + "되었습니다. 수량 " + req.getQty() + ".";
      if (mailSender != null) {
        sender.send(email, subject, body);
        return;
      }
      new Thread(() -> {
        try {
          new MailSender().send(email, subject, body);
        } catch (Exception e) {
          return;
        }
      }, "request-mail").start();
    } catch (Exception e) {
      return;
    }
  }

  /**
   * 한 창고 수량을 목표값으로 맞춘다. 목표와 현재가 같으면 이력 없이 성공.
   */
  public int adjust(int warehouseNo, int goodsNo, int targetQty, String memberId, String memo) {
    if (targetQty < 0) {
      return 0;
    }
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      Integer current = dao.selectQty(warehouseNo, goodsNo);
      int before = current == null ? 0 : current;
      if (before == targetQty) {
        return 1;
      }
      int delta = Math.abs(targetQty - before);
      if (current == null) {
        dao.insertStock(warehouseNo, goodsNo, targetQty);
      } else if (targetQty > before) {
        dao.increase(warehouseNo, goodsNo, targetQty - before);
      } else {
        int decreased = dao.decrease(warehouseNo, goodsNo, before - targetQty);
        if (decreased == 0) {
          session.rollback();
          return 0;
        }
      }
      dao.insertHistory(history(dao.nextGroupNo(), AppConstants.HISTORY_TYPE_ADJUST,
          warehouseNo, goodsNo, delta, before, targetQty, memberId, null, memo));
      session.commit();
      return 1;
    } catch (Exception e) {
      session.rollback();
      return 0;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public int currentQty(int warehouseNo, int goodsNo) {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      Integer qty = dao.selectQty(warehouseNo, goodsNo);
      return qty == null ? 0 : qty;
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  /**
   * from~to(당일 포함) 사이 이력만. 날짜가 없으면 이번 달 1일~오늘.
   */
  public List<StockHistory> selectHistoryBetween(Date from, Date to) {
    Date start = startOfDay(from != null ? from : firstDayOfMonth());
    Date end = endOfDay(to != null ? to : new Date());
    List<StockHistory> filtered = new ArrayList<>();
    for (StockHistory h : selectHistoryList()) {
      Date d = h.getHistoryDate();
      if (d == null) {
        continue;
      }
      if (!d.before(start) && !d.after(end)) {
        filtered.add(h);
      }
    }
    return filtered;
  }

  public List<List<String>> toHistoryExcelRows(Date from, Date to) {
    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<List<String>> rows = new ArrayList<>();
    for (StockHistory h : selectHistoryBetween(from, to)) {
      rows.add(Arrays.asList(
          h.getHistoryDate() == null ? "" : fmt.format(h.getHistoryDate()),
          nvl(h.getHistoryType()),
          nvl(h.getGoodsCode()),
          nvl(h.getGoodsName()),
          nvl(h.getWarehouseName()),
          String.valueOf(h.getQty()),
          String.valueOf(h.getBeforeQty()),
          String.valueOf(h.getAfterQty()),
          nvl(h.getMemberId()),
          nvl(h.getMemo())));
    }
    return rows;
  }

  private Date firstDayOfMonth() {
    Calendar cal = Calendar.getInstance();
    cal.set(Calendar.DAY_OF_MONTH, 1);
    return cal.getTime();
  }

  private Date startOfDay(Date d) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(d);
    cal.set(Calendar.HOUR_OF_DAY, 0);
    cal.set(Calendar.MINUTE, 0);
    cal.set(Calendar.SECOND, 0);
    cal.set(Calendar.MILLISECOND, 0);
    return cal.getTime();
  }

  private Date endOfDay(Date d) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(d);
    cal.set(Calendar.HOUR_OF_DAY, 23);
    cal.set(Calendar.MINUTE, 59);
    cal.set(Calendar.SECOND, 59);
    cal.set(Calendar.MILLISECOND, 999);
    return cal.getTime();
  }

  private String nvl(String v) {
    return v == null ? "" : v;
  }

  public List<StockHistory> selectHistoryList() {
    return selectHistoryList((String) null);
  }

  /**
   * type: ALL/빈값 전체, IN 입고, OUT 출고, MOVE 이동(같은 group_no의 OUT+IN), ADJUST 조정.
   */
  public List<StockHistory> selectHistoryList(String type) {
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      return filterHistory(dao.selectHistoryList(), type);
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  public List<StockHistory> selectHistoryList(HistorySearch search) {
    HistorySearch cond = normalizeHistorySearch(search);
    boolean owned = sqlSession == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : sqlSession;
    StockDao dao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
    try {
      return filterHistory(filterHistoryBySearch(dao.selectHistoryBySearch(cond), cond),
          cond.getType());
    } finally {
      if (owned) {
        session.close();
      }
    }
  }

  private List<StockHistory> filterHistoryBySearch(List<StockHistory> raw, HistorySearch cond) {
    if (raw == null) {
      return new ArrayList<>();
    }
    Date start = parseDayStart(cond.getFrom());
    Date end = parseDayEnd(cond.getTo());
    Integer warehouseNo = cond.getWarehouseNo();
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    List<StockHistory> result = new ArrayList<>();
    for (StockHistory h : raw) {
      Date d = h.getHistoryDate();
      if (start != null && (d == null || d.before(start))) {
        continue;
      }
      if (end != null && (d == null || d.after(end))) {
        continue;
      }
      if (warehouseNo != null && warehouseNo > 0 && h.getWarehouseNo() != warehouseNo) {
        continue;
      }
      if (!key.isEmpty()) {
        String code = nvl(h.getGoodsCode()).toLowerCase();
        String name = nvl(h.getGoodsName()).toLowerCase();
        if (!code.contains(key) && !name.contains(key)) {
          continue;
        }
      }
      result.add(h);
    }
    return result;
  }

  private Date parseDayStart(String ymd) {
    Date d = parseDay(ymd);
    return d == null ? null : startOfDay(d);
  }

  private Date parseDayEnd(String ymd) {
    Date d = parseDay(ymd);
    return d == null ? null : endOfDay(d);
  }

  private Date parseDay(String ymd) {
    if (ymd == null || ymd.isEmpty()) {
      return null;
    }
    try {
      return new SimpleDateFormat("yyyy-MM-dd").parse(ymd);
    } catch (Exception e) {
      return null;
    }
  }

  private HistorySearch normalizeHistorySearch(HistorySearch search) {
    HistorySearch cond = search == null ? new HistorySearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    String from = cond.getFrom();
    String to = cond.getTo();
    if (from != null && to != null && !from.isEmpty() && !to.isEmpty() && from.compareTo(to) > 0) {
      cond.setFrom(to);
      cond.setTo(from);
    }
    return cond;
  }

  private List<StockHistory> filterHistory(List<StockHistory> all, String type) {
    if (type == null || type.isEmpty() || "ALL".equals(type)) {
      return all;
    }
    Set<Integer> moveGroups = moveGroupNos(all);
    List<StockHistory> filtered = new ArrayList<>();
    for (StockHistory h : all) {
      boolean move = moveGroups.contains(h.getGroupNo());
      if ("MOVE".equals(type) && move) {
        filtered.add(h);
      } else if ("IN".equals(type) && AppConstants.HISTORY_TYPE_IN.equals(h.getHistoryType())
          && !move) {
        filtered.add(h);
      } else if ("OUT".equals(type) && AppConstants.HISTORY_TYPE_OUT.equals(h.getHistoryType())
          && !move) {
        filtered.add(h);
      } else if ("ADJUST".equals(type)
          && AppConstants.HISTORY_TYPE_ADJUST.equals(h.getHistoryType())) {
        filtered.add(h);
      }
    }
    return filtered;
  }

  private Set<Integer> moveGroupNos(List<StockHistory> all) {
    Map<Integer, Set<String>> types = new HashMap<>();
    for (StockHistory h : all) {
      Set<String> set = types.get(h.getGroupNo());
      if (set == null) {
        set = new HashSet<>();
        types.put(h.getGroupNo(), set);
      }
      set.add(h.getHistoryType());
    }
    Set<Integer> move = new HashSet<>();
    for (Map.Entry<Integer, Set<String>> e : types.entrySet()) {
      if (e.getValue().contains(AppConstants.HISTORY_TYPE_IN)
          && e.getValue().contains(AppConstants.HISTORY_TYPE_OUT)) {
        move.add(e.getKey());
      }
    }
    return move;
  }

  private StockHistory history(int groupNo, String type, int warehouseNo, int goodsNo, int qty,
      int before, int after, String memberId, Integer requestNo, String memo) {
    StockHistory h = new StockHistory();
    h.setGroupNo(groupNo);
    h.setHistoryType(type);
    h.setWarehouseNo(warehouseNo);
    h.setGoodsNo(goodsNo);
    h.setQty(qty);
    h.setBeforeQty(before);
    h.setAfterQty(after);
    h.setMemberId(memberId);
    h.setRequestNo(requestNo);
    h.setMemo(memo);
    return h;
  }
}
