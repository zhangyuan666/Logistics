package com.zy.entity.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;
import com.zy.entity.client.RecipientInfo;
import com.zy.entity.client.UserInfo;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;

public class OrderInfo {
	private String orderId;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date orderCreattime;

	private Integer cargoId;

	private Integer courierId;

	private Integer driverId;

	private Integer userInfoId;

	private Integer orderState;

	private Integer recipientId;

	// 自定义属性 easyui分页
	private Integer page;

	private Integer rows;

	// 排序规则
	private String sort;

	private String order;

	private CourierInfo courierInfo;

	private CargoInfo cargoInfo;

	private DriverInfo driverInfo;

	private List<LogisticsInfo> logList;

	private UserInfo userInfo;

	private RecipientInfo recInfo;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
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

	public CourierInfo getCourierInfo() {
		return courierInfo;
	}

	public void setCourierInfo(CourierInfo courierInfo) {
		this.courierInfo = courierInfo;
	}

	public CargoInfo getCargoInfo() {
		return cargoInfo;
	}

	public void setCargoInfo(CargoInfo cargoInfo) {
		this.cargoInfo = cargoInfo;
	}

	public DriverInfo getDriverInfo() {
		return driverInfo;
	}

	public void setDriverInfo(DriverInfo driverInfo) {
		this.driverInfo = driverInfo;
	}

	public List<LogisticsInfo> getLogList() {
		return logList;
	}

	public void setLogList(List<LogisticsInfo> logList) {
		this.logList = logList;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public RecipientInfo getRecInfo() {
		return recInfo;
	}

	public void setRecInfo(RecipientInfo recInfo) {
		this.recInfo = recInfo;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId == null ? null : orderId.trim();
	}

	public Date getOrderCreattime() {
		return orderCreattime;
	}

	public void setOrderCreattime(Date orderCreattime) {
		this.orderCreattime = orderCreattime;
	}

	public Integer getCargoId() {
		return cargoId;
	}

	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}

	public Integer getCourierId() {
		return courierId;
	}

	public void setCourierId(Integer courierId) {
		this.courierId = courierId;
	}

	public Integer getDriverId() {
		return driverId;
	}

	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}

	public Integer getUserInfoId() {
		return userInfoId;
	}

	public void setUserInfoId(Integer userInfoId) {
		this.userInfoId = userInfoId;
	}

	public Integer getOrderState() {
		return orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public Integer getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(Integer recipientId) {
		this.recipientId = recipientId;
	}
}