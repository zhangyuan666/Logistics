package com.zy.mapper.system;

import java.util.List;

import com.zy.entity.system.Auth;

public interface AuthMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Auth record);

    int insertSelective(Auth record);

    Auth selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Auth record);

    int updateByPrimaryKey(Auth record);

	Auth query(Integer integer);
	
	List<Auth> queryRoot();
}