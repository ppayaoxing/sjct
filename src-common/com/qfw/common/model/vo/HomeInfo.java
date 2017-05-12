package com.qfw.common.model.vo;


/**
 */
public class HomeInfo  {

	private static final long serialVersionUID = 1L;
	
	private String custCount;
	private String transactionAmount;
	private String loanAmount;
	private String loanSettle;
	private String loanOverdue;
	private String creditorRight;
	private String overdueRateStr;
	private String loanTime;
	
	private String tradeTime;
	public String getCustCount() {
		return custCount;
	}
	public void setCustCount(String custCount) {
		this.custCount = custCount;
	}
	public String getTransactionAmount() {
		return transactionAmount;
	}
	public void setTransactionAmount(String transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	public String getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}
	public String getLoanSettle() {
		return loanSettle;
	}
	public void setLoanSettle(String loanSettle) {
		this.loanSettle = loanSettle;
	}
	public String getLoanOverdue() {
		return loanOverdue;
	}
	public void setLoanOverdue(String loanOverdue) {
		this.loanOverdue = loanOverdue;
	}
	public String getCreditorRight() {
		return creditorRight;
	}
	public void setCreditorRight(String creditorRight) {
		this.creditorRight = creditorRight;
	}
	public String getOverdueRateStr() {
		return overdueRateStr;
	}
	public void setOverdueRateStr(String overdueRateStr) {
		this.overdueRateStr = overdueRateStr;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getTradeTime() {
		return tradeTime;
	}
	public void setTradeTime(String tradeTime) {
		this.tradeTime = tradeTime;
	}
	public String getLoanTime() {
		return loanTime;
	}
	public void setLoanTime(String loanTime) {
		this.loanTime = loanTime;
	}
}