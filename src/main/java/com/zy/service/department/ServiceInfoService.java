package com.zy.service.department;

import java.util.List;


import com.zy.entity.department.ServiceInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.OrderInfo;

public interface ServiceInfoService {

	DataGridResult query(ServiceInfo serviceInfo);

	int remove(String serviceIds);

	int addserviceInfo(ServiceInfo serviceInfo);

	ServiceInfo checkserviceId(Integer serviceId);

	int editserviceInfo(ServiceInfo serviceInfo);


	int deliveryserviceInfo(CourierInfo courierInfo);


	/*List<CourierInfo> setValues(Integer courierId);*/

	List<CourierInfo> courierCombobox();

	int receiveserviceInfo(CourierInfo courierInfo);



	List<OrderInfo> orderCombobox();

	

	int logisticsserviceInfo(OrderInfo orderInfo,String logisticsInfo);

	

	
	




	

	


	

}
