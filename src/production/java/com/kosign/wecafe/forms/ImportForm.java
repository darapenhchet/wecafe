package com.kosign.wecafe.forms;

public class ImportForm {

	private long quantity;
	private long proId;
	private long UnitPrice;
	private long supplierId;
	
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public long getProId() {
		return proId;
	}
	public void setProId(long proId) {
		this.proId = proId;
	}
	public long getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(long unitPrice) {
		UnitPrice = unitPrice;
	}
	public long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}
}
