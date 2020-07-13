package com.zy.mapper.client;

import org.apache.ibatis.annotations.Param;

import com.zy.entity.client.UserLogin;

public interface UserLoginMapper {
    int deleteByPrimaryKey(String userId);

    int insert(UserLogin record);

    int insertSelective(UserLogin record);

    UserLogin selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(UserLogin record);

    int updateByPrimaryKey(UserLogin record);
    
    int editpassword(@Param("id")String id, @Param("oldpassword")String oldpassword, @Param("newpassword")String newpassword);

	UserLogin selectOne(String id);

	int findpassword(@Param("id")String id, @Param("userTel")String userTel, @Param("newpassword")String newpassword);
}