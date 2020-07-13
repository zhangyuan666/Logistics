package com.zy.mapper.client;

import java.util.List;

import com.zy.entity.client.RecipientInfo;

public interface RecipientInfoMapper {
    int deleteByPrimaryKey(Integer recipientId);

    int insert(RecipientInfo record);

    int insertSelective(RecipientInfo record);

    RecipientInfo selectByPrimaryKey(Integer recipientId);

    int updateByPrimaryKeySelective(RecipientInfo record);

    int updateByPrimaryKey(RecipientInfo record);
    
    int selectByRecipientName(String recipientName);

	List<RecipientInfo> selectAllRecipientInfo();

}