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


	@Override
	public void insertCargoInfo(CargoInfo cargoInfo) {
		cargoInfoMapper.insertSelective(cargoInfo);
	}

	@Override
	public int insertSend(Integer cargoId, String recipientName, String userName, Integer serviceId, Integer cargoWeight) {
		int recipientId=recipientInfoMapper.selectByRecipientName(recipientName);
		int userInfoId=userInfoMapper.selectByUserName(userName);
	    	 Send send = new Send();
	 	    send.setCargoId(cargoId);
	 	    send.setRecipientId(recipientId);
	 	    send.setUserInfoId(userInfoId);
	 	    if(cargoWeight<=1) {
	 	    send.setSendFreight(10);
	 	    }else {
	 	    	 send.setSendFreight(10+(cargoWeight-1)*5);
	 	    }
	 	    send.setServiceId(serviceId);
	 		sendMapper.insertSelective(send);
	   
	   return send.getSendFreight();

	}

	@Override
	public void insertOrderInfo(String orderId, Integer cargoId, String recipientName, String userName) {
		int recipientId=recipientInfoMapper.selectByRecipientName(recipientName);
		int userInfoId=userInfoMapper.selectByUserName(userName);
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

	@Override
	public void insertLogisticsInfo(String orderId) {
		LogisticsInfo logisticsInfo = new LogisticsInfo();
		logisticsInfo.setOrderId(orderId);
		logisticsInfo.setLogisticsInfo("已下单");
		logisticsInfoMapper.insertSelective(logisticsInfo);
	}

	@Override
	public Integer selectByServiceName(String serviceName) {
		return serviceInfoMapper.selectByServiceName(serviceName);
	}

	

	@Override
	public void deleteByrecipientId(int recipientId) {
		recipientInfoMapper.deleteByPrimaryKey(recipientId);
		
	}

	@Override
	public RecipientInfo selectByPrimaryKey(int recipientId) {
		return recipientInfoMapper.selectByPrimaryKey(recipientId);
	}

	@Override
	public void updateRecipientInfo(RecipientInfo recipientInfo) {
		recipientInfoMapper.updateByPrimaryKeySelective(recipientInfo);
		
	}

	@Override
	public void insertRecipientInfo(RecipientInfo recipientInfo) {
		
		recipientInfoMapper.insertSelective(recipientInfo);
	}

	@Override
	public List<OrderInfo> selectWuliu(int userInfoId) {
		
		return orderInfoMapper.selectAllDd(userInfoId);
	}

	@Override
	public UserInfo selectUserInfo(String userId) {
		
		return userInfoMapper.selectByUserid(userId);
	}



	@Override
	public List<RecipientInfo> selectAllRecipientInfo(int userInfoId) {
		// TODO Auto-generated method stub
		return recipientInfoMapper.selectAllRecipientInfo(userInfoId);
	}



}
