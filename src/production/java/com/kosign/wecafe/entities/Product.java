package com.kosign.wecafe.entities;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {

	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="product_pro_id_seq", name="product_id")
	@GeneratedValue(generator="product_id", strategy=GenerationType.SEQUENCE)
	@Column(name="pro_id")
	private Long productId;
	
	@Column(name="pro_name")
	private String productName;
	
	@Column(name="qty")
	private Long quantity;
	
	@Column(name="unit_price")
	private BigDecimal unitPrice;
	
	@Column(name="cost_price")
	private BigDecimal costPrice;
	
	@Column(name="sale_price")
	private BigDecimal salePrice;
	
	@Column(name="cat_id")
	private Long categoryId;
	
	@Column(name="img_url")
	private String image;

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
