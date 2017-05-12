package com.qfw.platform.model.loan;

import java.io.Serializable;

/**
 * 个人信息
 * @author Think
 *
 */
public class CustomerDetailVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer age;// 年龄
	private String sex;// 性别
	private String educationCd;// 学历
	private String maritalStatusCd;// 婚姻状况
	private String jobCompanyName;// 单位名称
	private String jobDeptName;// 所在部门
	private String companyIndustryCd;// 公司行业
	private String companyTypeCd;// 公司性质
	private String jobPosition;// 职位
	private Integer jobYearCd;// 在现单位工作年限
	private String jobIncomeCd;// 月收入
	
	private String provinceCd;
	private String cityCd;
	private String nationalityCd;
	
	private String addressName;
	
	private String hasHouse;
	private String hasCar;
	
	private String creditRate;
	
	private String custTypeCd;

	public String getCompanyTypeCd() {
		return companyTypeCd;
	}

	public void setCompanyTypeCd(String companyTypeCd) {
		this.companyTypeCd = companyTypeCd;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEducationCd() {
		return educationCd;
	}

	public void setEducationCd(String educationCd) {
		this.educationCd = educationCd;
	}

	public String getMaritalStatusCd() {
		return maritalStatusCd;
	}

	public void setMaritalStatusCd(String maritalStatusCd) {
		this.maritalStatusCd = maritalStatusCd;
	}

	public String getJobCompanyName() {
		return jobCompanyName;
	}

	public void setJobCompanyName(String jobCompanyName) {
		this.jobCompanyName = jobCompanyName;
	}

	public String getJobDeptName() {
		return jobDeptName;
	}

	public void setJobDeptName(String jobDeptName) {
		this.jobDeptName = jobDeptName;
	}

	public String getCompanyIndustryCd() {
		return companyIndustryCd;
	}

	public void setCompanyIndustryCd(String companyIndustryCd) {
		this.companyIndustryCd = companyIndustryCd;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public Integer getJobYearCd() {
		return jobYearCd;
	}

	public void setJobYearCd(Integer jobYearCd) {
		this.jobYearCd = jobYearCd;
	}

	public String getJobIncomeCd() {
		return jobIncomeCd;
	}

	public void setJobIncomeCd(String jobIncomeCd) {
		this.jobIncomeCd = jobIncomeCd;
	}

	public String getProvinceCd() {
		return provinceCd;
	}

	public void setProvinceCd(String provinceCd) {
		this.provinceCd = provinceCd;
	}

	public String getCityCd() {
		return cityCd;
	}

	public void setCityCd(String cityCd) {
		this.cityCd = cityCd;
	}

	public String getNationalityCd() {
		return nationalityCd;
	}

	public void setNationalityCd(String nationalityCd) {
		this.nationalityCd = nationalityCd;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getHasHouse() {
		return hasHouse;
	}

	public void setHasHouse(String hasHouse) {
		this.hasHouse = hasHouse;
	}

	public String getHasCar() {
		return hasCar;
	}

	public void setHasCar(String hasCar) {
		this.hasCar = hasCar;
	}

	public String getCreditRate() {
		return creditRate;
	}

	public void setCreditRate(String creditRate) {
		this.creditRate = creditRate;
	}

	public String getCustTypeCd() {
		return custTypeCd;
	}

	public void setCustTypeCd(String custTypeCd) {
		this.custTypeCd = custTypeCd;
	}

}