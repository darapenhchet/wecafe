package com.kosign.wecafe.forms;

import org.springframework.web.multipart.MultipartFile;

public class ProductForm {
	private String productname;
	private MultipartFile images;

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}

	public MultipartFile getImages() {
		return this.images;
	}

}
