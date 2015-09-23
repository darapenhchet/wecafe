package com.kosign.wecafe.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="order_detail")
public class OrderDetail {

	@Column(name="pro_id")
	private long proId;
	
	@Column(name="pro_qty")
	private long proQty;
	
	@Column(name="pro_unti_price")
	private long proUtiPrice;
	
	@Column(name="pro_comment")
	private String proComment;
	
	@Column(name="pro_status")
	private String proStatus;
	
	@Column(name="order_id")
	private long order_id;

	public long getProId() {
		return proId;
	}

	public void setProId(long proId) {
		this.proId = proId;
	}

	public long getProQty() {
		return proQty;
	}

	public void setProQty(long proQty) {
		this.proQty = proQty;
	}

	public long getProUtiPrice() {
		return proUtiPrice;
	}

	public void setProUtiPrice(long proUtiPrice) {
		this.proUtiPrice = proUtiPrice;
	}

	public String getProComment() {
		return proComment;
	}

	public void setProComment(String proComment) {
		this.proComment = proComment;
	}

	public String getProStatus() {
		return proStatus;
	}

	public void setProStatus(String proStatus) {
		this.proStatus = proStatus;
	}

	public long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	
	

}
