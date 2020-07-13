package com.zy.mapper.personnel;

import java.util.List;

import com.zy.entity.personnel.DriverInfo;

public interface DriverInfoMapper {
	int deleteByPrimaryKey(Integer driverId);

	int insert(DriverInfo record);

	int insertSelective(DriverInfo record);

	DriverInfo selectByPrimaryKey(Integer driverId);

	int updateByPrimaryKeySelective(DriverInfo record);

	int updateByPrimaryKey(DriverInfo record);

	List<DriverInfo> selectDriveList();

	// 罗海峰添加

	List<Object> selectRowsList(DriverInfo driverInfo);

	Long count(DriverInfo driverInfo);

	List<DriverInfo> driverInfoCombobox();
	
	 /*
     * 曾晓明写仓库管理对配送员分配任务用的
     * */
    List<DriverInfo> driverIdCombobox();
    
	int driverTask(DriverInfo driverTask);
}