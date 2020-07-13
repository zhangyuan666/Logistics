package com.zy.entity.department;

public class ServiceInfo {
	private Integer serviceId;

	private String serviceName;

	private String serviceAddress;

	private String money;

	/* 新增 */
	// 自定义属性 easyui分页
	private int page;

	private int rows;

	// 排序规则
	private String sort;

	private String order;

	// 新加构造和toString
	public ServiceInfo() {
	}

	public ServiceInfo(Integer serviceId, String serviceName, String serviceAddress, int page, int rows, String sort,
			String order) {
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.serviceAddress = serviceAddress;
		this.page = page;
		this.rows = rows;
		this.sort = sort;
		this.order = order;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
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

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName == null ? null : serviceName.trim();
	}

	public String getServiceAddress() {
		return serviceAddress;
	}

	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress == null ? null : serviceAddress.trim();
	}
}