# -*- coding: utf-8 -*-
"""로컬 데모 데이터 SQL을 만들고 C:/Temp/stock 이미지를 준비한다."""
import os
import random
import shutil
from datetime import datetime, timedelta

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
OUT_SQL = os.path.join(os.path.dirname(__file__), "seed-local.sql")
IMG_SRC = os.path.join(ROOT, "src", "main", "webapp", "resources", "img", "goods-default.png")
GOODS_IMG_DIR = os.path.join(os.path.dirname(__file__), "goods-img")
IMG_DIR = r"C:/Temp/stock"
PW = "$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS"

START = datetime(2025, 1, 1, 9, 0, 0)
END = datetime(2026, 8, 31, 18, 0, 0)
SPAN = int((END - START).total_seconds())

random.seed(42)

WAREHOUSES = [
  "본사창고", "제1물류센터", "제2물류센터", "서울매장", "부산매장",
  "대구매장", "인천매장", "광주매장", "대전매장", "울산매장",
  "수원창고", "성남창고", "예비창고", "반품창고", "냉동창고",
]
CATEGORIES = [
  "전자기기", "사무용품", "소모품", "포장자재", "안전용품",
  "청소용품", "가구", "음료", "공구", "비품",
]
GOODS = [
  ("노트북", "대", 5, 1200000, "전자기기"), ("모니터", "대", 8, 280000, "전자기기"),
  ("키보드", "개", 20, 45000, "전자기기"), ("마우스", "개", 20, 25000, "전자기기"),
  ("웹캠", "개", 10, 89000, "전자기기"), ("USB허브", "개", 15, 22000, "전자기기"),
  ("HDMI케이블", "개", 30, 8000, "전자기기"), ("노트북가방", "개", 10, 39000, "비품"),
  ("헤드셋", "개", 12, 65000, "전자기기"), ("스피커", "개", 8, 54000, "전자기기"),
  ("볼펜", "개", 80, 500, "소모품"), ("노트", "권", 40, 1500, "사무용품"),
  ("스테이플러", "개", 15, 4500, "사무용품"), ("클립", "박스", 20, 2000, "소모품"),
  ("A4용지", "박스", 12, 25000, "소모품"), ("파일철", "개", 25, 1800, "사무용품"),
  ("화이트보드", "개", 4, 35000, "사무용품"), ("마커", "개", 40, 1200, "소모품"),
  ("테이프", "개", 30, 1500, "소모품"), ("박스테이프", "개", 20, 2800, "포장자재"),
  ("안전모", "개", 10, 18000, "안전용품"), ("안전화", "켤레", 8, 42000, "안전용품"),
  ("청소포", "팩", 15, 6000, "청소용품"), ("세제", "개", 10, 8900, "청소용품"),
  ("책상", "개", 3, 180000, "가구"), ("의자", "개", 6, 95000, "가구"),
  ("생수", "팩", 20, 7000, "음료"), ("커피", "박스", 8, 24000, "음료"),
  ("드라이버세트", "세트", 7, 32000, "공구"), ("멀티탭", "개", 18, 12000, "전자기기"),
]
UNITS_OK = True
ADMINS = ["admin1", "admin2", "admin3"]


def esc(s):
  return str(s).replace("'", "''")


def rand_dt():
  return START + timedelta(seconds=random.randint(0, SPAN))


def fmt(dt):
  return dt.strftime("%Y-%m-%d %H:%M:%S")


def sql_date(dt):
  return "TO_DATE('%s','YYYY-MM-DD HH24:MI:SS')" % fmt(dt)


def main():
  os.makedirs(IMG_DIR, exist_ok=True)
  for i in range(1, 31):
    name = "g%02d.png" % i
    src = os.path.join(GOODS_IMG_DIR, name)
    if not os.path.isfile(src):
      src = IMG_SRC
    if os.path.isfile(src):
      shutil.copyfile(src, os.path.join(IMG_DIR, name))

  lines = []
  a = lines.append
  a("SET DEFINE OFF")
  a("WHENEVER SQLERROR EXIT SQL.SQLCODE")
  a("ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';")
  a("DELETE FROM tb_stock_history;")
  a("DELETE FROM tb_stock_request;")
  a("DELETE FROM tb_warehouse_stock;")
  a("DELETE FROM tb_goods;")
  a("DELETE FROM tb_category;")
  a("DELETE FROM tb_warehouse;")
  a("DELETE FROM tb_member;")

  # members
  for i, aid in enumerate(ADMINS, start=1):
    a("INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)")
    a("VALUES (%d, '%s', '%s', '관리자%d', '010-1000-%04d', '서울 본사', '%s@stockhub.local', 1, DATE '2025-01-02');" % (
      i, aid, PW, i, i, aid))
  for i in range(1, 21):
    uid = "user%02d" % i
    no = 3 + i
    a("INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)")
    a("VALUES (%d, '%s', '%s', '일반%d', '010-2000-%04d', '서울 매장', '%s@stockhub.local', 3, DATE '2025-01-05');" % (
      no, uid, PW, i, i, uid))

  for i, name in enumerate(WAREHOUSES, start=1):
    a("INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (%d, '%s', 'Y');" % (i, esc(name)))
  for i, name in enumerate(CATEGORIES, start=1):
    a("INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (%d, '%s', 'Y');" % (i, esc(name)))

  cat_no = {name: i for i, name in enumerate(CATEGORIES, start=1)}
  for i, (name, unit, safety, price, cat_name) in enumerate(GOODS, start=1):
    cat = cat_no[cat_name]
    img = "g%02d.png" % i
    code = "GDS-%03d" % i
    a("INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)")
    a("VALUES (%d, '%s', '%s', %d, '%s', %d, %d, '%s', 'Y');" % (
      i, code, esc(name), cat, esc(unit), safety, price, img))

  events = []
  stock = {}
  # 출고·이동이 날짜 순으로 먼저 나와도 부족하지 않게 기본 재고를 둔다(이력 없음).
  for g in range(1, 31):
    home = ((g - 1) % 15) + 1
    stock[(home, g)] = 500

  # 관리자 처리: 물품당 입고/출고/이동/조정 각 2회. 날짜는 기간 전체에 고르게.
  for g in range(1, 31):
    admin = ADMINS[(g - 1) // 10]
    home = ((g - 1) % 15) + 1
    other = (home % 15) + 1
    ops = [
      ("IN", home, None, random.randint(10, 30)),
      ("IN", home, None, random.randint(10, 30)),
      ("OUT", home, None, random.randint(3, 10)),
      ("OUT", home, None, random.randint(3, 10)),
      ("MOVE", home, other, random.randint(3, 10)),
      ("MOVE", home, other, random.randint(3, 10)),
      ("ADJUST", home, None, random.randint(8, 20)),
      ("ADJUST", other, None, random.randint(8, 20)),
    ]
    for kind, wh, to_wh, qty in ops:
      events.append({
        "dt": rand_dt(), "kind": kind, "wh": wh, "to_wh": to_wh,
        "goods": g, "qty": qty, "member": admin, "request_no": None,
        "memo": "데모-%s" % kind,
      })

  # 요청 240건. 거절만 남기고 대기는 전부 승인(+이력).
  req_rows = []
  request_no = 0
  for u in range(1, 21):
    uid = "user%02d" % u
    for n in range(12):
      request_no += 1
      rtype = "IN" if (u + n) % 2 == 0 else "OUT"
      reject = (n % 5 == 0)
      g = ((u * 3 + n - 1) % 30) + 1
      wh = ((u + n - 1) % 15) + 1
      qty = random.randint(2, 8)
      rdt = rand_dt()
      proc = ADMINS[(u - 1) % 3]
      if reject:
        pdt = min(END, rdt + timedelta(days=random.randint(1, 7), hours=2))
        status = "REJECT"
      else:
        pdt = min(END, rdt + timedelta(days=random.randint(1, 7), hours=2))
        status = "APPROVE"
      req_rows.append({
        "no": request_no, "member": uid, "wh": wh, "goods": g, "qty": qty,
        "type": rtype, "status": status, "rdt": rdt, "pdt": pdt, "proc": proc,
      })
      if status == "APPROVE":
        events.append({
          "dt": pdt, "kind": rtype, "wh": wh, "to_wh": None,
          "goods": g, "qty": qty, "member": proc, "request_no": request_no,
          "memo": "요청승인-%d" % request_no,
        })

  # 대기 요청 10건. 재고는 바꾸지 않는다.
  wait_reqs = [
    ("user01", 1, 1, 5, "IN", "노트북 추가 입고"),
    ("user02", 4, 2, 2, "OUT", "매장 모니터 출고"),
    ("user03", 2, 3, 10, "IN", "키보드 재고 보충"),
    ("user04", 5, 4, 4, "OUT", "마우스 매장 사용"),
    ("user05", 7, 15, 3, "IN", "A4용지 입고"),
    ("user06", 11, 21, 6, "OUT", "안전모 현장 지급"),
    ("user07", 3, 25, 1, "IN", "책상 1개 입고"),
    ("user08", 6, 28, 5, "OUT", "커피 매장 소모"),
    ("user09", 8, 30, 8, "IN", "멀티탭 추가 입고"),
    ("user10", 14, 9, 2, "OUT", "헤드셋 교체 출고"),
  ]
  for i, (uid, wh, g, qty, rtype, memo) in enumerate(wait_reqs):
    request_no += 1
    req_rows.append({
      "no": request_no, "member": uid, "wh": wh, "goods": g, "qty": qty,
      "type": rtype, "status": "WAIT", "rdt": datetime(2026, 8, 12, 9, 0, 0) + timedelta(hours=i * 6),
      "pdt": None, "proc": None, "memo": memo,
    })

  events.sort(key=lambda e: e["dt"])
  hist_sql = []
  history_no = 0
  group_no = 0

  def ensure(wh, goods, need):
    key = (wh, goods)
    have = stock.get(key, 0)
    if have < need:
      stock[key] = need

  def bump(wh, goods, delta):
    key = (wh, goods)
    before = stock.get(key, 0)
    after = before + delta
    if after < 0:
      return None
    stock[key] = after
    return before, after

  for ev in events:
    g = ev["goods"]
    qty = ev["qty"]
    if ev["kind"] == "MOVE":
      src, dst = ev["wh"], ev["to_wh"]
      ensure(src, g, qty)
      group_no += 1
      history_no += 1
      b1, a1 = bump(src, g, -qty)
      hist_sql.append((history_no, group_no, "OUT", src, g, qty, b1, a1, ev["member"], None, ev["dt"], ev["memo"]))
      history_no += 1
      b2, a2 = bump(dst, g, qty)
      hist_sql.append((history_no, group_no, "IN", dst, g, qty, b2, a2, ev["member"], None, ev["dt"], ev["memo"]))
      continue

    if ev["kind"] == "IN":
      group_no += 1
      history_no += 1
      b, af = bump(ev["wh"], g, qty)
      hist_sql.append((history_no, group_no, "IN", ev["wh"], g, qty, b, af, ev["member"], ev["request_no"], ev["dt"], ev["memo"]))
    elif ev["kind"] == "OUT":
      ensure(ev["wh"], g, qty)
      group_no += 1
      history_no += 1
      b, af = bump(ev["wh"], g, -qty)
      hist_sql.append((history_no, group_no, "OUT", ev["wh"], g, qty, b, af, ev["member"], ev["request_no"], ev["dt"], ev["memo"]))
    elif ev["kind"] == "ADJUST":
      key = (ev["wh"], g)
      before = stock.get(key, 0)
      target = max(0, ev["qty"])
      if target == before:
        target = before + 5
      group_no += 1
      history_no += 1
      stock[key] = target
      q = abs(target - before)
      hist_sql.append((history_no, group_no, "ADJUST", ev["wh"], g, q, before, target, ev["member"], None, ev["dt"], ev["memo"]))

  for r in req_rows:
    pdt = "NULL" if r["pdt"] is None else sql_date(r["pdt"])
    proc = "NULL" if r["proc"] is None else "'%s'" % r["proc"]
    memo = esc(r.get("memo") or "데모요청")
    a("INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)")
    a("VALUES (%d, '%s', %d, %d, %d, '%s', '%s', '%s', %s, %s, %s);" % (
      r["no"], r["member"], r["wh"], r["goods"], r["qty"], r["type"], r["status"], memo,
      sql_date(r["rdt"]), pdt, proc))

  for h in hist_sql:
    hn, gn, ht, wh, g, qty, b, af, mid, rn, dt, memo = h
    rns = "NULL" if rn is None else str(rn)
    a("INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)")
    a("VALUES (%d, %d, '%s', %d, %d, %d, %d, %d, '%s', %s, '%s', %s);" % (
      hn, gn, ht, wh, g, qty, b, af, mid, rns, esc(memo), sql_date(dt)))

  for wh in range(1, 16):
    for g in range(1, 31):
      qty = stock.get((wh, g), 0)
      a("INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (%d, %d, %d);" % (wh, g, qty))

  def rec_seq(name, nxt):
    a("WHENEVER SQLERROR CONTINUE")
    a("DROP SEQUENCE %s;" % name)
    a("WHENEVER SQLERROR EXIT SQL.SQLCODE")
    a("CREATE SEQUENCE %s START WITH %d INCREMENT BY 1 NOCACHE NOCYCLE;" % (name, nxt))

  rec_seq("seq_member", 24)
  rec_seq("seq_warehouse", 16)
  rec_seq("seq_category", 11)
  rec_seq("seq_goods", 31)
  rec_seq("seq_request", request_no + 1)
  rec_seq("seq_history", history_no + 1)
  rec_seq("seq_group", group_no + 1)
  a("COMMIT;")
  a("EXIT;")

  with open(OUT_SQL, "w", encoding="utf-8") as f:
    f.write("\n".join(lines) + "\n")
  print("wrote", OUT_SQL, "history", history_no, "request", request_no, "images", IMG_DIR)
  from collections import Counter
  print("hist types", Counter(h[2] for h in hist_sql))
  print("req status", Counter(r["status"] for r in req_rows))


if __name__ == "__main__":
  main()
