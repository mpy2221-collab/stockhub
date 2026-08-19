SET DEFINE OFF
WHENEVER SQLERROR EXIT SQL.SQLCODE
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
DELETE FROM tb_stock_history;
DELETE FROM tb_stock_request;
DELETE FROM tb_warehouse_stock;
DELETE FROM tb_goods;
DELETE FROM tb_category;
DELETE FROM tb_warehouse;
DELETE FROM tb_member;
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (1, 'admin1', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '관리자1', '010-1000-0001', '서울 본사', 'admin1@stockhub.local', 1, DATE '2025-01-02');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (2, 'admin2', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '관리자2', '010-1000-0002', '서울 본사', 'admin2@stockhub.local', 1, DATE '2025-01-02');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (3, 'admin3', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '관리자3', '010-1000-0003', '서울 본사', 'admin3@stockhub.local', 1, DATE '2025-01-02');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (4, 'user01', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반1', '010-2000-0001', '서울 매장', 'user01@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (5, 'user02', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반2', '010-2000-0002', '서울 매장', 'user02@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (6, 'user03', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반3', '010-2000-0003', '서울 매장', 'user03@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (7, 'user04', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반4', '010-2000-0004', '서울 매장', 'user04@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (8, 'user05', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반5', '010-2000-0005', '서울 매장', 'user05@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (9, 'user06', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반6', '010-2000-0006', '서울 매장', 'user06@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (10, 'user07', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반7', '010-2000-0007', '서울 매장', 'user07@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (11, 'user08', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반8', '010-2000-0008', '서울 매장', 'user08@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (12, 'user09', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반9', '010-2000-0009', '서울 매장', 'user09@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (13, 'user10', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반10', '010-2000-0010', '서울 매장', 'user10@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (14, 'user11', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반11', '010-2000-0011', '서울 매장', 'user11@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (15, 'user12', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반12', '010-2000-0012', '서울 매장', 'user12@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (16, 'user13', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반13', '010-2000-0013', '서울 매장', 'user13@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (17, 'user14', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반14', '010-2000-0014', '서울 매장', 'user14@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (18, 'user15', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반15', '010-2000-0015', '서울 매장', 'user15@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (19, 'user16', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반16', '010-2000-0016', '서울 매장', 'user16@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (20, 'user17', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반17', '010-2000-0017', '서울 매장', 'user17@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (21, 'user18', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반18', '010-2000-0018', '서울 매장', 'user18@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (22, 'user19', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반19', '010-2000-0019', '서울 매장', 'user19@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_member (member_no, member_id, member_pw, member_name, member_phone, member_addr, member_email, member_level, enroll_date)
VALUES (23, 'user20', '$2a$10$Jyn8B0zxOsflsCRkvIPIoe/1bnYoNNKeHWo3Y9wjDTPylo.kAlHQS', '일반20', '010-2000-0020', '서울 매장', 'user20@stockhub.local', 3, DATE '2025-01-05');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (1, '본사창고', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (2, '제1물류센터', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (3, '제2물류센터', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (4, '서울매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (5, '부산매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (6, '대구매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (7, '인천매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (8, '광주매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (9, '대전매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (10, '울산매장', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (11, '수원창고', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (12, '성남창고', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (13, '예비창고', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (14, '반품창고', 'Y');
INSERT INTO tb_warehouse (warehouse_no, warehouse_name, use_yn) VALUES (15, '냉동창고', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (1, '전자기기', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (2, '사무용품', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (3, '소모품', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (4, '포장자재', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (5, '안전용품', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (6, '청소용품', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (7, '가구', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (8, '음료', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (9, '공구', 'Y');
INSERT INTO tb_category (category_no, category_name, use_yn) VALUES (10, '비품', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (1, 'GDS-001', '노트북', 1, '대', 5, 1200000, 'g01.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (2, 'GDS-002', '모니터', 1, '대', 8, 280000, 'g02.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (3, 'GDS-003', '키보드', 1, '개', 20, 45000, 'g03.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (4, 'GDS-004', '마우스', 1, '개', 20, 25000, 'g04.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (5, 'GDS-005', '웹캠', 1, '개', 10, 89000, 'g05.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (6, 'GDS-006', 'USB허브', 1, '개', 15, 22000, 'g06.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (7, 'GDS-007', 'HDMI케이블', 1, '개', 30, 8000, 'g07.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (8, 'GDS-008', '노트북가방', 10, '개', 10, 39000, 'g08.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (9, 'GDS-009', '헤드셋', 1, '개', 12, 65000, 'g09.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (10, 'GDS-010', '스피커', 1, '개', 8, 54000, 'g10.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (11, 'GDS-011', '볼펜', 3, '개', 80, 500, 'g11.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (12, 'GDS-012', '노트', 2, '권', 40, 1500, 'g12.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (13, 'GDS-013', '스테이플러', 2, '개', 15, 4500, 'g13.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (14, 'GDS-014', '클립', 3, '박스', 20, 2000, 'g14.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (15, 'GDS-015', 'A4용지', 3, '박스', 12, 25000, 'g15.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (16, 'GDS-016', '파일철', 2, '개', 25, 1800, 'g16.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (17, 'GDS-017', '화이트보드', 2, '개', 4, 35000, 'g17.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (18, 'GDS-018', '마커', 3, '개', 40, 1200, 'g18.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (19, 'GDS-019', '테이프', 3, '개', 30, 1500, 'g19.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (20, 'GDS-020', '박스테이프', 4, '개', 20, 2800, 'g20.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (21, 'GDS-021', '안전모', 5, '개', 10, 18000, 'g21.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (22, 'GDS-022', '안전화', 5, '켤레', 8, 42000, 'g22.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (23, 'GDS-023', '청소포', 6, '팩', 15, 6000, 'g23.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (24, 'GDS-024', '세제', 6, '개', 10, 8900, 'g24.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (25, 'GDS-025', '책상', 7, '개', 3, 180000, 'g25.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (26, 'GDS-026', '의자', 7, '개', 6, 95000, 'g26.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (27, 'GDS-027', '생수', 8, '팩', 20, 7000, 'g27.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (28, 'GDS-028', '커피', 8, '박스', 8, 24000, 'g28.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (29, 'GDS-029', '드라이버세트', 9, '세트', 7, 32000, 'g29.png', 'Y');
INSERT INTO tb_goods (goods_no, goods_code, goods_name, category_no, unit, safety_qty, unit_price, image_path, use_yn)
VALUES (30, 'GDS-030', '멀티탭', 1, '개', 18, 12000, 'g30.png', 'Y');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (1, 'user01', 1, 3, 4, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-02-24 07:05:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-03 09:05:47','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (2, 'user01', 2, 4, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-10-01 02:50:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-07 04:50:17','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (3, 'user01', 3, 5, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-11-07 19:32:42','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-13 21:32:42','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (4, 'user01', 4, 6, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-02-21 20:47:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-24 22:47:08','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (5, 'user01', 5, 7, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-03-31 23:07:33','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-04 01:07:33','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (6, 'user01', 6, 8, 3, 'IN', 'REJECT', '데모요청', TO_DATE('2026-03-28 07:58:37','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-31 09:58:37','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (7, 'user01', 7, 9, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-03-26 13:46:11','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-31 15:46:11','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (8, 'user01', 8, 10, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-09-26 21:04:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-02 23:04:29','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (9, 'user01', 9, 11, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-09-02 00:22:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-06 02:22:08','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (10, 'user01', 10, 12, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-02-02 14:37:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-03 16:37:00','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (11, 'user01', 11, 13, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-03-25 05:22:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-27 07:22:48','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (12, 'user01', 12, 14, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-04 20:25:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-10 22:25:29','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (13, 'user02', 2, 6, 5, 'IN', 'REJECT', '데모요청', TO_DATE('2025-01-02 16:31:39','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-07 18:31:39','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (14, 'user02', 3, 7, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-02-23 14:28:21','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-01 16:28:21','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (15, 'user02', 4, 8, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-31 15:57:06','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-06 17:57:06','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (16, 'user02', 5, 9, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-06-03 10:00:03','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-06 12:00:03','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (17, 'user02', 6, 10, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-24 17:24:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-02 19:24:22','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (18, 'user02', 7, 11, 4, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-04-30 09:27:31','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-03 11:27:31','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (19, 'user02', 8, 12, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-04-08 04:11:03','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-14 06:11:03','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (20, 'user02', 9, 13, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-30 06:26:55','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-02 08:26:55','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (21, 'user02', 10, 14, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-14 13:59:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-17 15:59:44','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (22, 'user02', 11, 15, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-26 21:54:24','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-29 23:54:24','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (23, 'user02', 12, 16, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2025-04-10 05:48:59','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-12 07:48:59','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (24, 'user02', 13, 17, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-01 20:10:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-05 22:10:58','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (25, 'user03', 3, 9, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-08-05 11:14:20','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-07 13:14:20','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (26, 'user03', 4, 10, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-03-19 09:53:27','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-22 11:53:27','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (27, 'user03', 5, 11, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-02 23:17:23','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-10 01:17:23','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (28, 'user03', 6, 12, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-08-25 09:38:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-28 11:38:22','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (29, 'user03', 7, 13, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-12-01 06:41:45','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-08 08:41:45','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (30, 'user03', 8, 14, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2026-04-17 13:59:28','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-23 15:59:28','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (31, 'user03', 9, 15, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-12-28 13:00:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-01 15:00:29','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (32, 'user03', 10, 16, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-10 03:36:16','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-12 05:36:16','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (33, 'user03', 11, 17, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-03 21:49:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-10 23:49:47','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (34, 'user03', 12, 18, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-27 00:18:56','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-29 02:18:56','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (35, 'user03', 13, 19, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-03-08 05:42:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-11 07:42:12','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (36, 'user03', 14, 20, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-01 00:07:56','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-07 02:07:56','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (37, 'user04', 4, 12, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2025-09-18 17:21:43','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-19 19:21:43','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (38, 'user04', 5, 13, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-07 19:13:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-09 21:13:47','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (39, 'user04', 6, 14, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-08-30 11:38:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-01 13:38:17','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (40, 'user04', 7, 15, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-06-05 01:03:03','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-07 03:03:03','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (41, 'user04', 8, 16, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-06 06:29:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-08 08:29:10','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (42, 'user04', 9, 17, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-04-21 03:58:21','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-28 05:58:21','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (43, 'user04', 10, 18, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-26 22:36:59','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-03 00:36:59','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (44, 'user04', 11, 19, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-05-05 12:40:39','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-10 14:40:39','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (45, 'user04', 12, 20, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-13 07:56:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-19 09:56:18','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (46, 'user04', 13, 21, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-20 08:51:30','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-24 10:51:30','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (47, 'user04', 14, 22, 3, 'IN', 'REJECT', '데모요청', TO_DATE('2025-04-25 23:55:45','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-02 01:55:45','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (48, 'user04', 15, 23, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-01-05 16:21:46','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-12 18:21:46','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (49, 'user05', 5, 15, 8, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-08-22 11:42:04','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-23 13:42:04','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (50, 'user05', 6, 16, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-27 14:17:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-29 16:17:58','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (51, 'user05', 7, 17, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-25 21:44:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-30 23:44:08','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (52, 'user05', 8, 18, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-09 09:08:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-14 11:08:18','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (53, 'user05', 9, 19, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-04-05 15:17:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-09 17:17:17','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (54, 'user05', 10, 20, 3, 'IN', 'REJECT', '데모요청', TO_DATE('2025-12-28 06:34:39','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-03 08:34:39','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (55, 'user05', 11, 21, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-11 12:07:21','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-16 14:07:21','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (56, 'user05', 12, 22, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-10 23:52:50','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-15 01:52:50','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (57, 'user05', 13, 23, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-07-14 01:14:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-19 03:14:18','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (58, 'user05', 14, 24, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-03-02 22:04:24','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-07 00:04:24','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (59, 'user05', 15, 25, 3, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-08-01 23:44:31','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-09 01:44:31','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (60, 'user05', 1, 26, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-12-16 22:54:30','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-20 00:54:30','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (61, 'user06', 6, 18, 8, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-12 09:52:57','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-19 11:52:57','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (62, 'user06', 7, 19, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-08-04 18:27:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-11 20:27:29','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (63, 'user06', 8, 20, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-02-10 06:43:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-14 08:43:58','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (64, 'user06', 9, 21, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-06 04:51:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-09 06:51:58','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (65, 'user06', 10, 22, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-03-02 13:23:39','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-08 15:23:39','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (66, 'user06', 11, 23, 4, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-07-02 12:16:37','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-05 14:16:37','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (67, 'user06', 12, 24, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-09-06 16:49:05','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-11 18:49:05','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (68, 'user06', 13, 25, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-04-18 20:28:46','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-20 22:28:46','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (69, 'user06', 14, 26, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-10-25 21:17:43','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-31 23:17:43','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (70, 'user06', 15, 27, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-07-04 01:36:26','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-06 03:36:26','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (71, 'user06', 1, 28, 2, 'IN', 'REJECT', '데모요청', TO_DATE('2025-11-19 14:41:53','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-23 16:41:53','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (72, 'user06', 2, 29, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-02-26 20:00:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-02 22:00:17','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (73, 'user07', 7, 21, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-02-18 17:43:01','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-20 19:43:01','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (74, 'user07', 8, 22, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-23 17:02:34','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-27 19:02:34','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (75, 'user07', 9, 23, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-31 01:01:45','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-06 03:01:45','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (76, 'user07', 10, 24, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-19 00:43:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-24 02:43:02','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (77, 'user07', 11, 25, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-06 20:32:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-07 22:32:48','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (78, 'user07', 12, 26, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2025-08-21 07:32:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-28 09:32:35','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (79, 'user07', 13, 27, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-11-22 20:07:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-27 22:07:22','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (80, 'user07', 14, 28, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-25 23:34:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-31 01:34:17','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (81, 'user07', 15, 29, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-14 22:26:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-17 00:26:35','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (82, 'user07', 1, 30, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-06-20 19:18:56','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-23 21:18:56','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (83, 'user07', 2, 1, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-01-13 14:01:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-14 16:01:22','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (84, 'user07', 3, 2, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-09-19 10:54:31','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-25 12:54:31','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (85, 'user08', 8, 24, 7, 'IN', 'REJECT', '데모요청', TO_DATE('2025-11-11 10:00:32','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-17 12:00:32','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (86, 'user08', 9, 25, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-12-30 09:47:01','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-01 11:47:01','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (87, 'user08', 10, 26, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-02-20 05:47:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-21 07:47:10','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (88, 'user08', 11, 27, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-06 02:40:51','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-11 04:40:51','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (89, 'user08', 12, 28, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-01-22 10:13:07','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-23 12:13:07','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (90, 'user08', 13, 29, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-11-30 06:55:16','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-02 08:55:16','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (91, 'user08', 14, 30, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-12-25 23:40:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-28 01:40:58','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (92, 'user08', 15, 1, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-22 10:39:54','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-26 12:39:54','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (93, 'user08', 1, 2, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-06-14 18:38:01','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-18 20:38:01','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (94, 'user08', 2, 3, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-09-20 12:27:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-27 14:27:58','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (95, 'user08', 3, 4, 5, 'IN', 'REJECT', '데모요청', TO_DATE('2025-08-05 12:04:45','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-12 14:04:45','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (96, 'user08', 4, 5, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-11-24 19:32:16','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-27 21:32:16','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (97, 'user09', 9, 27, 8, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-03-05 23:50:34','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-10 01:50:34','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (98, 'user09', 10, 28, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-06 03:49:27','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-11 05:49:27','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (99, 'user09', 11, 29, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-09-30 04:44:01','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-02 06:44:01','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (100, 'user09', 12, 30, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-23 16:08:20','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-02 18:08:20','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (101, 'user09', 13, 1, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-02-01 15:27:57','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-08 17:27:57','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (102, 'user09', 14, 2, 2, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-12 10:41:41','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-14 12:41:41','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (103, 'user09', 15, 3, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-01-17 04:54:39','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-22 06:54:39','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (104, 'user09', 1, 4, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-07-05 15:48:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-07 17:48:00','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (105, 'user09', 2, 5, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-05 08:37:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-06 10:37:02','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (106, 'user09', 3, 6, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-06-19 16:09:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-23 18:09:12','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (107, 'user09', 4, 7, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-07-19 09:43:43','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-26 11:43:43','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (108, 'user09', 5, 8, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-05-11 16:48:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-16 18:48:58','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (109, 'user10', 10, 30, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2026-08-05 07:20:40','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-11 09:20:40','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (110, 'user10', 11, 1, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-28 12:05:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-31 18:00:00','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (111, 'user10', 12, 2, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-08-30 23:11:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-01 01:11:08','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (112, 'user10', 13, 3, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-01-21 07:40:49','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-24 09:40:49','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (113, 'user10', 14, 4, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-11 11:40:06','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-15 13:40:06','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (114, 'user10', 15, 5, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-07-10 17:50:24','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-12 19:50:24','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (115, 'user10', 1, 6, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-04-06 06:30:14','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-12 08:30:14','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (116, 'user10', 2, 7, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-05-03 13:38:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-05 15:38:44','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (117, 'user10', 3, 8, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-26 21:37:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-03 23:37:10','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (118, 'user10', 4, 9, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-16 20:30:46','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-21 22:30:46','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (119, 'user10', 5, 10, 8, 'IN', 'REJECT', '데모요청', TO_DATE('2025-04-05 09:37:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-12 11:37:47','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (120, 'user10', 6, 11, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-02-02 06:35:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-05 08:35:02','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (121, 'user11', 11, 3, 6, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-11-30 02:32:41','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-06 04:32:41','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (122, 'user11', 12, 4, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-02-23 22:26:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-01 00:26:48','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (123, 'user11', 13, 5, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-09-23 10:00:36','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-24 12:00:36','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (124, 'user11', 14, 6, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-23 15:27:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-30 17:27:44','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (125, 'user11', 15, 7, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-03-24 08:23:13','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-28 10:23:13','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (126, 'user11', 1, 8, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2026-05-10 01:09:54','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-17 03:09:54','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (127, 'user11', 2, 9, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-07-04 18:11:19','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-06 20:11:19','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (128, 'user11', 3, 10, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-05-18 04:25:51','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-24 06:25:51','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (129, 'user11', 4, 11, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-05-21 14:24:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-24 16:24:18','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (130, 'user11', 5, 12, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-02-23 09:16:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-02 11:16:12','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (131, 'user11', 6, 13, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-12-28 10:52:30','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-01 12:52:30','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (132, 'user11', 7, 14, 8, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-23 04:18:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-28 06:18:58','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (133, 'user12', 12, 6, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2025-09-08 17:11:34','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-15 19:11:34','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (134, 'user12', 13, 7, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-03-09 16:30:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-12 18:30:48','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (135, 'user12', 14, 8, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-07-09 18:56:38','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-16 20:56:38','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (136, 'user12', 15, 9, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-19 23:46:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-25 01:46:02','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (137, 'user12', 1, 10, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-10-22 17:52:21','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-25 19:52:21','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (138, 'user12', 2, 11, 2, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-01-20 07:32:27','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-27 09:32:27','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (139, 'user12', 3, 12, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-05-22 14:44:26','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-26 16:44:26','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (140, 'user12', 4, 13, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-10-03 23:25:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-11 01:25:00','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (141, 'user12', 5, 14, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-09-22 17:22:33','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-25 19:22:33','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (142, 'user12', 6, 15, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-30 00:00:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-03 02:00:44','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (143, 'user12', 7, 16, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2025-01-09 06:13:49','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-14 08:13:49','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (144, 'user12', 8, 17, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-03-08 20:56:28','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-10 22:56:28','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (145, 'user13', 13, 9, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-11-13 01:22:09','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-17 03:22:09','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (146, 'user13', 14, 10, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-13 06:12:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-15 08:12:48','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (147, 'user13', 15, 11, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-06 04:01:07','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-12 06:01:07','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (148, 'user13', 1, 12, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-01-17 14:34:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-21 16:34:22','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (149, 'user13', 2, 13, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-01-14 18:26:15','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-15 20:26:15','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (150, 'user13', 3, 14, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2025-06-22 11:51:22','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-26 13:51:22','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (151, 'user13', 4, 15, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-09 08:32:13','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-12 10:32:13','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (152, 'user13', 5, 16, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-03-29 01:58:54','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-01 03:58:54','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (153, 'user13', 6, 17, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-07 06:29:01','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-12 08:29:01','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (154, 'user13', 7, 18, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-27 20:57:57','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-03 22:57:57','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (155, 'user13', 8, 19, 6, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-09-15 07:23:48','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-18 09:23:48','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (156, 'user13', 9, 20, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-12-19 19:25:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-22 21:25:29','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (157, 'user14', 14, 12, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-15 15:30:15','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-17 17:30:15','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (158, 'user14', 15, 13, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-07-15 14:42:52','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-17 16:42:52','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (159, 'user14', 1, 14, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-04-04 05:39:42','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-10 07:39:42','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (160, 'user14', 2, 15, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-16 09:14:38','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-22 11:14:38','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (161, 'user14', 3, 16, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-05-30 03:34:57','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-01 05:34:57','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (162, 'user14', 4, 17, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-01-12 11:06:57','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-15 13:06:57','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (163, 'user14', 5, 18, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-04-04 07:41:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-11 09:41:47','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (164, 'user14', 6, 19, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-09 21:59:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-12 23:59:08','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (165, 'user14', 7, 20, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-06-01 03:36:50','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-04 05:36:50','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (166, 'user14', 8, 21, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-10-08 16:18:38','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-10 18:18:38','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (167, 'user14', 9, 22, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2025-01-12 08:44:40','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-18 10:44:40','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (168, 'user14', 10, 23, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-04-09 16:40:38','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-12 18:40:38','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (169, 'user15', 15, 15, 2, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-02-12 17:26:19','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-17 19:26:19','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (170, 'user15', 1, 16, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-27 01:48:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-29 03:48:08','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (171, 'user15', 2, 17, 7, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-09 02:03:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-13 04:03:47','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (172, 'user15', 3, 18, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-01-10 21:38:37','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-15 23:38:37','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (173, 'user15', 4, 19, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-12-31 23:11:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-05 01:11:35','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (174, 'user15', 5, 20, 5, 'IN', 'REJECT', '데모요청', TO_DATE('2025-09-23 00:13:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-25 02:13:08','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (175, 'user15', 6, 21, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-16 11:32:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-23 13:32:17','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (176, 'user15', 7, 22, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-03-30 23:44:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-07 01:44:18','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (177, 'user15', 8, 23, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-11-08 14:43:41','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-12 16:43:41','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (178, 'user15', 9, 24, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-03-25 13:27:14','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-31 15:27:14','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (179, 'user15', 10, 25, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-02-12 00:20:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-14 02:20:44','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (180, 'user15', 11, 26, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-03-14 13:05:25','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-17 15:05:25','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (181, 'user16', 1, 18, 2, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-13 03:36:53','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-14 05:36:53','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (182, 'user16', 2, 19, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-18 03:15:31','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-22 05:15:31','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (183, 'user16', 3, 20, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-04-09 09:36:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-16 11:36:35','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (184, 'user16', 4, 21, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-06-25 16:06:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-02 18:06:47','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (185, 'user16', 5, 22, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-10-23 19:45:37','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-27 21:45:37','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (186, 'user16', 6, 23, 5, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-08-20 08:03:50','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-27 10:03:50','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (187, 'user16', 7, 24, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-11-30 10:58:03','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-03 12:58:03','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (188, 'user16', 8, 25, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-28 17:47:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-29 19:47:18','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (189, 'user16', 9, 26, 6, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-07-30 05:15:52','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-31 07:15:52','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (190, 'user16', 10, 27, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-06-11 18:26:50','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-17 20:26:50','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (191, 'user16', 11, 28, 3, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-25 22:21:40','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-01 00:21:40','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (192, 'user16', 12, 29, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-05-03 08:45:23','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-05 10:45:23','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (193, 'user17', 2, 21, 3, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-03-06 02:52:52','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-07 04:52:52','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (194, 'user17', 3, 22, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-01-03 10:52:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-01-07 12:52:44','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (195, 'user17', 4, 23, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-06-20 19:48:33','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-25 21:48:33','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (196, 'user17', 5, 24, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-08-15 14:28:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-16 16:28:00','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (197, 'user17', 6, 25, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-08-13 03:39:51','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-19 05:39:51','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (198, 'user17', 7, 26, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2026-07-01 09:38:16','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-08 11:38:16','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (199, 'user17', 8, 27, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-02-25 15:53:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-03-03 17:53:12','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (200, 'user17', 9, 28, 3, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-07-25 20:39:20','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-01 22:39:20','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (201, 'user17', 10, 29, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-05-01 20:55:32','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-06 22:55:32','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (202, 'user17', 11, 30, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-06-04 00:37:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-08 02:37:02','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (203, 'user17', 12, 1, 2, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-02-28 08:22:42','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-02 10:22:42','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (204, 'user17', 13, 2, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-04-27 02:21:49','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-30 04:21:49','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (205, 'user18', 3, 24, 8, 'IN', 'REJECT', '데모요청', TO_DATE('2025-04-21 20:28:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-22 22:28:35','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (206, 'user18', 4, 25, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-05-10 06:01:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-17 08:01:29','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (207, 'user18', 5, 26, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-04-08 13:25:29','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-14 15:25:29','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (208, 'user18', 6, 27, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-03-19 11:47:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-22 13:47:18','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (209, 'user18', 7, 28, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-04-07 23:07:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-04-12 01:07:12','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (210, 'user18', 8, 29, 7, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-08-25 13:40:14','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-31 15:40:14','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (211, 'user18', 9, 30, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-07-31 20:02:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-05 22:02:12','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (212, 'user18', 10, 1, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-19 22:00:36','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-24 00:00:36','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (213, 'user18', 11, 2, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-04-10 21:12:41','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-11 23:12:41','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (214, 'user18', 12, 3, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-07-25 21:42:17','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-28 23:42:17','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (215, 'user18', 13, 4, 6, 'IN', 'REJECT', '데모요청', TO_DATE('2025-07-14 20:11:45','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-15 22:11:45','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (216, 'user18', 14, 5, 2, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-06-28 04:27:37','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-04 06:27:37','YYYY-MM-DD HH24:MI:SS'), 'admin3');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (217, 'user19', 4, 27, 8, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-03-24 03:29:18','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-29 05:29:18','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (218, 'user19', 5, 28, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-18 09:10:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-24 11:10:00','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (219, 'user19', 6, 29, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-29 17:02:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-03 19:02:58','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (220, 'user19', 7, 30, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-17 02:22:58','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-24 04:22:58','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (221, 'user19', 8, 1, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-01-01 19:46:15','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-06 21:46:15','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (222, 'user19', 9, 2, 7, 'IN', 'REJECT', '데모요청', TO_DATE('2025-12-10 20:45:12','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-13 22:45:12','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (223, 'user19', 10, 3, 3, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-01 00:20:06','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-05 02:20:06','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (224, 'user19', 11, 4, 7, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-01-18 07:25:59','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-19 09:25:59','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (225, 'user19', 12, 5, 5, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-09-28 15:27:51','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-02 17:27:51','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (226, 'user19', 13, 6, 4, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-09-07 17:57:34','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-13 19:57:34','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (227, 'user19', 14, 7, 2, 'OUT', 'REJECT', '데모요청', TO_DATE('2025-05-06 06:59:33','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-05-09 08:59:33','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (228, 'user19', 15, 8, 5, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-06-24 04:00:52','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-28 06:00:52','YYYY-MM-DD HH24:MI:SS'), 'admin1');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (229, 'user20', 5, 30, 4, 'IN', 'REJECT', '데모요청', TO_DATE('2026-05-31 00:27:08','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-04 02:27:08','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (230, 'user20', 6, 1, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-08-15 01:44:35','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-20 03:44:35','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (231, 'user20', 7, 2, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-12-20 15:34:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-21 17:34:10','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (232, 'user20', 8, 3, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-07-16 10:03:20','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-19 12:03:20','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (233, 'user20', 9, 4, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-08-24 10:20:13','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-08-28 12:20:13','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (234, 'user20', 10, 5, 8, 'OUT', 'REJECT', '데모요청', TO_DATE('2026-02-05 01:46:09','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-12 03:46:09','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (235, 'user20', 11, 6, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2026-05-27 04:40:41','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-03 06:40:41','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (236, 'user20', 12, 7, 6, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-12-26 04:51:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-30 06:51:47','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (237, 'user20', 13, 8, 2, 'IN', 'APPROVE', '데모요청', TO_DATE('2025-05-27 01:47:31','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-01 03:47:31','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (238, 'user20', 14, 9, 4, 'OUT', 'APPROVE', '데모요청', TO_DATE('2026-04-29 23:44:11','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-07 01:44:11','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (239, 'user20', 15, 10, 5, 'IN', 'REJECT', '데모요청', TO_DATE('2026-05-02 03:27:50','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-06 05:27:50','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (240, 'user20', 1, 11, 8, 'OUT', 'APPROVE', '데모요청', TO_DATE('2025-02-10 11:06:47','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-02-12 13:06:47','YYYY-MM-DD HH24:MI:SS'), 'admin2');
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (241, 'user01', 1, 1, 5, 'IN', 'WAIT', '노트북 추가 입고', TO_DATE('2026-08-12 09:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (242, 'user02', 4, 2, 2, 'OUT', 'WAIT', '매장 모니터 출고', TO_DATE('2026-08-12 15:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (243, 'user03', 2, 3, 10, 'IN', 'WAIT', '키보드 재고 보충', TO_DATE('2026-08-12 21:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (244, 'user04', 5, 4, 4, 'OUT', 'WAIT', '마우스 매장 사용', TO_DATE('2026-08-13 03:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (245, 'user05', 7, 15, 3, 'IN', 'WAIT', 'A4용지 입고', TO_DATE('2026-08-13 09:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (246, 'user06', 11, 21, 6, 'OUT', 'WAIT', '안전모 현장 지급', TO_DATE('2026-08-13 15:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (247, 'user07', 3, 25, 1, 'IN', 'WAIT', '책상 1개 입고', TO_DATE('2026-08-13 21:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (248, 'user08', 6, 28, 5, 'OUT', 'WAIT', '커피 매장 소모', TO_DATE('2026-08-14 03:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (249, 'user09', 8, 30, 8, 'IN', 'WAIT', '멀티탭 추가 입고', TO_DATE('2026-08-14 09:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_request (request_no, member_id, warehouse_no, goods_no, qty, request_type, status, memo, request_date, process_date, process_member_id)
VALUES (250, 'user10', 14, 9, 2, 'OUT', 'WAIT', '헤드셋 교체 출고', TO_DATE('2026-08-14 15:00:00','YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (1, 1, 'OUT', 11, 11, 6, 500, 494, 'admin2', NULL, '데모-OUT', TO_DATE('2025-01-01 19:39:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (2, 2, 'IN', 10, 10, 27, 500, 527, 'admin1', NULL, '데모-IN', TO_DATE('2025-01-03 21:29:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (3, 3, 'IN', 11, 26, 26, 500, 526, 'admin3', NULL, '데모-IN', TO_DATE('2025-01-04 03:05:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (4, 4, 'ADJUST', 3, 2, 18, 0, 18, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-01-06 10:08:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (5, 5, 'ADJUST', 14, 14, 491, 500, 9, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-01-06 23:02:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (6, 6, 'OUT', 9, 24, 5, 500, 495, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-01-07 10:49:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (7, 6, 'IN', 10, 24, 5, 0, 5, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-01-07 10:49:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (8, 7, 'IN', 3, 22, 3, 0, 3, 'admin2', 194, '요청승인-194', TO_DATE('2025-01-07 12:52:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (9, 8, 'ADJUST', 10, 9, 9, 0, 9, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-01-10 07:01:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (10, 9, 'OUT', 15, 23, 7, 7, 0, 'admin1', 48, '요청승인-48', TO_DATE('2025-01-12 18:21:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (11, 10, 'IN', 3, 18, 24, 500, 524, 'admin2', NULL, '데모-IN', TO_DATE('2025-01-12 20:06:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (12, 11, 'OUT', 2, 13, 8, 8, 0, 'admin1', 149, '요청승인-149', TO_DATE('2025-01-15 20:26:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (13, 12, 'IN', 3, 18, 2, 524, 526, 'admin3', 172, '요청승인-172', TO_DATE('2025-01-15 23:38:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (14, 13, 'ADJUST', 12, 11, 10, 0, 10, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-01-16 12:04:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (15, 14, 'IN', 14, 14, 21, 9, 30, 'admin2', NULL, '데모-IN', TO_DATE('2025-01-17 17:06:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (16, 15, 'OUT', 15, 30, 10, 500, 490, 'admin3', NULL, '데모-OUT', TO_DATE('2025-01-19 18:08:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (17, 16, 'OUT', 15, 3, 8, 8, 0, 'admin3', 103, '요청승인-103', TO_DATE('2025-01-22 06:54:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (18, 17, 'IN', 12, 28, 7, 0, 7, 'admin2', 89, '요청승인-89', TO_DATE('2025-01-23 12:13:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (19, 18, 'OUT', 13, 3, 6, 6, 0, 'admin1', 112, '요청승인-112', TO_DATE('2025-01-24 09:40:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (20, 19, 'ADJUST', 2, 1, 19, 0, 19, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-01-26 01:28:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (21, 20, 'IN', 12, 27, 27, 500, 527, 'admin3', NULL, '데모-IN', TO_DATE('2025-01-29 08:36:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (22, 21, 'OUT', 6, 11, 6, 6, 0, 'admin1', 120, '요청승인-120', TO_DATE('2025-02-05 08:35:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (23, 22, 'OUT', 4, 4, 7, 500, 493, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-02-05 23:13:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (24, 22, 'IN', 5, 4, 7, 0, 7, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-02-05 23:13:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (25, 23, 'IN', 8, 16, 2, 0, 2, 'admin1', 41, '요청승인-41', TO_DATE('2025-02-08 08:29:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (26, 24, 'OUT', 13, 1, 7, 7, 0, 'admin3', 101, '요청승인-101', TO_DATE('2025-02-08 17:27:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (27, 25, 'OUT', 5, 20, 3, 500, 497, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-02-09 07:43:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (28, 25, 'IN', 6, 20, 3, 0, 3, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-02-09 07:43:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (29, 26, 'IN', 12, 14, 4, 0, 4, 'admin1', 12, '요청승인-12', TO_DATE('2025-02-10 22:25:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (30, 27, 'OUT', 1, 11, 8, 8, 0, 'admin2', 240, '요청승인-240', TO_DATE('2025-02-12 13:06:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (31, 28, 'IN', 8, 18, 5, 0, 5, 'admin2', 52, '요청승인-52', TO_DATE('2025-02-14 11:08:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (32, 29, 'OUT', 5, 20, 6, 497, 491, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-02-14 18:38:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (33, 29, 'IN', 6, 20, 6, 3, 9, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-02-14 18:38:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (34, 30, 'IN', 5, 20, 14, 491, 505, 'admin2', NULL, '데모-IN', TO_DATE('2025-02-17 17:19:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (35, 31, 'IN', 6, 21, 26, 500, 526, 'admin3', NULL, '데모-IN', TO_DATE('2025-02-23 03:52:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (36, 32, 'OUT', 12, 12, 6, 500, 494, 'admin2', NULL, '데모-OUT', TO_DATE('2025-02-24 03:12:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (37, 33, 'OUT', 4, 4, 4, 493, 489, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-02-24 09:36:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (38, 33, 'IN', 5, 4, 4, 7, 11, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-02-24 09:36:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (39, 34, 'ADJUST', 15, 14, 13, 0, 13, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-02-25 12:24:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (40, 35, 'IN', 8, 23, 24, 500, 524, 'admin3', NULL, '데모-IN', TO_DATE('2025-02-27 06:40:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (41, 36, 'IN', 12, 4, 4, 0, 4, 'admin2', 122, '요청승인-122', TO_DATE('2025-03-01 00:26:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (42, 37, 'IN', 12, 30, 7, 0, 7, 'admin3', 100, '요청승인-100', TO_DATE('2025-03-02 18:08:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (43, 38, 'IN', 6, 10, 5, 0, 5, 'admin2', 17, '요청승인-17', TO_DATE('2025-03-02 19:24:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (44, 39, 'IN', 10, 18, 8, 0, 8, 'admin1', 43, '요청승인-43', TO_DATE('2025-03-03 00:36:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (45, 40, 'OUT', 8, 27, 5, 5, 0, 'admin2', 199, '요청승인-199', TO_DATE('2025-03-03 17:53:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (46, 41, 'IN', 10, 22, 5, 0, 5, 'admin3', 65, '요청승인-65', TO_DATE('2025-03-08 15:23:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (47, 42, 'IN', 12, 12, 13, 494, 507, 'admin2', NULL, '데모-IN', TO_DATE('2025-03-08 21:41:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (48, 43, 'OUT', 1, 1, 6, 500, 494, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-03-09 21:39:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (49, 43, 'IN', 2, 1, 6, 19, 25, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-03-09 21:39:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (50, 44, 'OUT', 8, 17, 3, 3, 0, 'admin3', 144, '요청승인-144', TO_DATE('2025-03-10 22:56:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (51, 45, 'OUT', 13, 7, 3, 3, 0, 'admin3', 134, '요청승인-134', TO_DATE('2025-03-12 18:30:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (52, 46, 'IN', 3, 3, 23, 500, 523, 'admin1', NULL, '데모-IN', TO_DATE('2025-03-14 09:54:28','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (53, 47, 'OUT', 3, 18, 6, 526, 520, 'admin2', NULL, '데모-OUT', TO_DATE('2025-03-14 19:32:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (54, 48, 'OUT', 3, 3, 7, 523, 516, 'admin1', NULL, '데모-OUT', TO_DATE('2025-03-17 11:55:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (55, 49, 'IN', 1, 16, 28, 500, 528, 'admin2', NULL, '데모-IN', TO_DATE('2025-03-17 15:55:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (56, 50, 'IN', 8, 23, 19, 524, 543, 'admin3', NULL, '데모-IN', TO_DATE('2025-03-20 00:47:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (57, 51, 'IN', 3, 3, 15, 516, 531, 'admin1', NULL, '데모-IN', TO_DATE('2025-03-21 18:20:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (58, 52, 'IN', 1, 1, 30, 494, 524, 'admin1', NULL, '데모-IN', TO_DATE('2025-03-21 23:38:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (59, 53, 'IN', 13, 28, 19, 500, 519, 'admin3', NULL, '데모-IN', TO_DATE('2025-03-22 05:12:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (60, 54, 'OUT', 15, 7, 5, 5, 0, 'admin2', 125, '요청승인-125', TO_DATE('2025-03-28 10:23:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (61, 55, 'OUT', 7, 9, 2, 2, 0, 'admin1', 7, '요청승인-7', TO_DATE('2025-03-31 15:46:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (62, 56, 'OUT', 5, 7, 2, 2, 0, 'admin1', 5, '요청승인-5', TO_DATE('2025-04-04 01:07:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (63, 57, 'OUT', 6, 21, 4, 526, 522, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-04 11:50:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (64, 57, 'IN', 7, 21, 4, 0, 4, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-04 11:50:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (65, 58, 'IN', 7, 22, 5, 500, 505, 'admin3', 176, '요청승인-176', TO_DATE('2025-04-07 01:44:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (66, 59, 'ADJUST', 13, 12, 9, 0, 9, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-04-09 01:20:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (67, 60, 'OUT', 9, 19, 3, 3, 0, 'admin2', 53, '요청승인-53', TO_DATE('2025-04-09 17:17:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (68, 61, 'IN', 1, 14, 4, 0, 4, 'admin2', 159, '요청승인-159', TO_DATE('2025-04-10 07:39:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (69, 62, 'ADJUST', 13, 27, 10, 0, 10, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-04-10 08:45:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (70, 63, 'IN', 7, 28, 5, 0, 5, 'admin3', 209, '요청승인-209', TO_DATE('2025-04-12 01:07:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (71, 64, 'OUT', 10, 23, 6, 6, 0, 'admin2', 168, '요청승인-168', TO_DATE('2025-04-12 18:40:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (72, 65, 'OUT', 11, 26, 3, 526, 523, 'admin3', NULL, '데모-OUT', TO_DATE('2025-04-12 23:39:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (73, 66, 'OUT', 7, 22, 7, 505, 498, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-13 00:44:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (74, 66, 'IN', 8, 22, 7, 0, 7, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-13 00:44:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (75, 67, 'ADJUST', 15, 15, 491, 500, 9, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-04-14 03:28:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (76, 68, 'ADJUST', 8, 23, 526, 543, 17, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-04-14 06:10:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (77, 69, 'IN', 8, 12, 7, 0, 7, 'admin2', 19, '요청승인-19', TO_DATE('2025-04-14 06:11:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (78, 70, 'OUT', 8, 8, 7, 500, 493, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-04-18 19:41:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (79, 70, 'IN', 9, 8, 7, 0, 7, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-04-18 19:41:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (80, 71, 'OUT', 2, 17, 8, 500, 492, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-04-20 06:11:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (81, 71, 'IN', 3, 17, 8, 0, 8, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-04-20 06:11:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (82, 72, 'OUT', 13, 25, 2, 2, 0, 'admin3', 68, '요청승인-68', TO_DATE('2025-04-20 22:28:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (83, 73, 'OUT', 12, 27, 4, 527, 523, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-26 09:40:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (84, 73, 'IN', 13, 27, 4, 10, 14, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-04-26 09:40:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (85, 74, 'IN', 13, 2, 7, 0, 7, 'admin2', 204, '요청승인-204', TO_DATE('2025-04-30 04:21:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (86, 75, 'ADJUST', 14, 29, 490, 500, 10, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-05-05 00:39:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (87, 76, 'OUT', 12, 29, 2, 2, 0, 'admin1', 192, '요청승인-192', TO_DATE('2025-05-05 10:45:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (88, 77, 'ADJUST', 11, 26, 511, 523, 12, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-05-06 21:06:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (89, 78, 'IN', 5, 5, 12, 500, 512, 'admin1', NULL, '데모-IN', TO_DATE('2025-05-07 17:05:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (90, 79, 'OUT', 3, 18, 4, 520, 516, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-05-10 13:15:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (91, 79, 'IN', 4, 18, 4, 0, 4, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-05-10 13:15:49','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (92, 80, 'IN', 5, 8, 4, 0, 4, 'admin3', 108, '요청승인-108', TO_DATE('2025-05-16 18:48:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (93, 81, 'OUT', 4, 25, 2, 2, 0, 'admin3', 206, '요청승인-206', TO_DATE('2025-05-17 08:01:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (94, 82, 'ADJUST', 11, 10, 10, 0, 10, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-05-20 03:18:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (95, 83, 'ADJUST', 3, 17, 1, 8, 9, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-05-23 21:27:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (96, 84, 'IN', 3, 10, 5, 0, 5, 'admin2', 128, '요청승인-128', TO_DATE('2025-05-24 06:25:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (97, 85, 'IN', 3, 12, 4, 0, 4, 'admin3', 139, '요청승인-139', TO_DATE('2025-05-26 16:44:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (98, 86, 'OUT', 2, 17, 4, 492, 488, 'admin2', NULL, '데모-OUT', TO_DATE('2025-05-29 02:45:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (99, 87, 'IN', 2, 17, 30, 488, 518, 'admin2', NULL, '데모-IN', TO_DATE('2025-05-30 04:29:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (100, 88, 'OUT', 4, 4, 4, 489, 485, 'admin1', NULL, '데모-OUT', TO_DATE('2025-05-30 17:31:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (101, 89, 'OUT', 15, 30, 6, 490, 484, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-05-31 09:12:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (102, 89, 'IN', 1, 30, 6, 0, 6, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-05-31 09:12:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (103, 90, 'IN', 13, 8, 2, 0, 2, 'admin2', 237, '요청승인-237', TO_DATE('2025-06-01 03:47:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (104, 91, 'IN', 3, 16, 3, 0, 3, 'admin2', 161, '요청승인-161', TO_DATE('2025-06-01 05:34:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (105, 92, 'IN', 7, 20, 2, 0, 2, 'admin2', 165, '요청승인-165', TO_DATE('2025-06-04 05:36:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (106, 93, 'OUT', 5, 9, 7, 7, 0, 'admin2', 16, '요청승인-16', TO_DATE('2025-06-06 12:00:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (107, 94, 'OUT', 13, 13, 5, 500, 495, 'admin2', NULL, '데모-OUT', TO_DATE('2025-06-06 14:43:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (108, 95, 'OUT', 7, 15, 8, 8, 0, 'admin1', 40, '요청승인-40', TO_DATE('2025-06-07 03:03:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (109, 96, 'IN', 11, 30, 7, 0, 7, 'admin2', 202, '요청승인-202', TO_DATE('2025-06-08 02:37:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (110, 97, 'OUT', 10, 25, 4, 500, 496, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-06-08 12:19:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (111, 97, 'IN', 11, 25, 4, 0, 4, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-06-08 12:19:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (112, 98, 'OUT', 5, 5, 9, 512, 503, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-06-13 02:29:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (113, 98, 'IN', 6, 5, 9, 0, 9, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-06-13 02:29:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (114, 99, 'IN', 10, 25, 14, 496, 510, 'admin3', NULL, '데모-IN', TO_DATE('2025-06-13 23:25:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (115, 100, 'OUT', 7, 7, 8, 500, 492, 'admin1', NULL, '데모-OUT', TO_DATE('2025-06-15 12:38:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (116, 101, 'OUT', 8, 23, 4, 17, 13, 'admin3', NULL, '데모-OUT', TO_DATE('2025-06-15 22:29:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (117, 102, 'OUT', 15, 15, 3, 9, 6, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-06-16 18:39:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (118, 102, 'IN', 1, 15, 3, 0, 3, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-06-16 18:39:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (119, 103, 'OUT', 10, 27, 8, 8, 0, 'admin1', 190, '요청승인-190', TO_DATE('2025-06-17 20:26:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (120, 104, 'IN', 1, 2, 4, 0, 4, 'admin2', 93, '요청승인-93', TO_DATE('2025-06-18 20:38:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (121, 105, 'OUT', 8, 8, 6, 493, 487, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-06-20 17:26:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (122, 105, 'IN', 9, 8, 6, 7, 13, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-06-20 17:26:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (123, 106, 'OUT', 6, 6, 6, 500, 494, 'admin1', NULL, '데모-OUT', TO_DATE('2025-06-20 22:55:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (124, 107, 'OUT', 14, 14, 6, 30, 24, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-06-21 10:08:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (125, 107, 'IN', 15, 14, 6, 13, 19, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-06-21 10:08:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (126, 108, 'OUT', 2, 2, 6, 500, 494, 'admin1', NULL, '데모-OUT', TO_DATE('2025-06-21 14:18:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (127, 109, 'OUT', 15, 30, 3, 484, 481, 'admin3', NULL, '데모-OUT', TO_DATE('2025-06-23 12:35:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (128, 110, 'IN', 3, 6, 6, 0, 6, 'admin3', 106, '요청승인-106', TO_DATE('2025-06-23 18:09:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (129, 111, 'IN', 1, 30, 5, 6, 11, 'admin1', 82, '요청승인-82', TO_DATE('2025-06-23 21:18:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (130, 112, 'IN', 15, 30, 22, 481, 503, 'admin3', NULL, '데모-IN', TO_DATE('2025-06-27 03:41:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (131, 113, 'ADJUST', 5, 4, 6, 11, 17, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-06-27 09:19:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (132, 114, 'OUT', 14, 14, 4, 24, 20, 'admin2', NULL, '데모-OUT', TO_DATE('2025-06-29 02:38:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (133, 115, 'OUT', 4, 21, 6, 6, 0, 'admin1', 184, '요청승인-184', TO_DATE('2025-07-02 18:06:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (134, 116, 'OUT', 6, 21, 5, 522, 517, 'admin3', NULL, '데모-OUT', TO_DATE('2025-07-03 01:31:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (135, 117, 'OUT', 3, 18, 10, 516, 506, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-07-03 23:25:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (136, 117, 'IN', 4, 18, 10, 4, 14, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-07-03 23:25:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (137, 118, 'OUT', 14, 5, 2, 2, 0, 'admin3', 216, '요청승인-216', TO_DATE('2025-07-04 06:27:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (138, 119, 'IN', 15, 15, 30, 6, 36, 'admin2', NULL, '데모-IN', TO_DATE('2025-07-05 05:43:40','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (139, 120, 'OUT', 7, 22, 4, 498, 494, 'admin3', NULL, '데모-OUT', TO_DATE('2025-07-05 18:25:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (140, 121, 'IN', 1, 4, 3, 0, 3, 'admin3', 104, '요청승인-104', TO_DATE('2025-07-07 17:48:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (141, 122, 'OUT', 9, 21, 7, 7, 0, 'admin3', 64, '요청승인-64', TO_DATE('2025-07-09 06:51:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (142, 123, 'ADJUST', 6, 21, 508, 517, 9, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-07-11 14:47:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (143, 124, 'OUT', 4, 15, 7, 7, 0, 'admin1', 151, '요청승인-151', TO_DATE('2025-07-12 10:32:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (144, 125, 'OUT', 14, 29, 9, 10, 1, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-13 03:10:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (145, 125, 'IN', 15, 29, 9, 0, 9, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-13 03:10:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (146, 126, 'IN', 2, 17, 11, 518, 529, 'admin2', NULL, '데모-IN', TO_DATE('2025-07-13 12:17:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (147, 127, 'OUT', 9, 9, 9, 500, 491, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-07-15 15:41:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (148, 127, 'IN', 10, 9, 9, 9, 18, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-07-15 15:41:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (149, 128, 'IN', 14, 8, 5, 0, 5, 'admin3', 135, '요청승인-135', TO_DATE('2025-07-16 20:56:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (150, 129, 'OUT', 8, 3, 4, 4, 0, 'admin2', 232, '요청승인-232', TO_DATE('2025-07-19 12:03:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (151, 130, 'OUT', 6, 21, 2, 9, 7, 'admin3', 175, '요청승인-175', TO_DATE('2025-07-23 13:32:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (152, 131, 'OUT', 11, 26, 9, 12, 3, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-23 20:12:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (153, 131, 'IN', 12, 26, 9, 0, 9, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-23 20:12:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (154, 132, 'OUT', 10, 10, 4, 527, 523, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-07-24 22:55:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (155, 132, 'IN', 11, 10, 4, 10, 14, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-07-24 22:55:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (156, 133, 'ADJUST', 11, 25, 8, 4, 12, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-07-25 10:00:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (157, 134, 'ADJUST', 4, 3, 13, 0, 13, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-07-25 20:01:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (158, 135, 'OUT', 8, 23, 10, 13, 3, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-26 08:41:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (159, 135, 'IN', 9, 23, 10, 0, 10, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-26 08:41:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (160, 136, 'IN', 4, 19, 25, 500, 525, 'admin2', NULL, '데모-IN', TO_DATE('2025-07-26 08:44:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (161, 137, 'OUT', 15, 1, 2, 2, 0, 'admin2', 92, '요청승인-92', TO_DATE('2025-07-26 12:39:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (162, 138, 'OUT', 7, 22, 9, 494, 485, 'admin3', NULL, '데모-OUT', TO_DATE('2025-07-26 16:24:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (163, 139, 'OUT', 14, 29, 3, 3, 0, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-27 14:37:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (164, 139, 'IN', 15, 29, 3, 9, 12, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-07-27 14:37:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (165, 140, 'ADJUST', 5, 5, 488, 503, 15, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-07-27 17:49:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (166, 141, 'IN', 9, 28, 3, 0, 3, 'admin2', 200, '요청승인-200', TO_DATE('2025-08-01 22:39:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (167, 142, 'OUT', 6, 29, 8, 8, 0, 'admin1', 219, '요청승인-219', TO_DATE('2025-08-03 19:02:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (168, 143, 'ADJUST', 2, 2, 475, 494, 19, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-08-05 10:51:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (169, 144, 'IN', 15, 15, 11, 36, 47, 'admin2', NULL, '데모-IN', TO_DATE('2025-08-05 16:11:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (170, 145, 'IN', 9, 30, 5, 0, 5, 'admin3', 211, '요청승인-211', TO_DATE('2025-08-05 22:02:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (171, 146, 'OUT', 4, 19, 9, 525, 516, 'admin2', NULL, '데모-OUT', TO_DATE('2025-08-10 22:25:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (172, 147, 'OUT', 7, 19, 7, 7, 0, 'admin3', 62, '요청승인-62', TO_DATE('2025-08-11 20:27:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (173, 148, 'IN', 5, 24, 5, 0, 5, 'admin2', 196, '요청승인-196', TO_DATE('2025-08-16 16:28:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (174, 149, 'OUT', 6, 25, 3, 3, 0, 'admin2', 197, '요청승인-197', TO_DATE('2025-08-19 05:39:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (175, 150, 'ADJUST', 10, 24, 14, 5, 19, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-08-21 21:49:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (176, 151, 'IN', 9, 24, 12, 495, 507, 'admin3', NULL, '데모-IN', TO_DATE('2025-08-24 08:19:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (177, 152, 'IN', 15, 30, 13, 503, 516, 'admin3', NULL, '데모-IN', TO_DATE('2025-08-26 10:10:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (178, 153, 'IN', 6, 12, 2, 0, 2, 'admin3', 28, '요청승인-28', TO_DATE('2025-08-28 11:38:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (179, 154, 'OUT', 13, 13, 9, 495, 486, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-08-31 11:48:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (180, 154, 'IN', 14, 13, 9, 0, 9, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-08-31 11:48:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (181, 155, 'IN', 12, 2, 3, 0, 3, 'admin1', 111, '요청승인-111', TO_DATE('2025-09-01 01:11:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (182, 156, 'IN', 6, 14, 7, 0, 7, 'admin1', 39, '요청승인-39', TO_DATE('2025-09-01 13:38:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (183, 157, 'OUT', 5, 20, 7, 505, 498, 'admin2', NULL, '데모-OUT', TO_DATE('2025-09-01 23:01:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (184, 158, 'IN', 7, 22, 11, 485, 496, 'admin3', NULL, '데모-IN', TO_DATE('2025-09-02 09:48:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (185, 159, 'OUT', 7, 7, 3, 492, 489, 'admin1', NULL, '데모-OUT', TO_DATE('2025-09-02 19:01:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (186, 160, 'OUT', 9, 11, 8, 8, 0, 'admin1', 9, '요청승인-9', TO_DATE('2025-09-06 02:22:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (187, 161, 'OUT', 11, 11, 8, 494, 486, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-09-10 03:42:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (188, 161, 'IN', 12, 11, 8, 10, 18, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-09-10 03:42:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (189, 162, 'OUT', 6, 6, 10, 494, 484, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-09-10 06:04:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (190, 162, 'IN', 7, 6, 10, 0, 10, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-09-10 06:04:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (191, 163, 'IN', 12, 24, 4, 0, 4, 'admin3', 67, '요청승인-67', TO_DATE('2025-09-11 18:49:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (192, 164, 'ADJUST', 1, 30, 2, 11, 13, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-09-13 08:14:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (193, 165, 'IN', 13, 6, 4, 0, 4, 'admin1', 226, '요청승인-226', TO_DATE('2025-09-13 19:57:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (194, 166, 'IN', 14, 29, 14, 0, 14, 'admin3', NULL, '데모-IN', TO_DATE('2025-09-16 09:23:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (195, 167, 'IN', 11, 26, 25, 3, 28, 'admin3', NULL, '데모-IN', TO_DATE('2025-09-17 10:56:40','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (196, 168, 'OUT', 13, 5, 7, 7, 0, 'admin2', 123, '요청승인-123', TO_DATE('2025-09-24 12:00:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (197, 169, 'OUT', 10, 25, 4, 510, 506, 'admin3', NULL, '데모-OUT', TO_DATE('2025-09-24 16:45:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (198, 170, 'OUT', 3, 3, 6, 531, 525, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-09-25 12:47:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (199, 170, 'IN', 4, 3, 6, 13, 19, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-09-25 12:47:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (200, 171, 'IN', 3, 2, 5, 18, 23, 'admin1', 84, '요청승인-84', TO_DATE('2025-09-25 12:54:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (201, 172, 'IN', 5, 14, 4, 0, 4, 'admin3', 141, '요청승인-141', TO_DATE('2025-09-25 19:22:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (202, 173, 'OUT', 2, 3, 4, 4, 0, 'admin2', 94, '요청승인-94', TO_DATE('2025-09-27 14:27:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (203, 174, 'ADJUST', 9, 23, 7, 10, 17, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-09-29 10:59:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (204, 175, 'OUT', 11, 29, 2, 2, 0, 'admin3', 99, '요청승인-99', TO_DATE('2025-10-02 06:44:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (205, 176, 'OUT', 12, 5, 5, 5, 0, 'admin1', 225, '요청승인-225', TO_DATE('2025-10-02 17:27:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (206, 177, 'IN', 8, 10, 5, 0, 5, 'admin1', 8, '요청승인-8', TO_DATE('2025-10-02 23:04:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (207, 178, 'OUT', 13, 28, 8, 519, 511, 'admin3', NULL, '데모-OUT', TO_DATE('2025-10-03 02:02:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (208, 179, 'OUT', 1, 16, 6, 528, 522, 'admin2', NULL, '데모-OUT', TO_DATE('2025-10-03 13:35:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (209, 180, 'OUT', 5, 5, 4, 15, 11, 'admin1', NULL, '데모-OUT', TO_DATE('2025-10-04 07:43:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (210, 181, 'IN', 2, 4, 4, 0, 4, 'admin1', 2, '요청승인-2', TO_DATE('2025-10-07 04:50:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (211, 182, 'OUT', 3, 3, 5, 525, 520, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-10-07 04:51:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (212, 182, 'IN', 4, 3, 5, 19, 24, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-10-07 04:51:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (213, 183, 'IN', 4, 4, 11, 485, 496, 'admin1', NULL, '데모-IN', TO_DATE('2025-10-09 06:21:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (214, 184, 'OUT', 8, 8, 5, 487, 482, 'admin1', NULL, '데모-OUT', TO_DATE('2025-10-09 13:06:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (215, 185, 'OUT', 8, 21, 3, 3, 0, 'admin2', 166, '요청승인-166', TO_DATE('2025-10-10 18:18:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (216, 186, 'OUT', 4, 13, 3, 3, 0, 'admin3', 140, '요청승인-140', TO_DATE('2025-10-11 01:25:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (217, 187, 'IN', 5, 5, 19, 11, 30, 'admin1', NULL, '데모-IN', TO_DATE('2025-10-11 17:57:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (218, 188, 'OUT', 12, 27, 9, 523, 514, 'admin3', NULL, '데모-OUT', TO_DATE('2025-10-15 03:41:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (219, 189, 'OUT', 5, 5, 6, 30, 24, 'admin1', NULL, '데모-OUT', TO_DATE('2025-10-15 21:40:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (220, 190, 'OUT', 3, 3, 8, 520, 512, 'admin1', NULL, '데모-OUT', TO_DATE('2025-10-23 11:21:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (221, 191, 'IN', 9, 9, 11, 491, 502, 'admin1', NULL, '데모-IN', TO_DATE('2025-10-24 18:53:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (222, 192, 'IN', 1, 10, 7, 0, 7, 'admin3', 137, '요청승인-137', TO_DATE('2025-10-25 19:52:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (223, 193, 'IN', 9, 9, 12, 502, 514, 'admin1', NULL, '데모-IN', TO_DATE('2025-10-27 05:34:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (224, 194, 'IN', 5, 22, 6, 0, 6, 'admin1', 185, '요청승인-185', TO_DATE('2025-10-27 21:45:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (225, 195, 'IN', 14, 26, 3, 0, 3, 'admin3', 69, '요청승인-69', TO_DATE('2025-10-31 23:17:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (226, 196, 'ADJUST', 7, 7, 480, 489, 9, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-11-04 16:06:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (227, 197, 'OUT', 7, 22, 8, 496, 488, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-11-04 18:58:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (228, 197, 'IN', 8, 22, 8, 7, 15, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-11-04 18:58:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (229, 198, 'ADJUST', 15, 30, 501, 516, 15, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-11-06 20:56:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (230, 199, 'OUT', 13, 13, 6, 486, 480, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-07 06:45:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (231, 199, 'IN', 14, 13, 6, 9, 15, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-07 06:45:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (232, 200, 'OUT', 8, 8, 7, 482, 475, 'admin1', NULL, '데모-OUT', TO_DATE('2025-11-07 14:21:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (233, 201, 'OUT', 6, 21, 3, 7, 4, 'admin3', NULL, '데모-OUT', TO_DATE('2025-11-10 23:55:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (234, 202, 'OUT', 8, 23, 2, 3, 1, 'admin3', 177, '요청승인-177', TO_DATE('2025-11-12 16:43:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (235, 203, 'OUT', 13, 28, 6, 511, 505, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-11-13 00:25:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (236, 203, 'IN', 14, 28, 6, 0, 6, 'admin3', NULL, '데모-MOVE', TO_DATE('2025-11-13 00:25:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (237, 204, 'ADJUST', 3, 18, 498, 506, 8, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-11-13 01:06:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (238, 205, 'OUT', 3, 5, 6, 6, 0, 'admin1', 3, '요청승인-3', TO_DATE('2025-11-13 21:32:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (239, 206, 'OUT', 1, 16, 9, 522, 513, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-16 16:30:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (240, 206, 'IN', 2, 16, 9, 0, 9, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-16 16:30:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (241, 207, 'IN', 14, 29, 17, 14, 31, 'admin3', NULL, '데모-IN', TO_DATE('2025-11-17 03:53:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (242, 208, 'IN', 10, 14, 7, 0, 7, 'admin2', 21, '요청승인-21', TO_DATE('2025-11-17 15:59:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (243, 209, 'OUT', 2, 2, 6, 19, 13, 'admin1', NULL, '데모-OUT', TO_DATE('2025-11-23 05:24:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (244, 210, 'ADJUST', 2, 17, 509, 529, 20, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-11-25 01:26:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (245, 211, 'ADJUST', 1, 1, 514, 524, 10, 'admin1', NULL, '데모-ADJUST', TO_DATE('2025-11-25 02:11:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (246, 212, 'OUT', 4, 19, 3, 516, 513, 'admin2', NULL, '데모-OUT', TO_DATE('2025-11-25 22:25:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (247, 213, 'OUT', 1, 16, 10, 513, 503, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-26 09:04:40','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (248, 213, 'IN', 2, 16, 10, 9, 19, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-11-26 09:04:40','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (249, 214, 'IN', 8, 22, 8, 15, 23, 'admin1', 74, '요청승인-74', TO_DATE('2025-11-27 19:02:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (250, 215, 'OUT', 4, 5, 8, 8, 0, 'admin2', 96, '요청승인-96', TO_DATE('2025-11-27 21:32:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (251, 216, 'OUT', 13, 27, 5, 14, 9, 'admin1', 79, '요청승인-79', TO_DATE('2025-11-27 22:07:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (252, 217, 'IN', 6, 16, 8, 0, 8, 'admin2', 50, '요청승인-50', TO_DATE('2025-11-29 16:17:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (253, 218, 'IN', 8, 8, 24, 475, 499, 'admin1', NULL, '데모-IN', TO_DATE('2025-11-30 03:35:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (254, 219, 'IN', 14, 6, 8, 0, 8, 'admin2', 124, '요청승인-124', TO_DATE('2025-11-30 17:27:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (255, 220, 'ADJUST', 12, 27, 495, 514, 19, 'admin3', NULL, '데모-ADJUST', TO_DATE('2025-12-01 04:48:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (256, 221, 'OUT', 1, 16, 10, 503, 493, 'admin2', NULL, '데모-OUT', TO_DATE('2025-12-02 04:22:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (257, 222, 'IN', 7, 24, 6, 0, 6, 'admin1', 187, '요청승인-187', TO_DATE('2025-12-03 12:58:03','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (258, 223, 'IN', 7, 18, 4, 0, 4, 'admin1', 154, '요청승인-154', TO_DATE('2025-12-03 22:57:57','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (259, 224, 'OUT', 7, 13, 3, 3, 0, 'admin3', 29, '요청승인-29', TO_DATE('2025-12-08 08:41:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (260, 225, 'OUT', 2, 17, 9, 20, 11, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-12-15 19:45:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (261, 225, 'IN', 3, 17, 9, 9, 18, 'admin2', NULL, '데모-MOVE', TO_DATE('2025-12-15 19:45:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (262, 226, 'OUT', 2, 2, 3, 13, 10, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-12-16 06:51:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (263, 226, 'IN', 3, 2, 3, 23, 26, 'admin1', NULL, '데모-MOVE', TO_DATE('2025-12-16 06:51:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (264, 227, 'IN', 10, 10, 13, 523, 536, 'admin1', NULL, '데모-IN', TO_DATE('2025-12-19 19:01:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (265, 228, 'IN', 1, 26, 5, 0, 5, 'admin2', 60, '요청승인-60', TO_DATE('2025-12-20 00:54:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (266, 229, 'IN', 4, 19, 16, 513, 529, 'admin2', NULL, '데모-IN', TO_DATE('2025-12-20 18:58:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (267, 230, 'IN', 7, 2, 2, 0, 2, 'admin2', 231, '요청승인-231', TO_DATE('2025-12-21 17:34:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (268, 231, 'IN', 9, 20, 7, 0, 7, 'admin1', 156, '요청승인-156', TO_DATE('2025-12-22 21:25:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (269, 232, 'IN', 14, 30, 8, 0, 8, 'admin2', 91, '요청승인-91', TO_DATE('2025-12-28 01:40:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (270, 233, 'ADJUST', 1, 16, 482, 493, 11, 'admin2', NULL, '데모-ADJUST', TO_DATE('2025-12-30 02:58:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (271, 234, 'OUT', 12, 7, 6, 6, 0, 'admin2', 236, '요청승인-236', TO_DATE('2025-12-30 06:51:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (272, 235, 'OUT', 9, 9, 5, 514, 509, 'admin1', NULL, '데모-OUT', TO_DATE('2025-12-30 22:04:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (273, 236, 'OUT', 9, 25, 3, 3, 0, 'admin2', 86, '요청승인-86', TO_DATE('2026-01-01 11:47:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (274, 237, 'OUT', 9, 15, 4, 4, 0, 'admin3', 31, '요청승인-31', TO_DATE('2026-01-01 15:00:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (275, 238, 'OUT', 4, 19, 4, 529, 525, 'admin3', 173, '요청승인-173', TO_DATE('2026-01-05 01:11:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (276, 239, 'ADJUST', 6, 20, 10, 9, 19, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-01-06 16:58:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (277, 240, 'OUT', 8, 1, 3, 3, 0, 'admin1', 221, '요청승인-221', TO_DATE('2026-01-06 21:46:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (278, 241, 'OUT', 11, 25, 5, 12, 7, 'admin1', 77, '요청승인-77', TO_DATE('2026-01-07 22:32:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (279, 242, 'OUT', 11, 17, 6, 6, 0, 'admin3', 33, '요청승인-33', TO_DATE('2026-01-10 23:49:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (280, 243, 'OUT', 15, 11, 7, 7, 0, 'admin1', 147, '요청승인-147', TO_DATE('2026-01-12 06:01:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (281, 244, 'OUT', 15, 15, 4, 47, 43, 'admin2', NULL, '데모-OUT', TO_DATE('2026-01-13 09:46:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (282, 245, 'ADJUST', 4, 18, 4, 14, 18, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-01-13 14:00:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (283, 246, 'OUT', 12, 12, 7, 507, 500, 'admin2', NULL, '데모-OUT', TO_DATE('2026-01-13 20:31:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (284, 247, 'ADJUST', 11, 11, 466, 486, 20, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-01-15 21:16:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (285, 248, 'IN', 11, 4, 7, 0, 7, 'admin1', 224, '요청승인-224', TO_DATE('2026-01-19 09:25:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (286, 249, 'ADJUST', 9, 8, 4, 13, 17, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-01-19 16:48:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (287, 250, 'IN', 1, 12, 7, 0, 7, 'admin1', 148, '요청승인-148', TO_DATE('2026-01-21 16:34:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (288, 251, 'OUT', 10, 1, 6, 6, 0, 'admin3', 212, '요청승인-212', TO_DATE('2026-01-24 00:00:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (289, 252, 'OUT', 7, 7, 7, 9, 2, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-01-24 03:20:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (290, 252, 'IN', 8, 7, 7, 0, 7, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-01-24 03:20:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (291, 253, 'OUT', 13, 21, 5, 5, 0, 'admin1', 46, '요청승인-46', TO_DATE('2026-01-24 10:51:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (292, 254, 'OUT', 10, 10, 7, 536, 529, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-01-25 04:36:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (293, 254, 'IN', 11, 10, 7, 14, 21, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-01-25 04:36:05','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (294, 255, 'OUT', 8, 23, 3, 3, 0, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-01-29 07:22:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (295, 255, 'IN', 9, 23, 3, 17, 20, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-01-29 07:22:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (296, 256, 'ADJUST', 8, 8, 480, 499, 19, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-02-01 03:15:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (297, 257, 'OUT', 9, 13, 4, 4, 0, 'admin2', 20, '요청승인-20', TO_DATE('2026-02-02 08:26:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (298, 258, 'IN', 10, 12, 6, 0, 6, 'admin1', 10, '요청승인-10', TO_DATE('2026-02-03 16:37:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (299, 259, 'IN', 8, 20, 8, 0, 8, 'admin3', 63, '요청승인-63', TO_DATE('2026-02-14 08:43:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (300, 260, 'OUT', 9, 24, 7, 507, 500, 'admin3', NULL, '데모-OUT', TO_DATE('2026-02-16 05:10:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (301, 261, 'OUT', 9, 9, 5, 509, 504, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-02-16 08:24:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (302, 261, 'IN', 10, 9, 5, 18, 23, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-02-16 08:24:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (303, 262, 'OUT', 11, 11, 7, 20, 13, 'admin2', NULL, '데모-OUT', TO_DATE('2026-02-17 07:30:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (304, 263, 'OUT', 12, 12, 6, 500, 494, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-02-19 03:21:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (305, 263, 'IN', 13, 12, 6, 9, 15, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-02-19 03:21:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (306, 264, 'IN', 10, 26, 6, 0, 6, 'admin2', 87, '요청승인-87', TO_DATE('2026-02-21 07:47:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (307, 265, 'OUT', 2, 17, 3, 11, 8, 'admin2', NULL, '데모-OUT', TO_DATE('2026-02-21 22:05:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (308, 266, 'OUT', 8, 23, 8, 8, 0, 'admin3', NULL, '데모-OUT', TO_DATE('2026-02-22 23:13:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (309, 267, 'OUT', 15, 15, 8, 43, 35, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-02-24 05:02:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (310, 267, 'IN', 1, 15, 8, 3, 11, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-02-24 05:02:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (311, 268, 'IN', 11, 11, 26, 13, 39, 'admin2', NULL, '데모-IN', TO_DATE('2026-02-24 07:45:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (312, 269, 'IN', 4, 6, 8, 0, 8, 'admin1', 4, '요청승인-4', TO_DATE('2026-02-24 22:47:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (313, 270, 'IN', 3, 18, 18, 8, 26, 'admin2', NULL, '데모-IN', TO_DATE('2026-02-25 06:17:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (314, 271, 'IN', 5, 20, 25, 498, 523, 'admin2', NULL, '데모-IN', TO_DATE('2026-02-26 12:15:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (315, 272, 'IN', 2, 2, 12, 10, 22, 'admin1', NULL, '데모-IN', TO_DATE('2026-02-28 15:26:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (316, 273, 'OUT', 1, 1, 7, 10, 3, 'admin1', NULL, '데모-OUT', TO_DATE('2026-02-28 23:22:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (317, 274, 'IN', 12, 27, 24, 19, 43, 'admin3', NULL, '데모-IN', TO_DATE('2026-03-01 03:32:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (318, 275, 'OUT', 3, 7, 8, 8, 0, 'admin2', 14, '요청승인-14', TO_DATE('2026-03-01 16:28:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (319, 276, 'IN', 5, 12, 6, 0, 6, 'admin2', 130, '요청승인-130', TO_DATE('2026-03-02 11:16:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (320, 277, 'OUT', 2, 29, 4, 4, 0, 'admin3', 72, '요청승인-72', TO_DATE('2026-03-02 22:00:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (321, 278, 'OUT', 12, 27, 4, 43, 39, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-06 12:48:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (322, 278, 'IN', 13, 27, 4, 9, 13, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-06 12:48:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (323, 279, 'IN', 14, 24, 5, 0, 5, 'admin2', 58, '요청승인-58', TO_DATE('2026-03-07 00:04:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (324, 280, 'ADJUST', 9, 9, 487, 504, 17, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-03-07 01:52:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (325, 281, 'OUT', 14, 14, 10, 20, 10, 'admin2', NULL, '데모-OUT', TO_DATE('2026-03-07 14:50:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (326, 282, 'ADJUST', 9, 24, 484, 500, 16, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-03-08 03:32:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (327, 283, 'ADJUST', 4, 19, 517, 525, 8, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-03-09 01:16:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (328, 284, 'OUT', 6, 6, 5, 484, 479, 'admin1', NULL, '데모-OUT', TO_DATE('2026-03-09 23:17:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (329, 285, 'OUT', 5, 11, 5, 5, 0, 'admin3', 27, '요청승인-27', TO_DATE('2026-03-10 01:17:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (330, 286, 'OUT', 13, 28, 8, 505, 497, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-12 05:59:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (331, 286, 'IN', 14, 28, 8, 6, 14, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-12 05:59:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (332, 287, 'OUT', 6, 17, 5, 5, 0, 'admin1', 153, '요청승인-153', TO_DATE('2026-03-12 08:29:01','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (333, 288, 'OUT', 11, 21, 6, 6, 0, 'admin2', 55, '요청승인-55', TO_DATE('2026-03-16 14:07:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (334, 289, 'IN', 11, 26, 3, 28, 31, 'admin3', 180, '요청승인-180', TO_DATE('2026-03-17 15:05:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (335, 290, 'IN', 7, 7, 11, 2, 13, 'admin1', NULL, '데모-IN', TO_DATE('2026-03-17 22:00:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (336, 291, 'OUT', 6, 21, 5, 5, 0, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-19 20:31:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (337, 291, 'IN', 7, 21, 5, 4, 9, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-03-19 20:31:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (338, 292, 'IN', 4, 10, 6, 0, 6, 'admin3', 26, '요청승인-26', TO_DATE('2026-03-22 11:53:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (339, 293, 'OUT', 6, 27, 8, 8, 0, 'admin3', 208, '요청승인-208', TO_DATE('2026-03-22 13:47:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (340, 294, 'OUT', 15, 9, 5, 5, 0, 'admin3', 136, '요청승인-136', TO_DATE('2026-03-25 01:46:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (341, 295, 'IN', 4, 4, 24, 496, 520, 'admin1', NULL, '데모-IN', TO_DATE('2026-03-25 19:37:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (342, 296, 'ADJUST', 7, 21, 8, 9, 17, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-03-27 00:50:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (343, 297, 'OUT', 12, 27, 3, 39, 36, 'admin3', NULL, '데모-OUT', TO_DATE('2026-03-29 19:45:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (344, 298, 'IN', 8, 8, 14, 19, 33, 'admin1', NULL, '데모-IN', TO_DATE('2026-03-30 14:50:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (345, 299, 'ADJUST', 5, 20, 506, 523, 17, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-03-31 02:51:34','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (346, 300, 'IN', 9, 24, 2, 16, 18, 'admin3', 178, '요청승인-178', TO_DATE('2026-03-31 15:27:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (347, 301, 'IN', 5, 16, 7, 0, 7, 'admin1', 152, '요청승인-152', TO_DATE('2026-04-01 03:58:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (348, 302, 'IN', 14, 14, 24, 10, 34, 'admin2', NULL, '데모-IN', TO_DATE('2026-04-03 07:52:09','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (349, 303, 'OUT', 14, 14, 6, 34, 28, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-04-03 10:19:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (350, 303, 'IN', 15, 14, 6, 19, 25, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-04-03 10:19:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (351, 304, 'OUT', 2, 2, 6, 22, 16, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-04-04 01:42:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (352, 304, 'IN', 3, 2, 6, 26, 32, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-04-04 01:42:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (353, 305, 'OUT', 1, 1, 6, 6, 0, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-04-05 00:34:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (354, 305, 'IN', 2, 1, 6, 25, 31, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-04-05 00:34:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (355, 306, 'OUT', 10, 3, 3, 3, 0, 'admin1', 223, '요청승인-223', TO_DATE('2026-04-05 02:20:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (356, 307, 'OUT', 9, 23, 8, 20, 12, 'admin1', 75, '요청승인-75', TO_DATE('2026-04-06 03:01:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (357, 308, 'OUT', 9, 9, 4, 17, 13, 'admin1', NULL, '데모-OUT', TO_DATE('2026-04-09 05:09:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (358, 309, 'OUT', 11, 27, 5, 5, 0, 'admin2', 88, '요청승인-88', TO_DATE('2026-04-11 04:40:51','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (359, 310, 'IN', 5, 18, 7, 0, 7, 'admin2', 163, '요청승인-163', TO_DATE('2026-04-11 09:41:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (360, 311, 'OUT', 11, 11, 5, 39, 34, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-04-11 14:08:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (361, 311, 'IN', 12, 11, 5, 18, 23, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-04-11 14:08:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (362, 312, 'IN', 11, 2, 2, 0, 2, 'admin3', 213, '요청승인-213', TO_DATE('2026-04-11 23:12:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (363, 313, 'IN', 1, 6, 2, 0, 2, 'admin1', 115, '요청승인-115', TO_DATE('2026-04-12 08:30:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (364, 314, 'OUT', 6, 19, 6, 6, 0, 'admin2', 164, '요청승인-164', TO_DATE('2026-04-12 23:59:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (365, 315, 'IN', 5, 26, 4, 0, 4, 'admin3', 207, '요청승인-207', TO_DATE('2026-04-14 15:25:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (366, 316, 'ADJUST', 3, 3, 492, 512, 20, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-04-15 07:16:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (367, 317, 'IN', 10, 25, 13, 506, 519, 'admin3', NULL, '데모-IN', TO_DATE('2026-04-16 03:50:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (368, 318, 'IN', 3, 20, 6, 0, 6, 'admin1', 183, '요청승인-183', TO_DATE('2026-04-16 11:36:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (369, 319, 'OUT', 15, 29, 8, 12, 4, 'admin1', 81, '요청승인-81', TO_DATE('2026-04-17 00:26:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (370, 320, 'IN', 9, 24, 17, 18, 35, 'admin3', NULL, '데모-IN', TO_DATE('2026-04-21 11:29:59','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (371, 321, 'ADJUST', 13, 28, 479, 497, 18, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-04-28 10:58:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (372, 322, 'OUT', 8, 25, 6, 6, 0, 'admin1', 188, '요청승인-188', TO_DATE('2026-04-29 19:47:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (373, 323, 'OUT', 2, 7, 8, 8, 0, 'admin1', 116, '요청승인-116', TO_DATE('2026-05-05 15:38:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (374, 324, 'OUT', 10, 29, 8, 8, 0, 'admin2', 201, '요청승인-201', TO_DATE('2026-05-06 22:55:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (375, 325, 'OUT', 14, 9, 4, 4, 0, 'admin2', 238, '요청승인-238', TO_DATE('2026-05-07 01:44:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (376, 326, 'ADJUST', 10, 25, 507, 519, 12, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-05-09 00:03:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (377, 327, 'OUT', 11, 19, 5, 5, 0, 'admin1', 44, '요청승인-44', TO_DATE('2026-05-10 14:40:39','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (378, 328, 'OUT', 11, 26, 4, 31, 27, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-05-11 05:39:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (379, 328, 'IN', 12, 26, 4, 9, 13, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-05-11 05:39:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (380, 329, 'IN', 6, 6, 30, 479, 509, 'admin1', NULL, '데모-IN', TO_DATE('2026-05-13 11:27:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (381, 330, 'ADJUST', 8, 7, 4, 7, 11, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-05-15 16:37:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (382, 331, 'ADJUST', 8, 22, 5, 23, 18, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-05-17 18:00:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (383, 332, 'ADJUST', 14, 13, 5, 15, 20, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-05-21 03:36:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (384, 333, 'OUT', 9, 24, 8, 35, 27, 'admin3', NULL, '데모-OUT', TO_DATE('2026-05-24 08:00:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (385, 334, 'OUT', 4, 11, 6, 6, 0, 'admin2', 129, '요청승인-129', TO_DATE('2026-05-24 16:24:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (386, 335, 'OUT', 7, 7, 9, 13, 4, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-05-25 11:15:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (387, 335, 'IN', 8, 7, 9, 11, 20, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-05-25 11:15:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (388, 336, 'IN', 1, 16, 28, 11, 39, 'admin2', NULL, '데모-IN', TO_DATE('2026-05-28 05:19:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (389, 337, 'OUT', 15, 30, 6, 15, 9, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-05-29 00:54:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (390, 337, 'IN', 1, 30, 6, 13, 19, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-05-29 00:54:37','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (391, 338, 'ADJUST', 4, 4, 502, 520, 18, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-05-29 23:50:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (392, 339, 'ADJUST', 5, 19, 14, 0, 14, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-05-30 11:10:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (393, 340, 'IN', 11, 6, 2, 0, 2, 'admin2', 235, '요청승인-235', TO_DATE('2026-06-03 06:40:41','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (394, 341, 'IN', 13, 28, 11, 18, 29, 'admin3', NULL, '데모-IN', TO_DATE('2026-06-03 09:32:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (395, 342, 'OUT', 9, 24, 10, 27, 17, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-06-04 02:52:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (396, 342, 'IN', 10, 24, 10, 19, 29, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-06-04 02:52:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (397, 343, 'OUT', 15, 15, 6, 35, 29, 'admin2', NULL, '데모-OUT', TO_DATE('2026-06-04 23:38:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (398, 344, 'OUT', 14, 29, 5, 31, 26, 'admin3', NULL, '데모-OUT', TO_DATE('2026-06-05 16:58:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (399, 345, 'OUT', 5, 5, 7, 24, 17, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-06-05 21:58:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (400, 345, 'IN', 6, 5, 7, 9, 16, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-06-05 21:58:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (401, 346, 'OUT', 13, 17, 5, 5, 0, 'admin2', 24, '요청승인-24', TO_DATE('2026-06-05 22:10:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (402, 347, 'OUT', 2, 5, 5, 5, 0, 'admin3', 105, '요청승인-105', TO_DATE('2026-06-06 10:37:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (403, 348, 'IN', 14, 20, 6, 0, 6, 'admin3', 36, '요청승인-36', TO_DATE('2026-06-07 02:07:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (404, 349, 'ADJUST', 13, 13, 464, 480, 16, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-06-07 02:09:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (405, 350, 'ADJUST', 7, 22, 477, 488, 11, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-06-07 02:12:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (406, 351, 'IN', 6, 21, 26, 0, 26, 'admin3', NULL, '데모-IN', TO_DATE('2026-06-09 19:52:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (407, 352, 'IN', 1, 1, 13, 0, 13, 'admin1', NULL, '데모-IN', TO_DATE('2026-06-10 23:35:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (408, 353, 'IN', 10, 16, 5, 0, 5, 'admin3', 32, '요청승인-32', TO_DATE('2026-06-12 05:36:16','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (409, 354, 'IN', 14, 4, 6, 0, 6, 'admin1', 113, '요청승인-113', TO_DATE('2026-06-15 13:40:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (410, 355, 'OUT', 6, 6, 5, 509, 504, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-06-17 03:08:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (411, 355, 'IN', 7, 6, 5, 10, 15, 'admin1', NULL, '데모-MOVE', TO_DATE('2026-06-17 03:08:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (412, 356, 'OUT', 10, 25, 5, 12, 7, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-06-19 08:52:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (413, 356, 'IN', 11, 25, 5, 7, 12, 'admin3', NULL, '데모-MOVE', TO_DATE('2026-06-19 08:52:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (414, 357, 'IN', 6, 6, 12, 504, 516, 'admin1', NULL, '데모-IN', TO_DATE('2026-06-19 21:16:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (415, 358, 'IN', 13, 13, 25, 16, 41, 'admin2', NULL, '데모-IN', TO_DATE('2026-06-21 05:03:53','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (416, 359, 'OUT', 4, 9, 4, 4, 0, 'admin1', 118, '요청승인-118', TO_DATE('2026-06-21 22:30:46','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (417, 360, 'OUT', 4, 23, 5, 5, 0, 'admin2', 195, '요청승인-195', TO_DATE('2026-06-25 21:48:33','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (418, 361, 'OUT', 4, 19, 5, 8, 3, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-06-26 10:24:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (419, 361, 'IN', 5, 19, 5, 14, 19, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-06-26 10:24:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (420, 362, 'IN', 15, 8, 5, 0, 5, 'admin1', 228, '요청승인-228', TO_DATE('2026-06-28 06:00:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (421, 363, 'IN', 1, 16, 4, 39, 43, 'admin3', 170, '요청승인-170', TO_DATE('2026-06-29 03:48:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (422, 364, 'OUT', 11, 15, 5, 5, 0, 'admin2', 22, '요청승인-22', TO_DATE('2026-06-29 23:54:24','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (423, 365, 'ADJUST', 15, 29, 15, 4, 19, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-06-30 01:46:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (424, 366, 'IN', 2, 2, 10, 16, 26, 'admin1', NULL, '데모-IN', TO_DATE('2026-06-30 02:38:42','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (425, 367, 'ADJUST', 6, 5, 2, 16, 18, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-06-30 11:52:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (426, 368, 'OUT', 7, 17, 3, 3, 0, 'admin2', 51, '요청승인-51', TO_DATE('2026-06-30 23:44:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (427, 369, 'OUT', 4, 4, 9, 18, 9, 'admin1', NULL, '데모-OUT', TO_DATE('2026-07-02 15:10:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (428, 370, 'OUT', 6, 15, 6, 6, 0, 'admin3', 142, '요청승인-142', TO_DATE('2026-07-03 02:00:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (429, 371, 'IN', 3, 8, 2, 0, 2, 'admin1', 117, '요청승인-117', TO_DATE('2026-07-03 23:37:10','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (430, 372, 'OUT', 15, 27, 3, 3, 0, 'admin3', 70, '요청승인-70', TO_DATE('2026-07-06 03:36:26','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (431, 373, 'OUT', 2, 9, 5, 5, 0, 'admin2', 127, '요청승인-127', TO_DATE('2026-07-06 20:11:19','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (432, 374, 'OUT', 13, 13, 7, 41, 34, 'admin2', NULL, '데모-OUT', TO_DATE('2026-07-09 03:19:55','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (433, 375, 'IN', 7, 22, 29, 11, 40, 'admin3', NULL, '데모-IN', TO_DATE('2026-07-11 15:46:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (434, 376, 'OUT', 10, 25, 7, 7, 0, 'admin3', NULL, '데모-OUT', TO_DATE('2026-07-12 18:15:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (435, 377, 'IN', 7, 7, 17, 4, 21, 'admin1', NULL, '데모-IN', TO_DATE('2026-07-12 23:53:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (436, 378, 'OUT', 10, 10, 8, 529, 521, 'admin1', NULL, '데모-OUT', TO_DATE('2026-07-14 08:49:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (437, 379, 'OUT', 10, 10, 7, 521, 514, 'admin1', NULL, '데모-OUT', TO_DATE('2026-07-16 05:46:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (438, 380, 'ADJUST', 1, 15, 5, 11, 16, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-07-17 05:16:08','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (439, 381, 'OUT', 15, 13, 2, 2, 0, 'admin2', 158, '요청승인-158', TO_DATE('2026-07-17 16:42:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (440, 382, 'OUT', 13, 23, 6, 6, 0, 'admin2', 57, '요청승인-57', TO_DATE('2026-07-19 03:14:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (441, 383, 'IN', 12, 20, 3, 0, 3, 'admin1', 45, '요청승인-45', TO_DATE('2026-07-19 09:56:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (442, 384, 'ADJUST', 2, 16, 10, 19, 9, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-07-21 15:57:32','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (443, 385, 'IN', 13, 13, 14, 34, 48, 'admin2', NULL, '데모-IN', TO_DATE('2026-07-22 07:54:04','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (444, 386, 'OUT', 4, 19, 9, 9, 0, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-07-22 18:36:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (445, 386, 'IN', 5, 19, 9, 19, 28, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-07-22 18:36:21','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (446, 387, 'IN', 12, 12, 21, 494, 515, 'admin2', NULL, '데모-IN', TO_DATE('2026-07-23 20:44:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (447, 388, 'OUT', 14, 29, 5, 26, 21, 'admin3', NULL, '데모-OUT', TO_DATE('2026-07-26 07:27:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (448, 389, 'IN', 7, 14, 8, 0, 8, 'admin2', 132, '요청승인-132', TO_DATE('2026-07-28 06:18:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (449, 390, 'OUT', 12, 3, 5, 5, 0, 'admin3', 214, '요청승인-214', TO_DATE('2026-07-28 23:42:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (450, 391, 'IN', 12, 18, 8, 0, 8, 'admin3', 34, '요청승인-34', TO_DATE('2026-07-29 02:18:56','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (451, 392, 'OUT', 1, 1, 3, 13, 10, 'admin1', NULL, '데모-OUT', TO_DATE('2026-07-30 16:02:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (452, 393, 'IN', 14, 28, 7, 14, 21, 'admin1', 80, '요청승인-80', TO_DATE('2026-07-31 01:34:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (453, 394, 'ADJUST', 12, 26, 5, 13, 8, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-07-31 02:32:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (454, 395, 'IN', 9, 26, 6, 0, 6, 'admin1', 189, '요청승인-189', TO_DATE('2026-07-31 07:15:52','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (455, 396, 'OUT', 5, 20, 6, 17, 11, 'admin2', NULL, '데모-OUT', TO_DATE('2026-08-05 08:16:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (456, 397, 'ADJUST', 14, 28, 10, 21, 11, 'admin3', NULL, '데모-ADJUST', TO_DATE('2026-08-06 12:16:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (457, 398, 'IN', 4, 8, 7, 0, 7, 'admin2', 15, '요청승인-15', TO_DATE('2026-08-06 17:57:06','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (458, 399, 'OUT', 3, 18, 4, 26, 22, 'admin2', NULL, '데모-OUT', TO_DATE('2026-08-09 16:28:44','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (459, 400, 'OUT', 5, 13, 8, 8, 0, 'admin1', 38, '요청승인-38', TO_DATE('2026-08-09 21:13:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (460, 401, 'IN', 10, 28, 2, 0, 2, 'admin3', 98, '요청승인-98', TO_DATE('2026-08-11 05:49:27','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (461, 402, 'OUT', 2, 17, 7, 8, 1, 'admin3', 171, '요청승인-171', TO_DATE('2026-08-13 04:03:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (462, 403, 'IN', 12, 22, 4, 0, 4, 'admin2', 56, '요청승인-56', TO_DATE('2026-08-15 01:52:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (463, 404, 'OUT', 12, 12, 3, 515, 512, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-08-15 03:39:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (464, 404, 'IN', 13, 12, 3, 15, 18, 'admin2', NULL, '데모-MOVE', TO_DATE('2026-08-15 03:39:07','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (465, 405, 'IN', 14, 10, 6, 0, 6, 'admin1', 146, '요청승인-146', TO_DATE('2026-08-15 08:12:48','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (466, 406, 'ADJUST', 10, 10, 500, 514, 14, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-08-16 05:00:17','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (467, 407, 'ADJUST', 12, 12, 495, 512, 17, 'admin2', NULL, '데모-ADJUST', TO_DATE('2026-08-19 05:11:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (468, 408, 'OUT', 6, 1, 8, 8, 0, 'admin2', 230, '요청승인-230', TO_DATE('2026-08-20 03:44:35','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (469, 409, 'ADJUST', 6, 6, 502, 516, 14, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-08-21 03:24:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (470, 410, 'OUT', 2, 19, 6, 6, 0, 'admin1', 182, '요청승인-182', TO_DATE('2026-08-22 05:15:31','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (471, 411, 'OUT', 2, 15, 6, 6, 0, 'admin2', 160, '요청승인-160', TO_DATE('2026-08-22 11:14:38','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (472, 412, 'OUT', 11, 26, 7, 27, 20, 'admin3', NULL, '데모-OUT', TO_DATE('2026-08-23 07:42:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (473, 413, 'IN', 10, 24, 2, 29, 31, 'admin1', 76, '요청승인-76', TO_DATE('2026-08-24 02:43:02','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (474, 414, 'IN', 7, 30, 2, 0, 2, 'admin1', 220, '요청승인-220', TO_DATE('2026-08-24 04:22:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (475, 415, 'IN', 5, 28, 2, 0, 2, 'admin1', 218, '요청승인-218', TO_DATE('2026-08-24 11:10:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (476, 416, 'ADJUST', 7, 6, 3, 15, 12, 'admin1', NULL, '데모-ADJUST', TO_DATE('2026-08-27 02:41:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (477, 417, 'IN', 9, 4, 2, 0, 2, 'admin2', 233, '요청승인-233', TO_DATE('2026-08-28 12:20:13','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (478, 418, 'IN', 11, 11, 13, 34, 47, 'admin2', NULL, '데모-IN', TO_DATE('2026-08-29 03:38:58','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (479, 419, 'OUT', 13, 28, 3, 29, 26, 'admin3', NULL, '데모-OUT', TO_DATE('2026-08-30 07:25:14','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_stock_history (history_no, group_no, history_type, warehouse_no, goods_no, qty, before_qty, after_qty, member_id, request_no, memo, history_date)
VALUES (480, 420, 'OUT', 11, 1, 2, 2, 0, 'admin1', 110, '요청승인-110', TO_DATE('2026-08-31 18:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 1, 10);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 2, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 4, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 6, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 10, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 12, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 14, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 15, 16);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 16, 43);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 26, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (1, 30, 19);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 1, 31);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 2, 26);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 4, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 16, 9);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 17, 1);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (2, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 2, 32);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 3, 20);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 6, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 8, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 10, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 12, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 16, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 17, 18);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 18, 22);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 20, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 22, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (3, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 3, 24);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 4, 9);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 6, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 8, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 10, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 18, 18);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (4, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 4, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 5, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 8, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 12, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 14, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 16, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 18, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 19, 28);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 20, 11);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 22, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 24, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 26, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 28, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (5, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 5, 18);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 6, 14);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 10, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 12, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 14, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 16, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 20, 19);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 21, 26);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (6, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 2, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 6, 12);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 7, 21);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 14, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 18, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 20, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 21, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 22, 40);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 24, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 28, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (7, 30, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 7, 20);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 8, 33);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 10, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 12, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 16, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 18, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 20, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 22, 18);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (8, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 4, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 8, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 9, 13);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 20, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 23, 12);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 24, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 26, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 28, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (9, 30, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 9, 23);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 10, 14);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 12, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 14, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 16, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 18, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 22, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 24, 31);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 26, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 28, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (10, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 2, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 4, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 6, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 10, 21);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 11, 47);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 25, 12);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 26, 20);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (11, 30, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 2, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 4, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 8, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 11, 23);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 12, 17);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 14, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 18, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 20, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 22, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 24, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 26, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 27, 36);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 28, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (12, 30, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 2, 7);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 6, 4);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 8, 2);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 12, 18);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 13, 48);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 14, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 27, 13);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 28, 26);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 29, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (13, 30, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 4, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 6, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 8, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 10, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 13, 20);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 14, 28);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 15, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 20, 6);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 24, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 26, 3);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 28, 11);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 29, 21);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (14, 30, 8);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 1, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 2, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 3, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 4, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 5, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 6, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 7, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 8, 5);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 9, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 10, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 11, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 12, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 13, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 14, 25);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 15, 29);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 16, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 17, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 18, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 19, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 20, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 21, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 22, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 23, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 24, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 25, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 26, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 27, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 28, 0);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 29, 19);
INSERT INTO tb_warehouse_stock (warehouse_no, goods_no, stock_qty) VALUES (15, 30, 9);
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_member;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_member START WITH 24 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_warehouse;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_warehouse START WITH 16 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_category;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_category START WITH 11 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_goods;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_goods START WITH 31 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_request;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_request START WITH 251 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_history;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_history START WITH 481 INCREMENT BY 1 NOCACHE NOCYCLE;
WHENEVER SQLERROR CONTINUE
DROP SEQUENCE seq_group;
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE SEQUENCE seq_group START WITH 421 INCREMENT BY 1 NOCACHE NOCYCLE;
COMMIT;
EXIT;
