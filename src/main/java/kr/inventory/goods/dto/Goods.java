package kr.inventory.goods.dto;

/**
 * 품목. stockQty는 전 창고 합계(조회용).
 */
public class Goods {
  private int goodsNo;
  private String goodsCode;
  private String goodsName;
  private int categoryNo;
  private String category;
  private String unit;
  private int safetyQty;
  private int unitPrice;
  private String imagePath;
  private String useYn;
  private int stockQty;
  private int totalQty;

  public int getGoodsNo() {
    return goodsNo;
  }

  public void setGoodsNo(int goodsNo) {
    this.goodsNo = goodsNo;
  }

  public String getGoodsCode() {
    return goodsCode;
  }

  public void setGoodsCode(String goodsCode) {
    this.goodsCode = goodsCode;
  }

  public String getGoodsName() {
    return goodsName;
  }

  public void setGoodsName(String goodsName) {
    this.goodsName = goodsName;
  }

  public int getCategoryNo() {
    return categoryNo;
  }

  public void setCategoryNo(int categoryNo) {
    this.categoryNo = categoryNo;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public int getSafetyQty() {
    return safetyQty;
  }

  public void setSafetyQty(int safetyQty) {
    this.safetyQty = safetyQty;
  }

  public int getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(int unitPrice) {
    this.unitPrice = unitPrice;
  }

  public String getImagePath() {
    return imagePath;
  }

  public void setImagePath(String imagePath) {
    this.imagePath = imagePath;
  }

  public String getUseYn() {
    return useYn;
  }

  public void setUseYn(String useYn) {
    this.useYn = useYn;
  }

  public int getStockQty() {
    return stockQty;
  }

  public void setStockQty(int stockQty) {
    this.stockQty = stockQty;
  }

  public int getTotalQty() {
    return totalQty;
  }

  public void setTotalQty(int totalQty) {
    this.totalQty = totalQty;
  }
}
