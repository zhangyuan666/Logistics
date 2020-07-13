package com.zy.mapper.department;

import java.util.List;

import com.zy.entity.department.WarehouseInfo;

public interface WarehouseInfoMapper {
    int deleteByPrimaryKey(Integer warehouseId);

    int insert(WarehouseInfo record);

    int insertSelective(WarehouseInfo record);

    WarehouseInfo selectByPrimaryKey(Integer warehouseId);

    int updateByPrimaryKeySelective(WarehouseInfo record);

    int updateByPrimaryKey(WarehouseInfo record);
    //新增的    
	List<Object> selectRowsList(WarehouseInfo record);
	
	Long count(WarehouseInfo record);
	
	WarehouseInfo selectByWarehouseAddress(String warehouseAddress);
}