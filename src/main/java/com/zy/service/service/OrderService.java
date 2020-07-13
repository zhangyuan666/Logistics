package com.zy.service.service;

import java.util.List;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.OrderInfo;

public interface OrderService {

	DataGridResult query(OrderInfo order);

	int orderRemove(String ids);

	OrderInfo selectOrderById(String orderId);

	int editOrder(String orderId, Integer orderState,Integer driverId,Integer courierId);

	List<CourierInfo> selectCourList();

	List<DriverInfo> selectDriveList();

}
