package kr.inventory.goods.service;

import java.util.ArrayList;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MybatisUtil;
import kr.inventory.goods.dao.CategoryDao;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Category;
import org.apache.ibatis.session.SqlSession;

/**
 * 품목 카테고리 등록·수정과 목록 조회를 담당한다.
 */
public class CategoryService {
  private CategoryDao categoryDao;

  public CategoryService() {
  }

  public CategoryService(CategoryDao categoryDao) {
    this.categoryDao = categoryDao;
  }

  public List<Category> selectAll() {
    return withDao(dao -> dao.selectAll());
  }

  public List<Category> selectList(AdminSearch search) {
    AdminSearch cond = search == null ? new AdminSearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    List<Category> raw = withDao(dao -> dao.selectList(cond));
    return filterList(raw, cond);
  }

  private List<Category> filterList(List<Category> raw, AdminSearch cond) {
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    String useYn = cond.getUseYn();
    List<Category> result = new ArrayList<>();
    for (Category c : raw) {
      if (useYn != null && !useYn.isEmpty() && !useYn.equals(c.getUseYn())) {
        continue;
      }
      if (!key.isEmpty()) {
        String name = c.getCategoryName() == null ? "" : c.getCategoryName().toLowerCase();
        if (!name.contains(key)) {
          continue;
        }
      }
      result.add(c);
    }
    return result;
  }

  public List<Category> selectActiveList() {
    return withDao(dao -> dao.selectActiveList());
  }

  public Category selectOne(int categoryNo) {
    return withDao(dao -> dao.selectOne(categoryNo));
  }

  /**
   * 이름이 이미 있으면 0.
   */
  public int insert(Category category) {
    if (category == null || isBlank(category.getCategoryName())) {
      return 0;
    }
    if (isDuplicatedName(category.getCategoryName())) {
      return 0;
    }
    if (category.getUseYn() == null || category.getUseYn().isEmpty()) {
      category.setUseYn(AppConstants.USE_Y);
    }
    return write(dao -> dao.insert(category));
  }

  /**
   * 다른 행이 같은 이름을 쓰면 0.
   */
  public int update(Category category) {
    if (category == null || isBlank(category.getCategoryName())) {
      return 0;
    }
    if (isDuplicatedName(category.getCategoryName(), category.getCategoryNo())) {
      return 0;
    }
    return write(dao -> dao.update(category));
  }

  public boolean isDuplicatedName(String categoryName) {
    if (isBlank(categoryName)) {
      return false;
    }
    return withDao(dao -> dao.countByName(categoryName.trim())) > 0;
  }

  public boolean isDuplicatedName(String categoryName, int categoryNo) {
    if (isBlank(categoryName)) {
      return false;
    }
    return withDao(dao -> dao.countByNameExcept(categoryName.trim(), categoryNo)) > 0;
  }

  private boolean isBlank(String v) {
    return v == null || v.trim().isEmpty();
  }

  private <T> T withDao(java.util.function.Function<CategoryDao, T> action) {
    CategoryDao dao = categoryDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(CategoryDao.class);
      }
      return action.apply(dao);
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  private int write(java.util.function.ToIntFunction<CategoryDao> action) {
    CategoryDao dao = categoryDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(CategoryDao.class);
      }
      int result = action.applyAsInt(dao);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }
}
