package com.kosign.wecafe.forms;

import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;

public class ProductForm {
	
	private String productName;
	private BigDecimal unitPrice;
	private BigDecimal costPrice;
	private BigDecimal salePrice;
	private Long quantity;
	private Long categoryId;
	private MultipartFile images;

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}

	public MultipartFile getImages() {
		return this.images;
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

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Long getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
}
