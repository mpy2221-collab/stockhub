package kr.inventory.common;

import java.io.IOException;
import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * MyBatis SqlSession을 생성한다.
 */
public class MybatisUtil {
  private static final SqlSessionFactory FACTORY;

  static {
    try (InputStream in = Resources.getResourceAsStream("mybatis-config.xml")) {
      FACTORY = new SqlSessionFactoryBuilder().build(in);
    } catch (IOException e) {
      throw new ExceptionInInitializerError(e);
    }
  }

  private MybatisUtil() {
  }

  public static SqlSession getSqlSession() {
    return FACTORY.openSession(false);
  }
}
