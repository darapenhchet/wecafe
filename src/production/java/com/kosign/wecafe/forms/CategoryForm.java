package com.kosign.wecafe.forms;

import org.springframework.web.multipart.MultipartFile;

public class CategoryForm {

	private Long categoryId;
	
	private String categoryName;
	
	private MultipartFile image;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
