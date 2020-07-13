package com.zy.service.department.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.department.ServiceInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.department.ServiceInfoMapper;
import com.zy.mapper.personnel.CourierInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.department.ServiceInfoService;

@Service
@Transactional
public class ServiceInfoServiceImpl implements ServiceInfoService {

	@Resource
	private ServiceInfoMapper mapper;

	@Resource
	private CourierInfoMapper cimapper;

	@Resource
	private OrderInfoMapper oimapper;

	@Resource
	private LogisticsInfoMapper limapper;

	@Override
	public DataGridResult query(ServiceInfo serviceInfo) {
		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		serviceInfo.setPage((serviceInfo.getPage() - 1) * serviceInfo.getRows());
		rs.setRows(mapper.selectRowsList(serviceInfo));
		rs.setTotal(mapper.count(serviceInfo));
		return rs;
	}

	@Override
	@Transactional
	public int remove(String serviceIds) {
		int count = 0;
		String[] data = serviceIds.split(",");
		for (String serviceId : data) {

			// mapper.deleteByServiceInfoId(Integer.parseInt(serviceId));
			count += mapper.deleteByPrimaryKey(Integer.parseInt(serviceId));
		}
		return count;
	}

	@Override
	public int addserviceInfo(ServiceInfo serviceInfo) {

		return mapper.insertSelective(serviceInfo);
	}

	@Override
	public ServiceInfo checkserviceId(Integer serviceId) {
		return mapper.selectByPrimaryKey(serviceId);
	}

	@Override
	public int editserviceInfo(ServiceInfo serviceInfo) {

		return mapper.updateByPrimaryKeySelective(serviceInfo);
	}

	@Override
	public int deliveryserviceInfo(CourierInfo courierInfo) {

		return cimapper.updateByPrimaryKeySelective(courierInfo);
	}

	/*
	 * @Override public List<CourierInfo> setValues(Integer courierId) {
	 * 
	 * return cimapper.setValues(courierId); }
	 */

	@Override
	public List<CourierInfo> courierCombobox() {

		return cimapper.courierCombobox();
	}

	@Override
	public int receiveserviceInfo(CourierInfo courierInfo) {

		return cimapper.updateByPrimaryKeySelective(courierInfo);
	}

	@Override
	public int logisticsserviceInfo(OrderInfo orderInfo, String logisticsInfo) {

		oimapper.updateOrderStateByKey(orderInfo);

		return limapper.insertOne(orderInfo.getOrderId(), logisticsInfo);

	}

	@Override
	public List<OrderInfo> orderCombobox() {

		return oimapper.orderCombobox();
	}

}
