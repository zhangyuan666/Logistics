package com.zy.service.client;

import java.util.List;

import com.zy.entity.client.RecipientInfo;
import com.zy.entity.client.UserInfo;
import com.zy.entity.service.CargoInfo;
import com.zy.entity.service.OrderInfo;

public interface DingDanService {

	void insertCargoInfo(CargoInfo cargoInfo);

	int insertSend(Integer cargoId, String recipientName, String userName, Integer serviceId, Integer cargoWeight);

	void insertOrderInfo(String orderId, Integer cargoId, String recipientName, String userName);

	void insertLogisticsInfo(String orderId);

	Integer selectByServiceName(String serviceName);


	void deleteByrecipientId(int recipientId);

	RecipientInfo selectByPrimaryKey(int recipientId);

	void updateRecipientInfo(RecipientInfo recipientInfo);

	void insertRecipientInfo(RecipientInfo recipientInfo);

	List<OrderInfo> selectWuliu(int userInfoId);

	UserInfo selectUserInfo(String userId);

	List<RecipientInfo> selectAllRecipientInfo(int userInfoId);

}
