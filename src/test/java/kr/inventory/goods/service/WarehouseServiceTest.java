package kr.inventory.goods.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dao.WarehouseDao;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Warehouse;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class WarehouseServiceTest {
  @Mock
  private WarehouseDao warehouseDao;
  @InjectMocks
  private WarehouseService warehouseService;

  @Test
  void 창고_목록은_이름_키워드와_사용여부만_남긴다() {
    Warehouse hit = named("본사창고", AppConstants.USE_N);
    Warehouse miss = named("매장창고", AppConstants.USE_Y);
    when(warehouseDao.selectList(any(AdminSearch.class))).thenReturn(List.of(hit, miss));
    AdminSearch search = new AdminSearch();
    search.setKeyword("본사");
    search.setUseYn(AppConstants.USE_N);

    List<Warehouse> list = warehouseService.selectList(search);

    assertEquals(1, list.size());
    assertEquals("본사창고", list.get(0).getWarehouseName());
  }

  private Warehouse named(String name, String useYn) {
    Warehouse w = new Warehouse();
    w.setWarehouseName(name);
    w.setUseYn(useYn);
    return w;
  }
}
