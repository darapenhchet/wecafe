package com.kosign.wecafe.entities;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="order_detail")
/*@AssociationOverrides({
	@AssociationOverride(name = "pk.order", 
		joinColumns = @JoinColumn(name = "order_id")),
	@AssociationOverride(name = "pk.product", 
		joinColumns = @JoinColumn(name = "pro_id")) })*/
public class OrderDetail implements java.io.Serializable{

	/*@EmbeddedId
	private OrderDetailsPK pk = new OrderDetailsPK();*/
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="pro_id")
	private Product product;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="order_id")
	private Order order;
	
	@Column(name="pro_qty")
	private long proQty;
	
	@Column(name="pro_unit_price")
	private BigDecimal proUnitPrice;
	
	@Column(name="pro_comment")
	private String proComment;
	
	@Column(name="pro_status")
	private String proStatus;

	public long getProQty() {
		return proQty;
	}

	public void setProQty(long proQty) {
		this.proQty = proQty;
	}

	public BigDecimal getProUnitPrice() {
		return proUnitPrice;
	}

	public void setProUnitPrice(BigDecimal proUnitPrice) {
		this.proUnitPrice = proUnitPrice;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
