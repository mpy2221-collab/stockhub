-- 운영 DB 회원 유지. 카테고리 테이블 추가 후 품목.category를 category_no로 이전한다.
SET DEFINE OFF

DECLARE
  n NUMBER;
BEGIN
  SELECT COUNT(*) INTO n FROM user_sequences WHERE sequence_name = 'SEQ_CATEGORY';
  IF n = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_category START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
  END IF;

  SELECT COUNT(*) INTO n FROM user_tables WHERE table_name = 'TB_CATEGORY';
  IF n = 0 THEN
    EXECUTE IMMEDIATE
      'CREATE TABLE tb_category (
         category_no NUMBER PRIMARY KEY,
         category_name VARCHAR2(50) NOT NULL UNIQUE,
         use_yn CHAR(1) DEFAULT ''Y'' NOT NULL
       )';
  END IF;

  SELECT COUNT(*) INTO n FROM user_tab_columns
   WHERE table_name = 'TB_GOODS' AND column_name = 'CATEGORY_NO';
  IF n = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE tb_goods ADD category_no NUMBER';
  END IF;

  SELECT COUNT(*) INTO n FROM user_tab_columns
   WHERE table_name = 'TB_GOODS' AND column_name = 'CATEGORY';
  IF n = 1 THEN
    EXECUTE IMMEDIATE
      'INSERT INTO tb_category (category_no, category_name, use_yn)
       SELECT seq_category.nextval, src.category, ''Y''
         FROM (
           SELECT DISTINCT category
             FROM tb_goods
            WHERE category IS NOT NULL
              AND TRIM(category) IS NOT NULL
         ) src
        WHERE NOT EXISTS (
          SELECT 1 FROM tb_category c WHERE c.category_name = src.category
        )';

    EXECUTE IMMEDIATE
      'UPDATE tb_goods g
          SET category_no = (
            SELECT c.category_no FROM tb_category c WHERE c.category_name = g.category
          )
        WHERE g.category IS NOT NULL
          AND g.category_no IS NULL';

    EXECUTE IMMEDIATE 'ALTER TABLE tb_goods DROP COLUMN category';
  END IF;

  SELECT COUNT(*) INTO n FROM user_constraints
   WHERE table_name = 'TB_GOODS' AND constraint_name = 'FK_GOODS_CATEGORY';
  IF n = 0 THEN
    EXECUTE IMMEDIATE
      'ALTER TABLE tb_goods ADD CONSTRAINT fk_goods_category
         FOREIGN KEY (category_no) REFERENCES tb_category (category_no)';
  END IF;
END;
/

COMMIT;
EXIT;
