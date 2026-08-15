package kr.inventory.goods.dao;

import java.util.List;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.dto.WarehouseStock;
import org.apache.ibatis.annotations.Param;

/**
 * 품목 매퍼.
 */
public interface GoodsDao {
  List<Goods> selectAll();

  List<Goods> selectList(String keyword);

  List<Goods> selectStockList(GoodsSearch search);

  List<Goods> selectAdminList();

  List<Goods> selectAdminListBySearch(GoodsSearch search);

  Goods selectOne(int goodsNo);

  int countByCode(String goodsCode);

  int countByCodeExcept(@Param("goodsCode") String goodsCode, @Param("goodsNo") int goodsNo);

  int insert(Goods goods);

  int update(Goods goods);

  int countAll();

  List<WarehouseStock> selectWarehouseStocks(int goodsNo);
}
