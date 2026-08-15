package kr.inventory.goods.dto;

/**
 * 재고 목록 검색 조건.
 */
public class GoodsSearch {
  private Integer warehouseNo;
  private Integer categoryNo;
  private String keyword;
  private String useYn;
  private boolean lowStock;

  public Integer getWarehouseNo() {
    return warehouseNo;
  }

  public void setWarehouseNo(Integer warehouseNo) {
    this.warehouseNo = warehouseNo;
  }

  public Integer getCategoryNo() {
    return categoryNo;
  }

  public void setCategoryNo(Integer categoryNo) {
    this.categoryNo = categoryNo;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public String getUseYn() {
    return useYn;
  }

  public void setUseYn(String useYn) {
    this.useYn = useYn;
  }

  public boolean isLowStock() {
    return lowStock;
  }

  public void setLowStock(boolean lowStock) {
    this.lowStock = lowStock;
  }
}
