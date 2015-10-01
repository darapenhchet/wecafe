package com.kosign.wecafe.enums;

public enum UserRoleType {

	USER,
	SELLER,
	ADMIN;
	
	String userRoleType;

	public String getUserRoleType() {
		return userRoleType;
	}

	public void setUserRoleType(String userRoleType) {
		this.userRoleType = userRoleType;
	}
	
}
