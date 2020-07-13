package com.zy.mapper.system;

import java.util.List;

import com.zy.entity.system.User_Role;

public interface User_RoleMapper {
    int insert(User_Role record);

    int insertSelective(User_Role record);

	void deleteByUserId(String id);

	List<User_Role> setValues(String userid);

}