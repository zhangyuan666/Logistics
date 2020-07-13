package com.zy.mapper.system;

import java.util.List;

import com.zy.entity.system.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Object> selectRowsList(Role role);

	Long count(Role role);

	List<Role> roleCombobox();

	Role seclectOne(Integer id);
}