package com.zy.mapper.personnel;

import java.util.List;

import com.zy.entity.personnel.CourierInfo;

public interface CourierInfoMapper {
    int deleteByPrimaryKey(Integer courierId);

    int insert(CourierInfo record);

    int insertSelective(CourierInfo record);

    CourierInfo selectByPrimaryKey(Integer courierId);

    int updateByPrimaryKeySelective(CourierInfo record);

    int updateByPrimaryKey(CourierInfo record);

	List<CourierInfo> selectCourList();
	
	
	//新增
	List<CourierInfo> courierCombobox();
	
	

    //罗海峰添加
	List<Object> selectRowsList(CourierInfo courierInfo);

	Long count( CourierInfo courierInfo);

	List<CourierInfo> courierInfoCombobox();
	
	/*
     * 曾晓明写仓库管理对快递员分配任务用的
     * */
    List<CourierInfo> courierIdCombobox();
    
	int courierTask(CourierInfo courierTask);
}