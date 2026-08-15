package kr.inventory.admin.dao;

import java.util.List;
import kr.inventory.admin.dto.ChartPoint;

/**
 * 대시보드 재고 합계 매퍼.
 */
public interface DashboardDao {
  int sumActiveStock();

  List<ChartPoint> selectWarehouseStock();

  List<ChartPoint> selectCategoryStock();
}
