package kr.inventory.admin.dto;

/**
 * 차트 한 칸. 이름과 수량.
 */
public class ChartPoint {
  private String label;
  private int value;

  public ChartPoint() {
  }

  public ChartPoint(String label, int value) {
    this.label = label;
    this.value = value;
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String label) {
    this.label = label;
  }

  public int getValue() {
    return value;
  }

  public void setValue(int value) {
    this.value = value;
  }
}
