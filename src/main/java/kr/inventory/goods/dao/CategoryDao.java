package kr.inventory.goods.dao;

import java.util.List;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Category;
import org.apache.ibatis.annotations.Param;

/**
 * 카테고리 매퍼.
 */
public interface CategoryDao {
  List<Category> selectAll();

  List<Category> selectList(AdminSearch search);

  List<Category> selectActiveList();

  Category selectOne(int categoryNo);

  int countByName(String categoryName);

  int countByNameExcept(@Param("categoryName") String categoryName,
      @Param("categoryNo") int categoryNo);

  int insert(Category category);

  int update(Category category);

  int countAll();
}
