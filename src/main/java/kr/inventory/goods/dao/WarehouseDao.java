package kr.inventory.goods.dao;

import java.util.List;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Warehouse;

/**
 * 창고 매퍼.
 */
public interface WarehouseDao {
  List<Warehouse> selectAll();

  List<Warehouse> selectList(AdminSearch search);

  List<Warehouse> selectActiveList();

  Warehouse selectOne(int warehouseNo);

  int insert(Warehouse warehouse);

  int update(Warehouse warehouse);

  int countAll();
}
