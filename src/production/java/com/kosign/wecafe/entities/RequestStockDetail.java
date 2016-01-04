package com.kosign.wecafe.entities;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

@Entity
@Table(name = "request_stock_detail")
@AssociationOverrides({
	@AssociationOverride(name = "pk1.request_stock", 
		joinColumns = @JoinColumn(name = "req_iod")),
	@AssociationOverride(name = "pk1.product", 
		joinColumns = @JoinColumn(name = "pro_id")) })
public class RequestStockDetail implements Serializable{

	@EmbeddedId
	private RequestStockDetailPK pk1 = new RequestStockDetailPK();

	@Column(name = "qty")
	private long proQty;


	public long getProQty() {
		return proQty;
	}

	public void setProQty(long proQty) {
		this.proQty = proQty;
	}

	
	@Transient
	public Product getProduct(){
		return pk1.getProduct();
	}
	
	public void setProduct(Product product) {
		this.pk1.setProduct(product);
	}
	
	@Transient
	public ImportProduct getImportProduct(){
		return null;
	//	return pk1.getImportProduct();
	}

	public void setImportProduct(ImportProduct importProduct){
	//	this.pk1.setImportProduct(importProduct);
	}

}
