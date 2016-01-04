package com.kosign.wecafe.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="request_stock")
public class RequestStock implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize=1, initialValue=1, sequenceName="req_id_seq", name="req_id")
	@GeneratedValue(generator="req_id", strategy=GenerationType.SEQUENCE)
	
	@Column(name="req_id", nullable=false)
	private Long reqID;
	
	@Column(name="req_by",nullable=true)
	private Long reqBy;
	
	@Column(name="app_by",nullable=true)
	private Long appBy;
	
/*	@OneToMany(fetch = FetchType.LAZY,  mappedBy = "pk1.product", cascade=CascadeType.ALL)
	private Set<RequestStockDetail> requestStockDetail = new HashSet<RequestStockDetail>();*/
	
/*	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="id")
	private User requestBy;*/

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="req_date",nullable=true)
	private Date requestDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="app_date",nullable=true)
	private Date approveDate;
	
}
