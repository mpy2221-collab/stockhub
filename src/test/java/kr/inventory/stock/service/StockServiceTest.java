package kr.inventory.stock.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MailSender;
import kr.inventory.member.dao.MemberDao;
import kr.inventory.member.dto.Member;
import kr.inventory.stock.dao.RequestDao;
import kr.inventory.stock.dao.StockDao;
import kr.inventory.stock.dto.HistorySearch;
import kr.inventory.stock.dto.RequestSearch;
import kr.inventory.stock.dto.StockHistory;
import kr.inventory.stock.dto.StockRequest;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class StockServiceTest {
  @Mock
  private StockDao stockDao;
  @Mock
  private RequestDao requestDao;
  @Mock
  private MemberDao memberDao;
  @Mock
  private MailSender mailSender;
  @Mock
  private SqlSession sqlSession;
  @InjectMocks
  private StockService stockService;

  @Test
  void 입고_시_창고_재고가_증가한다() {
    when(stockDao.selectQty(1, 10)).thenReturn(10);
    when(stockDao.increase(1, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(1);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);

    int result = stockService.stockIn(1, 10, 5, "admin");

    assertEquals(1, result);
    verify(stockDao).increase(1, 10, 5);
    verify(sqlSession).commit();
  }

  @Test
  void 출고_시_재고_부족이면_실패한다() {
    when(stockDao.selectQty(1, 10)).thenReturn(2);

    int result = stockService.stockOut(1, 10, 5, "admin", null);

    assertEquals(0, result);
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(sqlSession).rollback();
    verify(sqlSession, never()).commit();
  }

  @Test
  void 창고_이동은_history_OUT_IN_두_행이고_같은_groupNo이다() {
    when(stockDao.selectQty(1, 10)).thenReturn(30);
    when(stockDao.selectQty(2, 10)).thenReturn(10);
    when(stockDao.decrease(1, 10, 5)).thenReturn(1);
    when(stockDao.increase(2, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(77);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);

    int result = stockService.move(10, 1, 2, 5, "admin");

    assertEquals(1, result);
    ArgumentCaptor<StockHistory> cap = ArgumentCaptor.forClass(StockHistory.class);
    verify(stockDao, times(2)).insertHistory(cap.capture());
    List<StockHistory> rows = cap.getAllValues();
    assertEquals(AppConstants.HISTORY_TYPE_OUT, rows.get(0).getHistoryType());
    assertEquals(AppConstants.HISTORY_TYPE_IN, rows.get(1).getHistoryType());
    assertEquals(rows.get(0).getGroupNo(), rows.get(1).getGroupNo());
    assertEquals(77, rows.get(0).getGroupNo());
    verify(sqlSession).commit();
  }

  @Test
  void 창고_이동_출발_부족이면_전체_롤백한다() {
    when(stockDao.selectQty(1, 10)).thenReturn(2);

    int result = stockService.move(10, 1, 2, 5, "admin");

    assertEquals(0, result);
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).insertHistory(any(StockHistory.class));
    verify(sqlSession).rollback();
    verify(sqlSession, never()).commit();
  }

  @Test
  void 출고_요청_승인_시_APPROVE와_history_OUT을_남긴다() {
    StockRequest req = waitRequest();
    when(requestDao.selectOne(1)).thenReturn(req);
    when(stockDao.selectQty(1, 10)).thenReturn(20);
    when(stockDao.decrease(1, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(9);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);
    when(requestDao.updateApprove(1, "admin")).thenReturn(1);

    int result = stockService.approveRequest(1, "admin");

    assertEquals(1, result);
    ArgumentCaptor<StockHistory> cap = ArgumentCaptor.forClass(StockHistory.class);
    verify(stockDao).insertHistory(cap.capture());
    assertEquals(AppConstants.HISTORY_TYPE_OUT, cap.getValue().getHistoryType());
    assertEquals(1, cap.getValue().getRequestNo());
    verify(requestDao).updateApprove(1, "admin");
    verify(sqlSession).commit();
  }

  @Test
  void 출고_요청_거절_시_재고를_유지한다() {
    when(requestDao.selectOne(1)).thenReturn(waitRequest());
    when(requestDao.updateReject(1, "admin")).thenReturn(1);

    int result = stockService.rejectRequest(1, "admin");

    assertEquals(1, result);
    verify(requestDao).updateReject(1, "admin");
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).insertHistory(any(StockHistory.class));
    verify(sqlSession).commit();
  }

  @Test
  void 조정_시_목표_수량이_되고_history_ADJUST_1행이다() {
    when(stockDao.selectQty(1, 10)).thenReturn(10);
    when(stockDao.increase(1, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(3);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);

    int result = stockService.adjust(1, 10, 15, "admin", "실사");

    assertEquals(1, result);
    verify(stockDao).increase(1, 10, 5);
    ArgumentCaptor<StockHistory> cap = ArgumentCaptor.forClass(StockHistory.class);
    verify(stockDao, times(1)).insertHistory(cap.capture());
    StockHistory h = cap.getValue();
    assertEquals(AppConstants.HISTORY_TYPE_ADJUST, h.getHistoryType());
    assertEquals(5, h.getQty());
    assertEquals(10, h.getBeforeQty());
    assertEquals(15, h.getAfterQty());
    verify(sqlSession).commit();
  }

  @Test
  void 조정이_수량을_줄여도_before_after가_맞다() {
    when(stockDao.selectQty(1, 10)).thenReturn(10);
    when(stockDao.decrease(1, 10, 7)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(4);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);

    int result = stockService.adjust(1, 10, 3, "admin", null);

    assertEquals(1, result);
    verify(stockDao).decrease(1, 10, 7);
    ArgumentCaptor<StockHistory> cap = ArgumentCaptor.forClass(StockHistory.class);
    verify(stockDao).insertHistory(cap.capture());
    assertEquals(7, cap.getValue().getQty());
    assertEquals(10, cap.getValue().getBeforeQty());
    assertEquals(3, cap.getValue().getAfterQty());
  }

  @Test
  void 목표와_현재가_같으면_재고와_이력을_바꾸지_않는다() {
    when(stockDao.selectQty(1, 10)).thenReturn(10);

    int result = stockService.adjust(1, 10, 10, "admin", null);

    assertEquals(1, result);
    verify(stockDao, never()).increase(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).insertHistory(any(StockHistory.class));
    verify(sqlSession, never()).commit();
  }

  @Test
  void 출고_요청_등록_시_WAIT이고_재고는_그대로다() {
    when(requestDao.insert(any(StockRequest.class))).thenReturn(1);

    int result = stockService.insertRequest(1, 10, 5, "user1", AppConstants.REQUEST_TYPE_OUT, "필요");

    assertEquals(1, result);
    ArgumentCaptor<StockRequest> cap = ArgumentCaptor.forClass(StockRequest.class);
    verify(requestDao).insert(cap.capture());
    assertEquals(AppConstants.REQUEST_WAIT, cap.getValue().getStatus());
    assertEquals(AppConstants.REQUEST_TYPE_OUT, cap.getValue().getRequestType());
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).insertHistory(any(StockHistory.class));
    verify(sqlSession).commit();
  }

  @Test
  void 본인_WAIT_요청은_CANCEL로_바뀌고_재고는_그대로다() {
    when(requestDao.selectOne(1)).thenReturn(waitRequest());
    when(requestDao.updateCancel(1, "user1")).thenReturn(1);

    int result = stockService.cancelRequest(1, "user1");

    assertEquals(1, result);
    verify(requestDao).updateCancel(1, "user1");
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(sqlSession).commit();
  }

  @Test
  void 본인이_아니면_출고_요청을_취소하지_못한다() {
    when(requestDao.selectOne(1)).thenReturn(waitRequest());

    int result = stockService.cancelRequest(1, "other");

    assertEquals(0, result);
    verify(requestDao, never()).updateCancel(anyInt(), any());
    verify(sqlSession).rollback();
  }

  @Test
  void WAIT가_아니면_출고_요청을_취소하지_못한다() {
    StockRequest req = waitRequest();
    req.setStatus(AppConstants.REQUEST_APPROVE);
    when(requestDao.selectOne(1)).thenReturn(req);

    int result = stockService.cancelRequest(1, "user1");

    assertEquals(0, result);
    verify(requestDao, never()).updateCancel(anyInt(), any());
    verify(sqlSession).rollback();
  }

  @Test
  void 승인_시_창고_재고가_부족하면_실패하고_WAIT를_유지한다() {
    when(requestDao.selectOne(1)).thenReturn(waitRequest());
    when(stockDao.selectQty(1, 10)).thenReturn(2);

    int result = stockService.approveRequest(1, "admin");

    assertEquals(0, result);
    verify(requestDao, never()).updateApprove(anyInt(), any());
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(sqlSession).rollback();
    verify(sqlSession, never()).commit();
  }

  @Test
  void 입고_요청_등록_시_WAIT이고_재고는_그대로다() {
    when(requestDao.insert(any(StockRequest.class))).thenReturn(1);

    int result = stockService.insertRequest(1, 10, 5, "user1", AppConstants.REQUEST_TYPE_IN, null);

    assertEquals(1, result);
    ArgumentCaptor<StockRequest> cap = ArgumentCaptor.forClass(StockRequest.class);
    verify(requestDao).insert(cap.capture());
    assertEquals(AppConstants.REQUEST_TYPE_IN, cap.getValue().getRequestType());
    assertEquals(AppConstants.REQUEST_WAIT, cap.getValue().getStatus());
    verify(stockDao, never()).increase(anyInt(), anyInt(), anyInt());
    verify(stockDao, never()).insertHistory(any(StockHistory.class));
    verify(sqlSession).commit();
  }

  @Test
  void 이력_입고_필터는_이동_쌍이_아닌_IN만_반환한다() {
    when(stockDao.selectHistoryList()).thenReturn(mixedHistory());

    List<StockHistory> list = stockService.selectHistoryList("IN");

    assertEquals(1, list.size());
    assertEquals(1, list.get(0).getHistoryNo());
    assertEquals(AppConstants.HISTORY_TYPE_IN, list.get(0).getHistoryType());
  }

  @Test
  void 이력_출고_필터는_이동_쌍이_아닌_OUT만_반환한다() {
    when(stockDao.selectHistoryList()).thenReturn(mixedHistory());

    List<StockHistory> list = stockService.selectHistoryList("OUT");

    assertEquals(1, list.size());
    assertEquals(2, list.get(0).getHistoryNo());
  }

  @Test
  void 이력_이동_필터는_같은_groupNo의_OUT과_IN만_반환한다() {
    when(stockDao.selectHistoryList()).thenReturn(mixedHistory());

    List<StockHistory> list = stockService.selectHistoryList("MOVE");

    assertEquals(2, list.size());
    assertEquals(10, list.get(0).getGroupNo());
    assertEquals(10, list.get(1).getGroupNo());
  }

  @Test
  void 이력_조정_필터는_ADJUST만_반환한다() {
    when(stockDao.selectHistoryList()).thenReturn(mixedHistory());

    List<StockHistory> list = stockService.selectHistoryList("ADJUST");

    assertEquals(1, list.size());
    assertEquals(AppConstants.HISTORY_TYPE_ADJUST, list.get(0).getHistoryType());
  }

  @Test
  void 이력_전체는_모든_행을_반환한다() {
    when(stockDao.selectHistoryList()).thenReturn(mixedHistory());

    List<StockHistory> list = stockService.selectHistoryList("ALL");

    assertEquals(5, list.size());
  }

  @Test
  void 입고_요청_승인_시_APPROVE와_history_IN을_남긴다() {
    StockRequest req = waitRequest();
    req.setRequestType(AppConstants.REQUEST_TYPE_IN);
    when(requestDao.selectOne(1)).thenReturn(req);
    when(stockDao.selectQty(1, 10)).thenReturn(20);
    when(stockDao.increase(1, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(9);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);
    when(requestDao.updateApprove(1, "admin")).thenReturn(1);

    int result = stockService.approveRequest(1, "admin");

    assertEquals(1, result);
    ArgumentCaptor<StockHistory> cap = ArgumentCaptor.forClass(StockHistory.class);
    verify(stockDao).increase(1, 10, 5);
    verify(stockDao).insertHistory(cap.capture());
    assertEquals(AppConstants.HISTORY_TYPE_IN, cap.getValue().getHistoryType());
    assertEquals(1, cap.getValue().getRequestNo());
    verify(stockDao, never()).decrease(anyInt(), anyInt(), anyInt());
    verify(requestDao).updateApprove(1, "admin");
    verify(sqlSession).commit();
  }

  @Test
  void 요청_승인_성공_후_요청자에게_메일을_보낸다() {
    StockRequest req = waitRequest();
    when(requestDao.selectOne(1)).thenReturn(req);
    when(stockDao.selectQty(1, 10)).thenReturn(20);
    when(stockDao.decrease(1, 10, 5)).thenReturn(1);
    when(stockDao.nextGroupNo()).thenReturn(9);
    when(stockDao.insertHistory(any(StockHistory.class))).thenReturn(1);
    when(requestDao.updateApprove(1, "admin")).thenReturn(1);
    when(memberDao.selectById("user1")).thenReturn(mailMember());

    int result = stockService.approveRequest(1, "admin");

    assertEquals(1, result);
    verify(mailSender).send(eq("user1@test.com"), anyString(), anyString());
  }

  @Test
  void 요청_거절_성공_후_요청자에게_메일을_보낸다() {
    when(requestDao.selectOne(1)).thenReturn(waitRequest());
    when(requestDao.updateReject(1, "admin")).thenReturn(1);
    when(memberDao.selectById("user1")).thenReturn(mailMember());

    int result = stockService.rejectRequest(1, "admin");

    assertEquals(1, result);
    verify(mailSender).send(eq("user1@test.com"), anyString(), anyString());
  }

  @Test
  void 대기_요청_건수를_반환한다() {
    when(requestDao.countWait()).thenReturn(3);

    int count = stockService.countWaitRequest();

    assertEquals(3, count);
    verify(requestDao, times(1)).countWait();
  }

  @Test
  void 이력_엑셀은_from_to_사이_행만_담는다() {
    StockHistory inRange = hist(1, 1, AppConstants.HISTORY_TYPE_IN);
    inRange.setHistoryDate(day(2026, 8, 10));
    inRange.setGoodsCode("NB-001");
    StockHistory outRange = hist(2, 2, AppConstants.HISTORY_TYPE_OUT);
    outRange.setHistoryDate(day(2026, 8, 20));
    StockHistory before = hist(3, 3, AppConstants.HISTORY_TYPE_ADJUST);
    before.setHistoryDate(day(2026, 7, 1));
    when(stockDao.selectHistoryList()).thenReturn(Arrays.asList(inRange, outRange, before));

    List<List<String>> rows = stockService.toHistoryExcelRows(day(2026, 8, 1), day(2026, 8, 15));

    assertEquals(1, rows.size());
    assertEquals("NB-001", rows.get(0).get(2));
  }

  @Test
  void 이력_검색은_기간_밖을_뺀다() {
    StockHistory inRange = hist(1, 1, AppConstants.HISTORY_TYPE_IN);
    inRange.setHistoryDate(day(2026, 8, 10));
    StockHistory outRange = hist(2, 2, AppConstants.HISTORY_TYPE_OUT);
    outRange.setHistoryDate(day(2026, 7, 1));
    when(stockDao.selectHistoryBySearch(any(HistorySearch.class)))
        .thenReturn(Arrays.asList(inRange, outRange));
    HistorySearch search = new HistorySearch();
    search.setFrom("2026-08-01");
    search.setTo("2026-08-31");
    search.setType("ALL");

    List<StockHistory> list = stockService.selectHistoryList(search);

    assertEquals(1, list.size());
    assertEquals(1, list.get(0).getHistoryNo());
  }

  @Test
  void 이력_검색은_창고와_품목_키워드만_남긴다() {
    StockHistory hit = hist(1, 1, AppConstants.HISTORY_TYPE_IN);
    hit.setWarehouseNo(1);
    hit.setGoodsCode("NB-001");
    hit.setGoodsName("노트북");
    StockHistory otherWh = hist(2, 2, AppConstants.HISTORY_TYPE_IN);
    otherWh.setWarehouseNo(2);
    otherWh.setGoodsCode("NB-001");
    otherWh.setGoodsName("노트북");
    StockHistory otherGoods = hist(3, 3, AppConstants.HISTORY_TYPE_IN);
    otherGoods.setWarehouseNo(1);
    otherGoods.setGoodsCode("PEN-01");
    otherGoods.setGoodsName("볼펜");
    when(stockDao.selectHistoryBySearch(any(HistorySearch.class)))
        .thenReturn(Arrays.asList(hit, otherWh, otherGoods));
    HistorySearch search = new HistorySearch();
    search.setWarehouseNo(1);
    search.setKeyword("NB");
    search.setType("ALL");

    List<StockHistory> list = stockService.selectHistoryList(search);

    assertEquals(1, list.size());
    assertEquals(1, list.get(0).getHistoryNo());
  }

  @Test
  void 요청_목록_대기만_조회한다() {
    StockRequest wait = waitRequest();
    StockRequest done = waitRequest();
    done.setRequestNo(2);
    done.setStatus(AppConstants.REQUEST_APPROVE);
    when(requestDao.selectBySearch(any(RequestSearch.class))).thenReturn(Arrays.asList(wait, done));
    RequestSearch search = new RequestSearch();
    search.setStatus(AppConstants.REQUEST_WAIT);

    List<StockRequest> list = stockService.selectRequestList(search);

    assertEquals(1, list.size());
    assertEquals(AppConstants.REQUEST_WAIT, list.get(0).getStatus());
  }

  @Test
  void 요청_목록_출고만_조회한다() {
    StockRequest out = waitRequest();
    StockRequest in = waitRequest();
    in.setRequestNo(2);
    in.setRequestType(AppConstants.REQUEST_TYPE_IN);
    when(requestDao.selectBySearch(any(RequestSearch.class))).thenReturn(Arrays.asList(out, in));
    RequestSearch search = new RequestSearch();
    search.setRequestType(AppConstants.REQUEST_TYPE_OUT);

    List<StockRequest> list = stockService.selectRequestList(search);

    assertEquals(1, list.size());
    assertEquals(AppConstants.REQUEST_TYPE_OUT, list.get(0).getRequestType());
  }

  @Test
  void 일괄_승인은_실패해도_나머지를_호출한다() {
    StockService spy = spy(stockService);
    doReturn(1).when(spy).approveRequest(1, "admin");
    doReturn(0).when(spy).approveRequest(2, "admin");

    int[] result = spy.processRequestBatch(new int[] {1, 2}, "admin", true);

    assertEquals(1, result[0]);
    assertEquals(1, result[1]);
    verify(spy).approveRequest(1, "admin");
    verify(spy).approveRequest(2, "admin");
  }

  private Date day(int year, int month, int day) {
    Calendar cal = Calendar.getInstance();
    cal.clear();
    cal.set(year, month - 1, day);
    return cal.getTime();
  }

  private List<StockHistory> mixedHistory() {
    return Arrays.asList(
        hist(1, 1, AppConstants.HISTORY_TYPE_IN),
        hist(2, 2, AppConstants.HISTORY_TYPE_OUT),
        hist(3, 10, AppConstants.HISTORY_TYPE_OUT),
        hist(4, 10, AppConstants.HISTORY_TYPE_IN),
        hist(5, 3, AppConstants.HISTORY_TYPE_ADJUST));
  }

  private StockHistory hist(int historyNo, int groupNo, String type) {
    StockHistory h = new StockHistory();
    h.setHistoryNo(historyNo);
    h.setGroupNo(groupNo);
    h.setHistoryType(type);
    return h;
  }

  private Member mailMember() {
    Member m = new Member();
    m.setMemberId("user1");
    m.setMemberEmail("user1@test.com");
    return m;
  }

  private StockRequest waitRequest() {
    StockRequest req = new StockRequest();
    req.setRequestNo(1);
    req.setMemberId("user1");
    req.setWarehouseNo(1);
    req.setGoodsNo(10);
    req.setQty(5);
    req.setRequestType(AppConstants.REQUEST_TYPE_OUT);
    req.setStatus(AppConstants.REQUEST_WAIT);
    return req;
  }
}
