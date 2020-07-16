package com.zy.service.client.impl;

import java.util.Date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.client.RecipientInfo;
import com.zy.entity.client.Send;
import com.zy.entity.client.UserInfo;
import com.zy.entity.service.CargoInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.client.RecipientInfoMapper;
import com.zy.mapper.client.SendMapper;
import com.zy.mapper.client.UserInfoMapper;
import com.zy.mapper.department.ServiceInfoMapper;
import com.zy.mapper.service.CargoInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.client.DingDanService;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class DingDanServiceI implements DingDanService {

	@Autowired
	private CargoInfoMapper cargoInfoMapper;
	@Autowired
	private RecipientInfoMapper recipientInfoMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private LogisticsInfoMapper logisticsInfoMapper;
	@Autowired
	private SendMapper sendMapper;
	@Autowired
	private ServiceInfoMapper serviceInfoMapper;

	/**
	 * 
	 * @MethodName: insertCargoInfo
	 * @param cargoInfo
	 * @see com.zy.service.client.DingDanService#insertCargoInfo(com.zy.entity.service.CargoInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:58
	 */
	@Override
	public void insertCargoInfo(CargoInfo cargoInfo) {
		cargoInfoMapper.insertSelective(cargoInfo);
	}

	/**
	 * 
	 * @MethodName: insertSend
	 * @param cargoId
	 * @param recipientName
	 * @param userName
	 * @param serviceId
	 * @param cargoWeight
	 * @return
	 * @see com.zy.service.client.DingDanService#insertSend(java.lang.Integer,
	 *      java.lang.String, java.lang.String, java.lang.Integer,
	 *      java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:00
	 */
	@Override
	public int insertSend(Integer cargoId, String recipientName, String userName, Integer serviceId,
			Integer cargoWeight) {
		int recipientId = recipientInfoMapper.selectByRecipientName(recipientName);
		int userInfoId = userInfoMapper.selectByUserName(userName);
		Send send = new Send();
		send.setCargoId(cargoId);
		send.setRecipientId(recipientId);
		send.setUserInfoId(userInfoId);
		if (cargoWeight <= 1) {
			send.setSendFreight(10);
		} else {
			send.setSendFreight(10 + (cargoWeight - 1) * 5);
		}
		send.setServiceId(serviceId);
		sendMapper.insertSelective(send);

		return send.getSendFreight();

	}

	/**
	 * 
	 * @MethodName: insertOrderInfo
	 * @param orderId
	 * @param cargoId
	 * @param recipientName
	 * @param userName
	 * @see com.zy.service.client.DingDanService#insertOrderInfo(java.lang.String,
	 *      java.lang.Integer, java.lang.String, java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:04
	 */
	@Override
	public void insertOrderInfo(String orderId, Integer cargoId, String recipientName, String userName) {
		int recipientId = recipientInfoMapper.selectByRecipientName(recipientName);
		int userInfoId = userInfoMapper.selectByUserName(userName);
		OrderInfo orderInfo = new OrderInfo();
		System.out.println(cargoId);
		orderInfo.setCargoId(cargoId);
		orderInfo.setOrderCreattime(new Date());
		orderInfo.setOrderState(0);
		orderInfo.setOrderId(orderId);
		orderInfo.setRecipientId(recipientId);
		orderInfo.setUserInfoId(userInfoId);
		orderInfoMapper.insertSelective(orderInfo);
	}

	/**
	 * 
	 * @MethodName: insertLogisticsInfo
	 * @param orderId
	 * @see com.zy.service.client.DingDanService#insertLogisticsInfo(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:07
	 */
	@Override
	public void insertLogisticsInfo(String orderId) {
		LogisticsInfo logisticsInfo = new LogisticsInfo();
		logisticsInfo.setOrderId(orderId);
		logisticsInfo.setLogisticsInfo("已下单");
		logisticsInfoMapper.insertSelective(logisticsInfo);
	}

	/**
	 * 
	 * @MethodName: selectByServiceName
	 * @param serviceName
	 * @return
	 * @see com.zy.service.client.DingDanService#selectByServiceName(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:10
	 */
	@Override
	public Integer selectByServiceName(String serviceName) {
		return serviceInfoMapper.selectByServiceName(serviceName);
	}

	/**
	 * 
	 * @MethodName: deleteByrecipientId
	 * @param recipientId
	 * @see com.zy.service.client.DingDanService#deleteByrecipientId(int)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:13
	 */
	@Override
	public void deleteByrecipientId(int recipientId) {
		recipientInfoMapper.deleteByPrimaryKey(recipientId);

	}

	/**
	 * 
	 * @MethodName: selectByPrimaryKey
	 * @param recipientId
	 * @return
	 * @see com.zy.service.client.DingDanService#selectByPrimaryKey(int)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:16
	 */
	@Override
	public RecipientInfo selectByPrimaryKey(int recipientId) {
		return recipientInfoMapper.selectByPrimaryKey(recipientId);
	}

	/**
	 * 
	 * @MethodName: updateRecipientInfo
	 * @param recipientInfo
	 * @see com.zy.service.client.DingDanService#updateRecipientInfo(com.zy.entity.client.RecipientInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:20
	 */
	@Override
	public void updateRecipientInfo(RecipientInfo recipientInfo) {
		recipientInfoMapper.updateByPrimaryKeySelective(recipientInfo);

	}

	/**
	 * 
	 * @MethodName: insertRecipientInfo
	 * @param recipientInfo
	 * @see com.zy.service.client.DingDanService#insertRecipientInfo(com.zy.entity.client.RecipientInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:23
	 */
	@Override
	public void insertRecipientInfo(RecipientInfo recipientInfo) {

		recipientInfoMapper.insertSelective(recipientInfo);
	}

	/**
	 * 
	 * @MethodName: selectWuliu
	 * @param userInfoId
	 * @return
	 * @see com.zy.service.client.DingDanService#selectWuliu(int)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:26
	 */
	@Override
	public List<OrderInfo> selectWuliu(int userInfoId) {

		return orderInfoMapper.selectAllDd(userInfoId);
	}

	/**
	 * 
	 * @MethodName: selectUserInfo
	 * @param userId
	 * @return
	 * @see com.zy.service.client.DingDanService#selectUserInfo(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:29
	 */
	@Override
	public UserInfo selectUserInfo(String userId) {

		return userInfoMapper.selectByUserid(userId);
	}

	/**
	 * 
	 * @MethodName: selectAllRecipientInfo
	 * @param userInfoId
	 * @return
	 * @see com.zy.service.client.DingDanService#selectAllRecipientInfo(int)
	 * @Description: TODO
	 * @date 2020-07-16 07:21:32
	 */
	@Override
	public List<RecipientInfo> selectAllRecipientInfo(int userInfoId) {
		// TODO Auto-generated method stub
		return recipientInfoMapper.selectAllRecipientInfo(userInfoId);
	}

}
