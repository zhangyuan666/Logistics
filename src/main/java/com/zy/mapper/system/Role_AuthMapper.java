package com.zy.mapper.system;

import com.zy.entity.system.Role_Auth;

public interface Role_AuthMapper {
    int insert(Role_Auth record);

    int insertSelective(Role_Auth record);

	int deleteByRoleId(Integer id);

	int deleteByAuthId(Integer id);

}