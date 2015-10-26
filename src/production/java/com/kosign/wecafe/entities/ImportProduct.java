package com.kosign.wecafe.entities;

import java.io.Serializable;
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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="import")
public class ImportProduct implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="import_imp_id", name="imp_id")
	@GeneratedValue(generator="imp_id", strategy=GenerationType.SEQUENCE)
	@Column(name="imp_id")
	private long impId;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk1.importProduct", cascade=CascadeType.ALL)
	private Set<ImportDetail> importDetail = new HashSet<ImportDetail>();

	
	@Column(name="imp_date")
	private Date impDate;

	@Column(name="user_id")
	private long userId;
	
	

	public Set<ImportDetail> getImportDetail() {
		return importDetail;
	}

	public void setImportDetail(Set<ImportDetail> importDetail) {
		this.importDetail = importDetail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public long getImpId() {
		return impId;
	}

	public void setImpId(long impId) {
		this.impId = impId;
	}

	public Date getImpDate() {
		return impDate;
	}

	public void setImpDate(Date impDate) {
		this.impDate = impDate;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
}
