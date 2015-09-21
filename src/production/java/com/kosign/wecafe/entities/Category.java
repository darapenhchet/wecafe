package com.kosign.wecafe.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {

	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="category_cat_id_seq", name="cat_id")
	@GeneratedValue(generator="cat_id", strategy=GenerationType.SEQUENCE)
	@Column(name="cat_id")
	private long catId;
	
	@Column(name="cat_name")
	private String catName;
	
	@Column(name="img_url")
	private String img;
	
	public long getCatId() {
		return catId;
	}

	public void setCatId(long catId) {
		this.catId = catId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
