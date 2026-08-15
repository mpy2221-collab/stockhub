package kr.inventory.stock.dao;

import java.util.List;
import kr.inventory.stock.dto.HistorySearch;
import kr.inventory.stock.dto.StockHistory;
import org.apache.ibatis.annotations.Param;

/**
 * 창고 재고와 이력 매퍼.
 */
public interface StockDao {
  Integer selectQty(@Param("warehouseNo") int warehouseNo, @Param("goodsNo") int goodsNo);

  int insertStock(@Param("warehouseNo") int warehouseNo, @Param("goodsNo") int goodsNo,
      @Param("qty") int qty);

  int increase(@Param("warehouseNo") int warehouseNo, @Param("goodsNo") int goodsNo,
      @Param("qty") int qty);

  int decrease(@Param("warehouseNo") int warehouseNo, @Param("goodsNo") int goodsNo,
      @Param("qty") int qty);

  int insertHistory(StockHistory history);

  int nextGroupNo();

  int setQty(@Param("warehouseNo") int warehouseNo, @Param("goodsNo") int goodsNo,
      @Param("qty") int qty);

  List<StockHistory> selectHistoryList();

  List<StockHistory> selectHistoryBySearch(HistorySearch search);
}
