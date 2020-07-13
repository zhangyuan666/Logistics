package com.zy.mapper.service;

import java.util.List;

import com.zy.entity.service.OrderInfo;

public interface OrderInfoMapper {
	int deleteByPrimaryKey(String orderId);

	int insert(OrderInfo record);

	int insertSelective(OrderInfo record);

	OrderInfo selectByPrimaryKey(String orderId);

	int updateByPrimaryKeySelective(OrderInfo record);

	int updateByPrimaryKey(OrderInfo record);

	List<Object> selectRowsList(OrderInfo order);

	Long count(OrderInfo order);

	// 张强新增
	List<OrderInfo> orderCombobox();

	int updateOrderStateByKey(OrderInfo orderInfo);
	
//
	List<OrderInfo> selectAllDd(int userInfoId);
}