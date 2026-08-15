-- StockHub 테이블. 기획서 6장을 tb_ 접두어로 반영한다. 카테고리 포함 7개.
WHENEVER SQLERROR CONTINUE
DROP TABLE tb_stock_history CASCADE CONSTRAINTS;
DROP TABLE tb_stock_request CASCADE CONSTRAINTS;
DROP TABLE tb_warehouse_stock CASCADE CONSTRAINTS;
DROP TABLE tb_goods CASCADE CONSTRAINTS;
DROP TABLE tb_category CASCADE CONSTRAINTS;
DROP TABLE tb_warehouse CASCADE CONSTRAINTS;
DROP TABLE tb_member CASCADE CONSTRAINTS;
DROP SEQUENCE seq_member;
DROP SEQUENCE seq_warehouse;
DROP SEQUENCE seq_category;
DROP SEQUENCE seq_goods;
DROP SEQUENCE seq_request;
DROP SEQUENCE seq_history;
DROP SEQUENCE seq_group;
WHENEVER SQLERROR EXIT SQL.SQLCODE

CREATE SEQUENCE seq_member START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_warehouse START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_category START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_goods START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_request START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_history START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_group START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE tb_member (
  member_no NUMBER PRIMARY KEY,
  member_id VARCHAR2(20) NOT NULL UNIQUE,
  member_pw VARCHAR2(100) NOT NULL,
  member_name VARCHAR2(50) NOT NULL,
  member_phone VARCHAR2(20),
  member_addr VARCHAR2(200),
  member_email VARCHAR2(100),
  member_level NUMBER DEFAULT 3 NOT NULL,
  enroll_date DATE DEFAULT SYSDATE
);

CREATE TABLE tb_warehouse (
  warehouse_no NUMBER PRIMARY KEY,
  warehouse_name VARCHAR2(100) NOT NULL,
  use_yn CHAR(1) DEFAULT 'Y' NOT NULL
);

CREATE TABLE tb_category (
  category_no NUMBER PRIMARY KEY,
  category_name VARCHAR2(50) NOT NULL UNIQUE,
  use_yn CHAR(1) DEFAULT 'Y' NOT NULL
);

CREATE TABLE tb_goods (
  goods_no NUMBER PRIMARY KEY,
  goods_code VARCHAR2(30) NOT NULL UNIQUE,
  goods_name VARCHAR2(100) NOT NULL,
  category_no NUMBER,
  unit VARCHAR2(20),
  safety_qty NUMBER DEFAULT 0,
  unit_price NUMBER,
  image_path VARCHAR2(300),
  use_yn CHAR(1) DEFAULT 'Y' NOT NULL,
  CONSTRAINT fk_goods_category FOREIGN KEY (category_no) REFERENCES tb_category (category_no)
);

CREATE TABLE tb_warehouse_stock (
  warehouse_no NUMBER NOT NULL,
  goods_no NUMBER NOT NULL,
  stock_qty NUMBER DEFAULT 0 NOT NULL,
  CONSTRAINT pk_warehouse_stock PRIMARY KEY (warehouse_no, goods_no),
  CONSTRAINT ck_stock_qty CHECK (stock_qty >= 0),
  CONSTRAINT fk_ws_warehouse FOREIGN KEY (warehouse_no) REFERENCES tb_warehouse (warehouse_no),
  CONSTRAINT fk_ws_goods FOREIGN KEY (goods_no) REFERENCES tb_goods (goods_no)
);

CREATE TABLE tb_stock_request (
  request_no NUMBER PRIMARY KEY,
  member_id VARCHAR2(20) NOT NULL,
  warehouse_no NUMBER NOT NULL,
  goods_no NUMBER NOT NULL,
  qty NUMBER NOT NULL,
  request_type VARCHAR2(20) NOT NULL,
  status VARCHAR2(20) NOT NULL,
  memo VARCHAR2(500),
  request_date DATE DEFAULT SYSDATE,
  process_date DATE,
  process_member_id VARCHAR2(20),
  CONSTRAINT fk_sr_warehouse FOREIGN KEY (warehouse_no) REFERENCES tb_warehouse (warehouse_no),
  CONSTRAINT fk_sr_goods FOREIGN KEY (goods_no) REFERENCES tb_goods (goods_no)
);

CREATE TABLE tb_stock_history (
  history_no NUMBER PRIMARY KEY,
  group_no NUMBER NOT NULL,
  history_type VARCHAR2(20) NOT NULL,
  warehouse_no NUMBER NOT NULL,
  goods_no NUMBER NOT NULL,
  qty NUMBER NOT NULL,
  before_qty NUMBER,
  after_qty NUMBER,
  member_id VARCHAR2(20),
  request_no NUMBER,
  memo VARCHAR2(500),
  history_date DATE DEFAULT SYSDATE,
  CONSTRAINT fk_sh_warehouse FOREIGN KEY (warehouse_no) REFERENCES tb_warehouse (warehouse_no),
  CONSTRAINT fk_sh_goods FOREIGN KEY (goods_no) REFERENCES tb_goods (goods_no),
  CONSTRAINT fk_sh_request FOREIGN KEY (request_no) REFERENCES tb_stock_request (request_no)
);

COMMIT;
