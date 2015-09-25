package com.kosign.wecafe.entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="product")
public class Product implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="product_pro_id_seq", name="product_id")
	@GeneratedValue(generator="product_id", strategy=GenerationType.SEQUENCE)
	@Column(name="pro_id")
	private Long productId;
	
	//@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.product",cascade=CascadeType.ALL)
	//@Column(name = "pro_id")
	//@ElementCollection(targetClass=OrderDetail.class)
	/*@ManyToMany(mappedBy="product")
	private Set<OrderDetail> orderDetail = new HashSet<OrderDetail>();*/
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.product", cascade=CascadeType.ALL)
	private Set<OrderDetail> orderDetail = new HashSet<OrderDetail>();
	
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
	
	@ManyToOne
	@JoinColumn(name="cat_id")
	private Category category ;

	@Column(name="img_url")
	private String image;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATED_DATE")
	private Date createdDate;
	
	@Column(name="CREATED_BY")
	private String createdBy;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LAST_UPDATED_DATE")
	private Date lastUpdatedDate;
	
	@Column(name="LAST_UPDATED_BY")
	private String lastUpdatedBy;

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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Category getCategory() {
		return category;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}
}
