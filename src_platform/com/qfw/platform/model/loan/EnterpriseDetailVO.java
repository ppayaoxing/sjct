package com.qfw.platform.model.loan;

import java.io.Serializable;

/**
 * 企业信息
 *
 */
public class EnterpriseDetailVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String type;
	
//	private Date establishDate;
	private Integer duration;
	
	private String registerAddress;
	
	private String businessScope;
	
	private String debt;
	
	private String externalGuaranty;
	
	private String creditRate;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public String getRegisterAddress() {
		return registerAddress;
	}

	public void setRegisterAddress(String registerAddress) {
		this.registerAddress = registerAddress;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public String getDebt() {
		return debt;
	}

	public void setDebt(String debt) {
		this.debt = debt;
	}

	public String getExternalGuaranty() {
		return externalGuaranty;
	}

	public void setExternalGuaranty(String externalGuaranty) {
		this.externalGuaranty = externalGuaranty;
	}

	public String getCreditRate() {
		return creditRate;
	}

	public void setCreditRate(String creditRate) {
		this.creditRate = creditRate;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	

}