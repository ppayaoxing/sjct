package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title: 逾期记录
  * @author ljn   
  * @date 2016-6-3 
  */
public class Overdues {
	private Integer creditOrgCounts;//0,逾期信用卡机构数
    private Integer creditOrgCounts200;// 0,//逾期金额大于200的信用卡机构数
    private Integer creditAmts;// 0,//总信用卡逾期金额
    private Integer  creditAmts200;// 0,//大于200元的信用卡逾期总金额
    private Integer creditCountsM60;// 0,//信用卡60个月内逾期次数
    private Integer creditCountsM60D90;// 0,//信用卡60个月内逾期超过90天的次数
    
    private Integer loanCounts;// 0,//贷款总笔数
    private Integer loanAmts;// 0,//贷款总金额
    private Integer loanCountsM60;// 0,//贷款60个月内逾期次数
    private Integer loanCountsM60D90;// 0,//贷款60个月内逾期超过90天的次数
    
    private Integer countsM60;// 0,//60个月内逾期记录总数
    private Integer countsM60D90;// 0//60个月内超过90天逾期总数
	public Integer getCreditOrgCounts() {
		return creditOrgCounts;
	}
	public void setCreditOrgCounts(Integer creditOrgCounts) {
		this.creditOrgCounts = creditOrgCounts;
	}
	public Integer getCreditOrgCounts200() {
		return creditOrgCounts200;
	}
	public void setCreditOrgCounts200(Integer creditOrgCounts200) {
		this.creditOrgCounts200 = creditOrgCounts200;
	}
	public Integer getCreditAmts() {
		return creditAmts;
	}
	public void setCreditAmts(Integer creditAmts) {
		this.creditAmts = creditAmts;
	}
	public Integer getCreditAmts200() {
		return creditAmts200;
	}
	public void setCreditAmts200(Integer creditAmts200) {
		this.creditAmts200 = creditAmts200;
	}
	public Integer getCreditCountsM60() {
		return creditCountsM60;
	}
	public void setCreditCountsM60(Integer creditCountsM60) {
		this.creditCountsM60 = creditCountsM60;
	}
	public Integer getCreditCountsM60D90() {
		return creditCountsM60D90;
	}
	public void setCreditCountsM60D90(Integer creditCountsM60D90) {
		this.creditCountsM60D90 = creditCountsM60D90;
	}
	public Integer getLoanCounts() {
		return loanCounts;
	}
	public void setLoanCounts(Integer loanCounts) {
		this.loanCounts = loanCounts;
	}
	public Integer getLoanAmts() {
		return loanAmts;
	}
	public void setLoanAmts(Integer loanAmts) {
		this.loanAmts = loanAmts;
	}
	public Integer getLoanCountsM60() {
		return loanCountsM60;
	}
	public void setLoanCountsM60(Integer loanCountsM60) {
		this.loanCountsM60 = loanCountsM60;
	}
	public Integer getLoanCountsM60D90() {
		return loanCountsM60D90;
	}
	public void setLoanCountsM60D90(Integer loanCountsM60D90) {
		this.loanCountsM60D90 = loanCountsM60D90;
	}
	public Integer getCountsM60() {
		return countsM60;
	}
	public void setCountsM60(Integer countsM60) {
		this.countsM60 = countsM60;
	}
	public Integer getCountsM60D90() {
		return countsM60D90;
	}
	public void setCountsM60D90(Integer countsM60D90) {
		this.countsM60D90 = countsM60D90;
	}
    
}
