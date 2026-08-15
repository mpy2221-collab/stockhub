package kr.inventory.goods.dto;

/**
 * 품목의 창고별 현재고.
 */
public class WarehouseStock {
  private int warehouseNo;
  private String warehouseName;
  private int stockQty;

  public int getWarehouseNo() {
    return warehouseNo;
  }

  public void setWarehouseNo(int warehouseNo) {
    this.warehouseNo = warehouseNo;
  }

  public String getWarehouseName() {
    return warehouseName;
  }

  public void setWarehouseName(String warehouseName) {
    this.warehouseName = warehouseName;
  }

  public int getStockQty() {
    return stockQty;
  }

  public void setStockQty(int stockQty) {
    this.stockQty = stockQty;
  }
}
