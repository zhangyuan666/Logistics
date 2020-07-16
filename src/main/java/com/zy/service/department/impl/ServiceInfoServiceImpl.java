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

/**
 * 
 * @author Administrator
 *
 */
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

	/**
	 * 
	 * @MethodName: query
	 * @param serviceInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#query(com.zy.entity.department.ServiceInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:37:45
	 */
	@Override
	public DataGridResult query(ServiceInfo serviceInfo) {
		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		serviceInfo.setPage((serviceInfo.getPage() - 1) * serviceInfo.getRows());
		rs.setRows(mapper.selectRowsList(serviceInfo));
		rs.setTotal(mapper.count(serviceInfo));
		return rs;
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param serviceIds
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#remove(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:37:48
	 */
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

	/**
	 * 
	 * @MethodName: addserviceInfo
	 * @param serviceInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#addserviceInfo(com.zy.entity.department.ServiceInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:37:51
	 */
	@Override
	public int addserviceInfo(ServiceInfo serviceInfo) {

		return mapper.insertSelective(serviceInfo);
	}

	/**
	 * 
	 * @MethodName: checkserviceId
	 * @param serviceId
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#checkserviceId(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:37:54
	 */
	@Override
	public ServiceInfo checkserviceId(Integer serviceId) {
		return mapper.selectByPrimaryKey(serviceId);
	}

	/**
	 * 
	 * @MethodName: editserviceInfo
	 * @param serviceInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#editserviceInfo(com.zy.entity.department.ServiceInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:37:57
	 */
	@Override
	public int editserviceInfo(ServiceInfo serviceInfo) {

		return mapper.updateByPrimaryKeySelective(serviceInfo);
	}

	/**
	 * 
	 * @MethodName: deliveryserviceInfo
	 * @param courierInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#deliveryserviceInfo(com.zy.entity.personnel.CourierInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:01
	 */
	@Override
	public int deliveryserviceInfo(CourierInfo courierInfo) {

		return cimapper.updateByPrimaryKeySelective(courierInfo);
	}

	/**
	 * 
	 * @MethodName: courierCombobox
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#courierCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:38:06
	 */
	@Override
	public List<CourierInfo> courierCombobox() {

		return cimapper.courierCombobox();
	}

	/**
	 * 
	 * @MethodName: receiveserviceInfo
	 * @param courierInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#receiveserviceInfo(com.zy.entity.personnel.CourierInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:12
	 */
	@Override
	public int receiveserviceInfo(CourierInfo courierInfo) {

		return cimapper.updateByPrimaryKeySelective(courierInfo);
	}

	/**
	 * 
	 * @MethodName: logisticsserviceInfo
	 * @param orderInfo
	 * @param logisticsInfo
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#logisticsserviceInfo(com.zy.entity.service.OrderInfo,
	 *      java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:16
	 */
	@Override
	public int logisticsserviceInfo(OrderInfo orderInfo, String logisticsInfo) {

		oimapper.updateOrderStateByKey(orderInfo);

		return limapper.insertOne(orderInfo.getOrderId(), logisticsInfo);

	}

	/**
	 * 
	 * @MethodName: orderCombobox
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#orderCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:38:23
	 */
	@Override
	public List<OrderInfo> orderCombobox() {

		return oimapper.orderCombobox();
	}

	/**
	 * 
	 * @MethodName: updateOrder
	 * @param orderId
	 * @param courierId
	 * @return
	 * @see com.zy.service.department.ServiceInfoService#updateOrder(java.lang.String,
	 *      java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:27
	 */
	@Override
	public int updateOrder(String orderId, Integer courierId) {
		// TODO Auto-generated method stub
		return oimapper.updateOrder(orderId, courierId);
	}

}
