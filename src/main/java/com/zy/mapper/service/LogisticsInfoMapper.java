package com.zy.mapper.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.entity.service.LogisticsInfo;

public interface LogisticsInfoMapper {
	int deleteByPrimaryKey(Integer logisticsId);

	int insert(LogisticsInfo record);

	int insertSelective(LogisticsInfo record);

	LogisticsInfo selectByPrimaryKey(Integer logisticsId);

	int updateByPrimaryKeySelective(LogisticsInfo record);

	int updateByPrimaryKey(LogisticsInfo record);

	int deleteByOrderId(String id);

	// 张强新增
	int insertOne(@Param("orderId") String orderId, @Param("logisticsInfo") String logisticsInfo);

	// 罗海峰新添加
	List<LogisticsInfo> ClogisticsIdCombobox();

	int ClogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);

	List<LogisticsInfo> DlogisticsIdCombobox();

	int DlogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);
	
	
	/*
     * 曾晓明写仓库管理的物流更新用的
     * */
    //物流更新
	List<LogisticsInfo> logisticsIdCombobox();

	int logisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate);
}