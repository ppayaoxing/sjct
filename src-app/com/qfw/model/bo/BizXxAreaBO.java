package com.qfw.model.bo;

import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "xx_area")
public class BizXxAreaBO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	
	private Integer order;
	
	private String fullName;
	
	private String name;
	
	private String treePath;
	
	private Integer parent;
	
	private String code;
	
	private String zipCode;
	
	private String telCode;
	
	private Integer status;
	
	private BigDecimal locationX;
	
	private BigDecimal locationY;
	
	private Date createDate;
	
	private Date modifyDate;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "orders")
	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}
	@Column(name = "full_name")
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "tree_path")
	public String getTreePath() {
		return treePath;
	}
	
	public void setTreePath(String treePath) {
		this.treePath = treePath;
	}
	@Column(name = "parent")
	public Integer getParent() {
		return parent;
	}
	
	public void setParent(Integer parent) {
		this.parent = parent;
	}
	@Column(name = "code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	@Column(name = "zip_code")
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	@Column(name = "tel_code")
	public String getTelCode() {
		return telCode;
	}

	public void setTelCode(String telCode) {
		this.telCode = telCode;
	}
	@Column(name = "status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name = "location_x")
	public BigDecimal getLocationX() {
		return locationX;
	}

	public void setLocationX(BigDecimal locationX) {
		this.locationX = locationX;
	}
	@Column(name = "location_y")
	public BigDecimal getLocationY() {
		return locationY;
	}

	public void setLocationY(BigDecimal locationY) {
		this.locationY = locationY;
	}
	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Column(name = "modify_date")
	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

}