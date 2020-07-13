package com.zy.mapper.client;

import com.zy.entity.client.Send;

public interface SendMapper {
    int deleteByPrimaryKey(Integer sendId);

    int insert(Send record);

    int insertSelective(Send record);

    Send selectByPrimaryKey(Integer sendId);

    int updateByPrimaryKeySelective(Send record);

    int updateByPrimaryKey(Send record);

}