package com.zy.entity.client;


public class Send {
    private Integer sendId;

    private Integer userInfoId;

    private Integer cargoId;

    private Integer serviceId;

    private Integer recipientId;

    private Integer sendFreight;
    
	public Integer getSendId() {
        return sendId;
    }

    public void setSendId(Integer sendId) {
        this.sendId = sendId;
    }

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public Integer getCargoId() {
        return cargoId;
    }

    public void setCargoId(Integer cargoId) {
        this.cargoId = cargoId;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Integer getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Integer recipientId) {
        this.recipientId = recipientId;
    }

    public Integer getSendFreight() {
        return sendFreight;
    }

    public void setSendFreight(Integer sendFreight) {
        this.sendFreight = sendFreight;
    }
}