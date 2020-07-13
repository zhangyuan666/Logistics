package com.zy.service.personnel;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;

public interface CourierService {
	DataGridResult query(CourierInfo courierInfo);
	
	List<CourierInfo> courierInfoCombobox();
	
	int addCourierInfo(CourierInfo record,HttpSession session);

	CourierInfo checkid(Integer courierId);

	CourierInfo findById(Integer courierId);

	int editCourierInfo(CourierInfo record, HttpSession session);

	int remove(String courierInfoIds);

	List<LogisticsInfo> ClogisticsIdCombobox();

	int ClogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);

	List<OrderInfo> selectOrderList();

}
