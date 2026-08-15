-- 카테고리·창고·품목·창고재고 샘플. 이미 있으면 건너뛴다.
SET DEFINE OFF

INSERT INTO tb_category (category_no, category_name, use_yn)
SELECT seq_category.nextval, '전자기기', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_category WHERE category_name = '전자기기');

INSERT INTO tb_category (category_no, category_name, use_yn)
SELECT seq_category.nextval, '사무용품', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_category WHERE category_name = '사무용품');

INSERT INTO tb_category (category_no, category_name, use_yn)
SELECT seq_category.nextval, '소모품', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_category WHERE category_name = '소모품');

INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn)
SELECT seq_warehouse.nextval, '본사창고', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_warehouse WHERE warehouse_name = '본사창고');

INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn)
SELECT seq_warehouse.nextval, '매장창고', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_warehouse WHERE warehouse_name = '매장창고');

INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn)
SELECT seq_warehouse.nextval, '예비창고', 'Y' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM tb_warehouse WHERE warehouse_name = '예비창고');

INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, use_yn)
SELECT seq_goods.nextval, 'NB-001', '노트북', c.category_no, '대', 3, 1200000, 'Y'
  FROM tb_category c
 WHERE c.category_name = '전자기기'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'NB-001');

INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, use_yn)
SELECT seq_goods.nextval, 'MS-001', '무선마우스', c.category_no, '개', 10, 25000, 'Y'
  FROM tb_category c
 WHERE c.category_name = '전자기기'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'MS-001');

INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, use_yn)
SELECT seq_goods.nextval, 'PEN-001', '볼펜', c.category_no, '개', 50, 500, 'Y'
  FROM tb_category c
 WHERE c.category_name = '사무용품'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'PEN-001');

INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, use_yn)
SELECT seq_goods.nextval, 'A4-001', 'A4용지', c.category_no, '박스', 10, 25000, 'Y'
  FROM tb_category c
 WHERE c.category_name = '소모품'
   AND NOT EXISTS (SELECT 1 FROM tb_goods WHERE goods_code = 'A4-001');

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 8
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'NB-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 1
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'NB-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 40
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'MS-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 5
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'MS-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 200
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'PEN-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 20
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'PEN-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 24
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '본사창고' AND g.goods_code = 'A4-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty)
SELECT w.warehouse_no, g.goods_no, 4
  FROM tb_warehouse w, tb_goods g
 WHERE w.warehouse_name = '매장창고' AND g.goods_code = 'A4-001'
   AND NOT EXISTS (
     SELECT 1 FROM tb_warehouse_stock s
      WHERE s.warehouse_no = w.warehouse_no AND s.goods_no = g.goods_no
   );

-- 샘플 품목 대표 이미지. 파일은 C:/Temp/stock 에 둔다.
UPDATE tb_goods SET image_path = 'seed_nb001.png' WHERE goods_code = 'NB-001' AND image_path IS NULL;
UPDATE tb_goods SET image_path = 'seed_ms001.png' WHERE goods_code = 'MS-001' AND image_path IS NULL;
UPDATE tb_goods SET image_path = 'seed_pen001.png' WHERE goods_code = 'PEN-001' AND image_path IS NULL;
UPDATE tb_goods SET image_path = 'seed_a4001.png' WHERE goods_code = 'A4-001' AND image_path IS NULL;

COMMIT;

-- 대시보드 카드·표·차트 더미
@@seed-dashboard.sql

