-- 기존 DB에 입고 요청 유형 컬럼을 추가한다. 기존 행은 출고(OUT).
ALTER TABLE tb_stock_request ADD request_type VARCHAR2(20) DEFAULT 'OUT' NOT NULL;
COMMIT;
EXIT;
