package kr.inventory.goods.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dao.CategoryDao;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Category;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class CategoryServiceTest {
  @Mock
  private CategoryDao categoryDao;
  @InjectMocks
  private CategoryService categoryService;

  @Test
  void 이름_중복이면_등록_실패한다() {
    Category c = new Category();
    c.setCategoryName("사무용품");
    when(categoryDao.countByName("사무용품")).thenReturn(1);

    int result = categoryService.insert(c);

    assertEquals(0, result);
    verify(categoryDao, never()).insert(any(Category.class));
  }

  @Test
  void 이름이_없으면_등록_실패한다() {
    Category c = new Category();
    c.setCategoryName("  ");

    int result = categoryService.insert(c);

    assertEquals(0, result);
    verify(categoryDao, never()).insert(any(Category.class));
  }

  @Test
  void 카테고리_등록에_성공한다() {
    Category c = new Category();
    c.setCategoryName("전자기기");
    when(categoryDao.countByName("전자기기")).thenReturn(0);
    when(categoryDao.insert(c)).thenReturn(1);

    int result = categoryService.insert(c);

    assertEquals(1, result);
    assertEquals(AppConstants.USE_Y, c.getUseYn());
    verify(categoryDao, times(1)).insert(c);
  }

  @Test
  void 카테고리_목록은_이름_키워드와_사용여부만_남긴다() {
    Category hit = named("사무용품", AppConstants.USE_Y);
    Category miss = named("전자기기", AppConstants.USE_N);
    when(categoryDao.selectList(any(AdminSearch.class))).thenReturn(List.of(hit, miss));
    AdminSearch search = new AdminSearch();
    search.setKeyword("사무");
    search.setUseYn(AppConstants.USE_Y);

    List<Category> list = categoryService.selectList(search);

    assertEquals(1, list.size());
    assertEquals("사무용품", list.get(0).getCategoryName());
  }

  private Category named(String name, String useYn) {
    Category c = new Category();
    c.setCategoryName(name);
    c.setUseYn(useYn);
    return c;
  }
}
