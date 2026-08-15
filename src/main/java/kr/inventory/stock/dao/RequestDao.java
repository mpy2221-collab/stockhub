package kr.inventory.stock.dao;

import java.util.List;
import kr.inventory.stock.dto.RequestSearch;
import kr.inventory.stock.dto.StockRequest;
import org.apache.ibatis.annotations.Param;

/**
 * 입고·출고 요청 매퍼.
 */
public interface RequestDao {
  StockRequest selectOne(int requestNo);

  List<StockRequest> selectMyList(String memberId);

  List<StockRequest> selectList();

  List<StockRequest> selectBySearch(RequestSearch search);

  int countWait();

  int insert(StockRequest request);

  int updateApprove(@Param("requestNo") int requestNo, @Param("adminId") String adminId);

  int updateReject(@Param("requestNo") int requestNo, @Param("adminId") String adminId);

  int updateCancel(@Param("requestNo") int requestNo, @Param("memberId") String memberId);
}
