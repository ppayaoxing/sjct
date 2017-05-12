package com.qfw.model.bo;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;


@Entity
@Table(name = "biz_enterprise_legal")
public class BizEnterpriseLegalBO implements java.io.Serializable {

	private static final long serialVersionUID = -5373067012223958688L;
	private Integer id;
	private Integer userId;
	private Integer custId;
	private Integer enterpriseId;
	private String name;
	private String idCard;
	private String sex;
	private String educationCd;
	private String maritalStatusCd;
	private String hasChildrenCd;
	private String countyCd;
	private String provinceCd;
	private String cityCd;
	private String nationalityCd;
	private String streetAddress;
	
	private String liveCountyCd;
	private String liveProvinceCd;
	private String liveCityCd;
	private String liveNationalityCd;
	private String liveStreetAddress;
	private String zipNum;
	private String telephone;
	private String mobileTelephone;
	private String fax;
	private String qq;
	private String website;
	private String email;
	private Integer sysCreateUser;
	private Date sysCreateTime;
	private Integer sysUpdateUser;
	private Date sysUpdateTime;
	private Date birthDate;//生日

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "USER_ID")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	@Column(name = "MARITAL_STATUS_CD", length = 2)
	public String getMaritalStatusCd() {
		return this.maritalStatusCd;
	}

	public void setMaritalStatusCd(String maritalStatusCd) {
		this.maritalStatusCd = maritalStatusCd;
	}

	@Column(name = "HAS_CHILDREN_CD", length = 2)
	public String getHasChildrenCd() {
		return this.hasChildrenCd;
	}

	public void setHasChildrenCd(String hasChildrenCd) {
		this.hasChildrenCd = hasChildrenCd;
	}

	@Column(name = "COUNTY_CD", length = 10)
	public String getCountyCd() {
		return this.countyCd;
	}

	public void setCountyCd(String countyCd) {
		this.countyCd = countyCd;
	}

	@Column(name = "PROVINCE_CD", length = 10)
	public String getProvinceCd() {
		return this.provinceCd;
	}

	public void setProvinceCd(String provinceCd) {
		this.provinceCd = provinceCd;
	}

	@Column(name = "CITY_CD", length = 10)
	public String getCityCd() {
		return this.cityCd;
	}

	public void setCityCd(String cityCd) {
		this.cityCd = cityCd;
	}

	@Column(name = "NATIONALITY_CD", length = 10)
	public String getNationalityCd() {
		return this.nationalityCd;
	}

	public void setNationalityCd(String nationalityCd) {
		this.nationalityCd = nationalityCd;
	}

	@Column(name = "STREET_ADDRESS", length = 200)
	public String getStreetAddress() {
		return this.streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	@Column(name = "LIVE_COUNTY_CD", length = 10)
	public String getLiveCountyCd() {
		return liveCountyCd;
	}

	public void setLiveCountyCd(String liveCountyCd) {
		this.liveCountyCd = liveCountyCd;
	}
	@Column(name = "LIVE_PROVINCE_CD", length = 10)
	public String getLiveProvinceCd() {
		return liveProvinceCd;
	}

	public void setLiveProvinceCd(String liveProvinceCd) {
		this.liveProvinceCd = liveProvinceCd;
	}

	@Column(name = "LIVE_CITY_CD", length = 10)
	public String getLiveCityCd() {
		return liveCityCd;
	}

	public void setLiveCityCd(String liveCityCd) {
		this.liveCityCd = liveCityCd;
	}

	@Column(name = "LIVE_NATIONALITY_CD", length = 10)
	public String getLiveNationalityCd() {
		return liveNationalityCd;
	}

	public void setLiveNationalityCd(String liveNationalityCd) {
		this.liveNationalityCd = liveNationalityCd;
	}
	
	@Column(name = "LIVE_STREET_ADDRESS", length = 200)
	public String getLiveStreetAddress() {
		return liveStreetAddress;
	}

	public void setLiveStreetAddress(String liveStreetAddress) {
		this.liveStreetAddress = liveStreetAddress;
	}

	@Column(name = "ZIP_NUM", length = 6)
	public String getZipNum() {
		return this.zipNum;
	}

	public void setZipNum(String zipNum) {
		this.zipNum = zipNum;
	}

	@Column(name = "TELEPHONE", length = 20)
	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "MOBILE_TELEPHONE", length = 20)
	public String getMobileTelephone() {
		return this.mobileTelephone;
	}

	public void setMobileTelephone(String mobileTelephone) {
		this.mobileTelephone = mobileTelephone;
	}

	@Column(name = "FAX", length = 20)
	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Column(name = "QQ", length = 20)
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "WEBSITE", length = 200)
	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	@Column(name = "SYS_CREATE_USER")
	public Integer getSysCreateUser() {
		return this.sysCreateUser;
	}

	public void setSysCreateUser(Integer sysCreateUser) {
		this.sysCreateUser = sysCreateUser;
	}

	@Column(name = "SYS_CREATE_TIME")
	public Date getSysCreateTime() {
		return this.sysCreateTime;
	}

	public void setSysCreateTime(Date sysCreateTime) {
		this.sysCreateTime = sysCreateTime;
	}

	@Column(name = "SYS_UPDATE_USER")
	public Integer getSysUpdateUser() {
		return this.sysUpdateUser;
	}

	public void setSysUpdateUser(Integer sysUpdateUser) {
		this.sysUpdateUser = sysUpdateUser;
	}

	@Column(name = "SYS_UPDATE_TIME")
	public Date getSysUpdateTime() {
		return this.sysUpdateTime;
	}

	public void setSysUpdateTime(Date sysUpdateTime) {
		this.sysUpdateTime = sysUpdateTime;
	}
	@Column(name = "SEX", length = 2)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name = "EDUCATION_CD")
	public String getEducationCd() {
		return educationCd;
	}

	public void setEducationCd(String educationCd) {
		this.educationCd = educationCd;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "BIRTH_DATE", length = 10)
	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	@Column(name = "enterprise_id")
	public Integer getEnterpriseId() {
		return enterpriseId;
	}

	public void setEnterpriseId(Integer enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "id_card")
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	@Column(name = "cust_id")
	public Integer getCustId() {
		return custId;
	}
	public void setCustId(Integer custId) {
		this.custId = custId;
	}

}