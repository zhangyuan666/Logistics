package com.zy.service.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.client.RecipientInfoMapper;
import com.zy.mapper.personnel.CourierInfoMapper;
import com.zy.mapper.personnel.DriverInfoMapper;
import com.zy.mapper.service.CargoInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.service.OrderService;

/**
 * 
 * @author Administrator
 *
 */
@Transactional
@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderInfoMapper omapper;

	@Resource
	private CargoInfoMapper camapper;

	@Resource
	private LogisticsInfoMapper logmapper;

	@Resource
	private CourierInfoMapper courmapper;

	@Resource
	private RecipientInfoMapper recmapper;

	@Resource
	private DriverInfoMapper dmapper;

	/**
	 * 
	 * @MethodName: query
	 * @param order
	 * @return
	 * @see com.zy.service.service.OrderService#query(com.zy.entity.service.OrderInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:58
	 */
	@Override
	public DataGridResult query(OrderInfo order) {
		// TODO Auto-generated method stub
		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		order.setPage((order.getPage() - 1) * order.getRows());
		rs.setRows(omapper.selectRowsList(order));
		rs.setTotal(omapper.count(order));
		return rs;
	}

	/**
	 * 
	 * @MethodName: orderRemove
	 * @param ids
	 * @return
	 * @see com.zy.service.service.OrderService#orderRemove(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:41:01
	 */
	@Override
	public int orderRemove(String ids) {
		int res = 0;
		String[] data = ids.split(",");
		for (String id : data) {
			OrderInfo order = omapper.selectByPrimaryKey(id);
			camapper.deleteByPrimaryKey(order.getCargoId());
			logmapper.deleteByOrderId(id);
			res += omapper.deleteByPrimaryKey(id);
		}
		return res;
	}

	/**
	 * 
	 * @MethodName: selectOrderById
	 * @param orderId
	 * @return
	 * @see com.zy.service.service.OrderService#selectOrderById(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:41:04
	 */
	@Override
	public OrderInfo selectOrderById(String orderId) {
		// TODO Auto-generated method stub
		return omapper.selectByPrimaryKey(orderId);
	}

	/**
	 * 
	 * @MethodName: editOrder
	 * @param orderId
	 * @param orderState
	 * @param driverId
	 * @param courierId
	 * @return
	 * @see com.zy.service.service.OrderService#editOrder(java.lang.String,
	 *      java.lang.Integer, java.lang.Integer, java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:41:07
	 */
	@Override
	public int editOrder(String orderId, Integer orderState, Integer driverId, Integer courierId) {
		// TODO Auto-generated method stub
		OrderInfo order = omapper.selectByPrimaryKey(orderId);
		order.setOrderId(orderId);
		order.setOrderState(orderState);
		order.setCourierId(courierId);
		order.setDriverId(driverId);
		return omapper.updateByPrimaryKeySelective(order);
	}

	/**
	 * 
	 * @MethodName: selectCourList
	 * @return
	 * @see com.zy.service.service.OrderService#selectCourList()
	 * @Description: TODO
	 * @date 2020-07-16 07:41:12
	 */
	@Override
	public List<CourierInfo> selectCourList() {
		// TODO Auto-generated method stub
		return courmapper.selectCourList();
	}

	/**
	 * 
	 * @MethodName: selectDriveList
	 * @return
	 * @see com.zy.service.service.OrderService#selectDriveList()
	 * @Description: TODO
	 * @date 2020-07-16 07:41:15
	 */
	@Override
	public List<DriverInfo> selectDriveList() {
		// TODO Auto-generated method stub
		return dmapper.selectDriveList();
	}

}
