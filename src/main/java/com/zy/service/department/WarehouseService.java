package com.zy.service.department;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zy.entity.department.WarehouseInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;

public interface WarehouseService {

	DataGridResult query(WarehouseInfo record);

	int remove(String warehouseIds);

	int addwarehouseInfo(WarehouseInfo record, HttpSession session);

	WarehouseInfo checkWarehouseAddress(String warehouseAddress);
	//将warehouseId查出来放到修改的表格里
	WarehouseInfo checkwarehouseId(int warehouseId);

	int editWarehouse(WarehouseInfo record, HttpSession session);
	//选择配送员ID
	List<DriverInfo> driverIdCombobox();
	//分配配送员任务
	int driverTask(DriverInfo driverTask);
	//选择快递员ID
	List<CourierInfo> courierIdCombobox();
	//分配快递员任务
	int courierTask(CourierInfo courierTask);
	//选择物流ID
	List<LogisticsInfo> logisticsIdCombobox();
	//更新物流信息
	int logisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);

	List<OrderInfo> selectOrderList();
}
