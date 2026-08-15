package kr.inventory.goods.dto;

/**
 * 창고.
 */
public class Warehouse {
  private int warehouseNo;
  private String warehouseName;
  private String useYn;

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

  public String getUseYn() {
    return useYn;
  }

  public void setUseYn(String useYn) {
    this.useYn = useYn;
  }
}
