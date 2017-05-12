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
@Table(name = "biz_enterprise")
public class BizEnterpriseBO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4194415357554050616L;
	
	private Integer id;
	
	private Integer userId;
	
	private Integer custId;
	
	private String enterpriseName;
	
	private String organizationCode;
	
	private String licenseNo;
	
	private String organizationCreditCode;
	
	private String type;
	
	private String industryType;
	
	private Date establishDate;
	
	private String businessScope;
	
	private String externalGuaranty;
	
	private String creditRate;
	
	private String debt;
	
	private BigDecimal creditLimit;
	
	private String registerProvinceCd;
	private String registerCityCd;
	private String registerNationalityCd;
	private String registerStreetAddress;
	
	private String countyCd;
	private String provinceCd;
	private String cityCd;
	private String nationalityCd;
	private String streetAddress;
	
	private Integer sysCreateUser;
	private Date sysCreateTime;
	private Integer sysUpdateUser;
	private Date sysUpdateTime;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "USER_ID")
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@Column(name = "enterprise_name")
	public String getEnterpriseName() {
		return enterpriseName;
	}
	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	@Column(name = "organization_code")
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	@Column(name = "license_no")
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	@Column(name = "organization_credit_code")
	public String getOrganizationCreditCode() {
		return organizationCreditCode;
	}
	public void setOrganizationCreditCode(String organizationCreditCode) {
		this.organizationCreditCode = organizationCreditCode;
	}
	@Column(name = "type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "industry_type")
	public String getIndustryType() {
		return industryType;
	}
	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}
	@Column(name = "establish_date")
	public Date getEstablishDate() {
		return establishDate;
	}
	
	public void setEstablishDate(Date establishDate) {
		this.establishDate = establishDate;
	}
	@Column(name = "business_scope")
	public String getBusinessScope() {
		return businessScope;
	}
	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}
	@Column(name = "external_guaranty")
	public String getExternalGuaranty() {
		return externalGuaranty;
	}
	public void setExternalGuaranty(String externalGuaranty) {
		this.externalGuaranty = externalGuaranty;
	}
	@Column(name = "credit_rate")
	public String getCreditRate() {
		return creditRate;
	}
	public void setCreditRate(String creditRate) {
		this.creditRate = creditRate;
	}
	@Column(name = "credit_limit")
	public BigDecimal getCreditLimit() {
		return creditLimit;
	}
	public void setCreditLimit(BigDecimal creditLimit) {
		this.creditLimit = creditLimit;
	}
	@Column(name = "SYS_CREATE_USER")
	public Integer getSysCreateUser() {
		return sysCreateUser;
	}
	public void setSysCreateUser(Integer sysCreateUser) {
		this.sysCreateUser = sysCreateUser;
	}
	@Column(name = "SYS_CREATE_TIME")
	public Date getSysCreateTime() {
		return sysCreateTime;
	}
	public void setSysCreateTime(Date sysCreateTime) {
		this.sysCreateTime = sysCreateTime;
	}
	@Column(name = "SYS_UPDATE_USER")
	public Integer getSysUpdateUser() {
		return sysUpdateUser;
	}
	public void setSysUpdateUser(Integer sysUpdateUser) {
		this.sysUpdateUser = sysUpdateUser;
	}
	@Column(name = "SYS_UPDATE_TIME")
	public Date getSysUpdateTime() {
		return sysUpdateTime;
	}
	public void setSysUpdateTime(Date sysUpdateTime) {
		this.sysUpdateTime = sysUpdateTime;
	}
	@Column(name = "county_cd")
	public String getCountyCd() {
		return countyCd;
	}
	public void setCountyCd(String countyCd) {
		this.countyCd = countyCd;
	}
	@Column(name = "province_cd")
	public String getProvinceCd() {
		return provinceCd;
	}
	public void setProvinceCd(String provinceCd) {
		this.provinceCd = provinceCd;
	}
	@Column(name = "city_cd")
	public String getCityCd() {
		return cityCd;
	}
	public void setCityCd(String cityCd) {
		this.cityCd = cityCd;
	}
	@Column(name = "nationality_cd")
	public String getNationalityCd() {
		return nationalityCd;
	}
	public void setNationalityCd(String nationalityCd) {
		this.nationalityCd = nationalityCd;
	}
	@Column(name = "street_address")
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	@Column(name = "register_province_cd")
	public String getRegisterProvinceCd() {
		return registerProvinceCd;
	}
	public void setRegisterProvinceCd(String registerProvinceCd) {
		this.registerProvinceCd = registerProvinceCd;
	}
	@Column(name = "register_city_cd")
	public String getRegisterCityCd() {
		return registerCityCd;
	}
	public void setRegisterCityCd(String registerCityCd) {
		this.registerCityCd = registerCityCd;
	}
	@Column(name = "register_nationality_cd")
	public String getRegisterNationalityCd() {
		return registerNationalityCd;
	}
	public void setRegisterNationalityCd(String registerNationalityCd) {
		this.registerNationalityCd = registerNationalityCd;
	}
	@Column(name = "register_street_address")
	public String getRegisterStreetAddress() {
		return registerStreetAddress;
	}
	public void setRegisterStreetAddress(String registerStreetAddress) {
		this.registerStreetAddress = registerStreetAddress;
	}
	@Column(name = "debt")
	public String getDebt() {
		return debt;
	}
	public void setDebt(String debt) {
		this.debt = debt;
	}
	@Column(name = "cust_id")
	public Integer getCustId() {
		return custId;
	}
	public void setCustId(Integer custId) {
		this.custId = custId;
	}


}