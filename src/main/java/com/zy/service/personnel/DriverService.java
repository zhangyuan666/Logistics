package com.zy.service.personnel;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;

public interface DriverService {

	DataGridResult query(DriverInfo driverInfo);

	int addDriverInfo(DriverInfo record, HttpSession session);

	DriverInfo checkid(Integer driverId);

	List<DriverInfo> driverInfoCombobox();

	DriverInfo findById(Integer driverId);

	int editDriverInfo(DriverInfo record, HttpSession session);

	int remove(String driverInfoIds);

	List<LogisticsInfo> DlogisticsIdCombobox();

	int DlogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);

	List<OrderInfo> selectOrderList();
}
