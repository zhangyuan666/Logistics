package com.zy.mapper.service;

import com.zy.entity.service.CargoInfo;

public interface CargoInfoMapper {
    int deleteByPrimaryKey(Integer cargoId);

    int insert(CargoInfo record);

    int insertSelective(CargoInfo record);

    CargoInfo selectByPrimaryKey(Integer cargoId);

    int updateByPrimaryKeySelective(CargoInfo record);

    int updateByPrimaryKey(CargoInfo record);
}