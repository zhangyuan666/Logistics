package com.zy.entity.personnel;

import java.util.List;

import com.zy.entity.department.WarehouseInfo;

public class DriverInfo {
	private Integer driverId;

	private String driverName;

	private String driverTel;

	private String driverTask;

	private Integer warehouseId;

	// 添加的内容
	private Integer rows;
	private Integer page;

	private String sort;// 需要排序的列名

	private String order;// 排序的规则asc或者desc

	private List<WarehouseInfo> warehouseInfos;

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public List<WarehouseInfo> getWarehouseInfos() {
		return warehouseInfos;
	}

	public void setWarehouseInfos(List<WarehouseInfo> warehouseInfos) {
		this.warehouseInfos = warehouseInfos;
	}

	public Integer getDriverId() {
		return driverId;
	}

	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName == null ? null : driverName.trim();
	}

	public String getDriverTel() {
		return driverTel;
	}

	public void setDriverTel(String driverTel) {
		this.driverTel = driverTel == null ? null : driverTel.trim();
	}

	public String getDriverTask() {
		return driverTask;
	}

	public void setDriverTask(String driverTask) {
		this.driverTask = driverTask == null ? null : driverTask.trim();
	}

	public Integer getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}
}