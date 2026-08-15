package kr.inventory.admin.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * 대시보드 차트 4종 JSON.
 */
public class DashboardChart {
  private List<String> monthLabels = new ArrayList<>();
  private List<Integer> monthIn = new ArrayList<>();
  private List<Integer> monthOut = new ArrayList<>();
  private List<String> warehouseLabels = new ArrayList<>();
  private List<Integer> warehouseValues = new ArrayList<>();
  private List<String> categoryLabels = new ArrayList<>();
  private List<Integer> categoryValues = new ArrayList<>();
  private List<String> topOutLabels = new ArrayList<>();
  private List<Integer> topOutValues = new ArrayList<>();

  public List<String> getMonthLabels() {
    return monthLabels;
  }

  public void setMonthLabels(List<String> monthLabels) {
    this.monthLabels = monthLabels;
  }

  public List<Integer> getMonthIn() {
    return monthIn;
  }

  public void setMonthIn(List<Integer> monthIn) {
    this.monthIn = monthIn;
  }

  public List<Integer> getMonthOut() {
    return monthOut;
  }

  public void setMonthOut(List<Integer> monthOut) {
    this.monthOut = monthOut;
  }

  public List<String> getWarehouseLabels() {
    return warehouseLabels;
  }

  public void setWarehouseLabels(List<String> warehouseLabels) {
    this.warehouseLabels = warehouseLabels;
  }

  public List<Integer> getWarehouseValues() {
    return warehouseValues;
  }

  public void setWarehouseValues(List<Integer> warehouseValues) {
    this.warehouseValues = warehouseValues;
  }

  public List<String> getCategoryLabels() {
    return categoryLabels;
  }

  public void setCategoryLabels(List<String> categoryLabels) {
    this.categoryLabels = categoryLabels;
  }

  public List<Integer> getCategoryValues() {
    return categoryValues;
  }

  public void setCategoryValues(List<Integer> categoryValues) {
    this.categoryValues = categoryValues;
  }

  public List<String> getTopOutLabels() {
    return topOutLabels;
  }

  public void setTopOutLabels(List<String> topOutLabels) {
    this.topOutLabels = topOutLabels;
  }

  public List<Integer> getTopOutValues() {
    return topOutValues;
  }

  public void setTopOutValues(List<Integer> topOutValues) {
    this.topOutValues = topOutValues;
  }
}
