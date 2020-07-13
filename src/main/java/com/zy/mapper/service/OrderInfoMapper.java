package com.zy.mapper.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	List<OrderInfo> selectAllDd(int userInfoId);

	int updateOrder(@Param("orderId")String orderId, @Param("courierId")Integer courierId);

	int updateOrderDriver(@Param("orderId")String orderId, @Param("driverId")Integer driverId);
}