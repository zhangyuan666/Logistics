package com.zy.entity.client;

public class RecipientInfo {
    private Integer recipientId;

    private String recipientTel;

    private String recipientProvinces;

    private String recipientAddress;

    private String recipientName;

    private Integer userInfoId;

    public Integer getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Integer recipientId) {
        this.recipientId = recipientId;
    }

    public String getRecipientTel() {
        return recipientTel;
    }

    public void setRecipientTel(String recipientTel) {
        this.recipientTel = recipientTel == null ? null : recipientTel.trim();
    }

    public String getRecipientProvinces() {
        return recipientProvinces;
    }

    public void setRecipientProvinces(String recipientProvinces) {
        this.recipientProvinces = recipientProvinces == null ? null : recipientProvinces.trim();
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress == null ? null : recipientAddress.trim();
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName == null ? null : recipientName.trim();
    }

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }
}