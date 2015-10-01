package com.kosign.wecafe.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.kosign.wecafe.enums.UserRoleType;

@Entity
@Table(name="USER_ROLES")
public class UserRole {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="ROLE", unique=true, nullable=false)
	private UserRoleType type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

	public UserRoleType getType() {
		return type;
	}

	public void setType(UserRoleType type) {
		this.type = type;
	}
	
	
}
