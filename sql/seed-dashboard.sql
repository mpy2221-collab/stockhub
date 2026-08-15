-- 대시보드 카드·표·차트용 더미. 이미 있으면 건너뛴다.
SET DEFINE OFF

-- 미달 품목: 안전재고 30, 합계 8
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, use_yn)
SELECT seq_goods.nextval, 'TAP-001', '투명테이프', c.category_no, '개', 30, 1500, 'Y'
  FROM tb_category c
 WHERE c.category_name = '소모품'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'TAP-001');

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 5
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'TAP-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 3
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'TAP-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

-- 오늘 입고
INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'IN', w.warehouse_no, g.goods_no,
       20, 130, 150, 'admin', 'DASH-SEED-TODAY-IN', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'FR-001'
   AND EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'FR-001')
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-TODAY-IN');

INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'IN', w.warehouse_no, g.goods_no,
       20, 180, 200, 'admin', 'DASH-SEED-TODAY-IN', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'PEN-001'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'FR-001')
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-TODAY-IN');

-- 오늘 출고
INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'OUT', w.warehouse_no, g.goods_no,
       5, 220, 215, 'admin', 'DASH-SEED-TODAY-OUT', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'PEN-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-TODAY-OUT');

-- 오늘 조정 (카드 합계에서 빼야 함)
INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'ADJUST', w.warehouse_no, g.goods_no,
       2, 4, 6, 'admin', 'DASH-SEED-TODAY-ADJ', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'A4-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-TODAY-ADJ');

-- 이번 달(오늘 제외) 입고·출고
INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'IN', w.warehouse_no, g.goods_no,
       15, 25, 40, 'admin', 'DASH-SEED-MONTH-IN',
       TRUNC(SYSDATE, 'MM') + 2
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'MS-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-MONTH-IN');

INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'OUT', w.warehouse_no, g.goods_no,
       8, 40, 32, 'user01', 'DASH-SEED-MONTH-OUT',
       TRUNC(SYSDATE, 'MM') + 3
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'MS-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-MONTH-OUT');

-- 최근 5개월 월별 IN/OUT (차트). dual 계층만 쓰고 품목과 조인한다.
INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'IN', w.warehouse_no, g.goods_no,
       10 + m.n, 0, 10 + m.n, 'admin', 'DASH-SEED-M' || m.n || '-IN',
       ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -m.n) + 8
  FROM tb_warehouse w, tb_goods g,
       (SELECT LEVEL n FROM dual CONNECT BY LEVEL <= 5) m
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'A4-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-M' || m.n || '-IN');

INSERT INTO tb_stock_history (
  history_no, group_no, history_type, warehouse_no, goods_no, qty,
  before_qty, after_qty, member_id, memo, history_date
)
SELECT seq_history.nextval, seq_group.nextval, 'OUT', w.warehouse_no, g.goods_no,
       4 + m.n, 20, 16 - m.n, 'admin', 'DASH-SEED-M' || m.n || '-OUT',
       ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -m.n) + 12
  FROM tb_warehouse w, tb_goods g,
       (SELECT LEVEL n FROM dual CONNECT BY LEVEL <= 5) m
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'NB-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_history WHERE memo = 'DASH-SEED-M' || m.n || '-OUT');

-- 대기 요청
INSERT INTO tb_stock_request (
  request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date
)
SELECT seq_request.nextval, 'user01', w.warehouse_no, g.goods_no, 10, 'IN', 'WAIT',
       'DASH-SEED-WAIT-IN', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'TAP-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_request WHERE memo = 'DASH-SEED-WAIT-IN');

INSERT INTO tb_stock_request (
  request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date
)
SELECT seq_request.nextval, 'user01', w.warehouse_no, g.goods_no, 3, 'OUT', 'WAIT',
       'DASH-SEED-WAIT-OUT', SYSDATE
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'PEN-001'
   AND NOT EXISTS (SELECT 1 FROM tb_stock_request WHERE memo = 'DASH-SEED-WAIT-OUT');

COMMIT;
EXIT;
