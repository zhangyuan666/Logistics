package com.zy.entity.client;

public class UserInfo {
    private Integer userInfoId;

    private String userTel;

    private String userProvinces;

    private String userAddress;

    private String userId;

    private String userName;
    
    

    @Override
	public String toString() {
		return "UserInfo [userInfoId=" + userInfoId + ", userTel=" + userTel + ", userProvinces=" + userProvinces
				+ ", userAddress=" + userAddress + ", userId=" + userId + ", userName=" + userName + "]";
	}

	public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public String getUserProvinces() {
        return userProvinces;
    }

    public void setUserProvinces(String userProvinces) {
        this.userProvinces = userProvinces == null ? null : userProvinces.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}