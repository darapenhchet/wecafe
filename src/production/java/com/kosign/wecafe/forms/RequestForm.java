package com.kosign.wecafe.forms;

public class RequestForm {

	private long proId;
	private long proQty;
	private long remainQty;
	
	public long getProQty() {
		return proQty;
	}
	public void setProQty(long proQty) {
		this.proQty = proQty;
	}
	
	public long getProId() {
		return proId;
	}
	public void setProId(long proId) {
		this.proId = proId;
	}
	public long getRemainQty() {
		return remainQty;
	}
	public void setRemainQty(long remainQty) {
		this.remainQty = remainQty;
	}
	@Override
	public String toString() {
		return "RequestForm [proId=" + proId + ", proQty=" + proQty + ", remainQty=" + remainQty + "]";
	}
	
	
}
