package com.zy.mapper.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.entity.system.User;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	int editpassword(@Param("id")String id, @Param("oldpassword")String oldpassword, @Param("newpassword")String newpassword);

	List<Object> selectRowsList( User user);

	Long count( User user);

	User selectOne(String id);

	List<User> list();

}