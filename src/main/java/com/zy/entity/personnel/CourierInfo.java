package com.zy.entity.personnel;

import java.util.List;

import com.zy.entity.department.ServiceInfo;

public class CourierInfo {
	private Integer courierId;

	private String courierName;

	private String courierTel;

	private String courierTask;

	private Integer serviceId;

	// 添加的内容
	private Integer rows;
	private Integer page;

	private String sort;// 需要排序的列名

	private String order;// 排序的规则asc或者desc
	private List<ServiceInfo> serviceInfos;

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

	public List<ServiceInfo> getServiceInfos() {
		return serviceInfos;
	}

	public void setServiceInfos(List<ServiceInfo> serviceInfos) {
		this.serviceInfos = serviceInfos;
	}

	public Integer getCourierId() {
		return courierId;
	}

	public void setCourierId(Integer courierId) {
		this.courierId = courierId;
	}

	public String getCourierName() {
		return courierName;
	}

	public void setCourierName(String courierName) {
		this.courierName = courierName == null ? null : courierName.trim();
	}

	public String getCourierTel() {
		return courierTel;
	}

	public void setCourierTel(String courierTel) {
		this.courierTel = courierTel == null ? null : courierTel.trim();
	}

	public String getCourierTask() {
		return courierTask;
	}

	public void setCourierTask(String courierTask) {
		this.courierTask = courierTask == null ? null : courierTask.trim();
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}
}