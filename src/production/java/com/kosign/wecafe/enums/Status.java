package com.kosign.wecafe.enums;

public enum Status {

	ACTIVE,
	INACTIVE,
	DELETED,
	LOCKED;
	
	private String state;

	public String getState() {
		return state;
	}

	public void setState(final String state) {
		this.state = state;
	}
	
}
