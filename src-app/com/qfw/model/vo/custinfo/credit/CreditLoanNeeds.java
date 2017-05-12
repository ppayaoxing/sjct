package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title: 信贷需求 
  * @author ljn   
  * @date 2016-6-3 
  */
public class CreditLoanNeeds {
	private Integer creditOrgCountsM3;// 0, //近3个月信用卡发卡机构数
    private Integer creditLimitTotalM3;// 0, //近3个月信用卡额度总额
    private Integer loanCountsM3;// 0, //近3个月贷款笔数',
    private Integer loanAmtsM3;// 0, //近3个月贷款金额数',
    private Integer loanQueriesM3;// 0, //'近3月贷款审核查询次数',
    private Integer selfQueriesM3;// 0 //'近3月本人查询次数'
	public Integer getCreditOrgCountsM3() {
		return creditOrgCountsM3;
	}
	public void setCreditOrgCountsM3(Integer creditOrgCountsM3) {
		this.creditOrgCountsM3 = creditOrgCountsM3;
	}
	public Integer getCreditLimitTotalM3() {
		return creditLimitTotalM3;
	}
	public void setCreditLimitTotalM3(Integer creditLimitTotalM3) {
		this.creditLimitTotalM3 = creditLimitTotalM3;
	}
	public Integer getLoanCountsM3() {
		return loanCountsM3;
	}
	public void setLoanCountsM3(Integer loanCountsM3) {
		this.loanCountsM3 = loanCountsM3;
	}
	public Integer getLoanAmtsM3() {
		return loanAmtsM3;
	}
	public void setLoanAmtsM3(Integer loanAmtsM3) {
		this.loanAmtsM3 = loanAmtsM3;
	}
	public Integer getLoanQueriesM3() {
		return loanQueriesM3;
	}
	public void setLoanQueriesM3(Integer loanQueriesM3) {
		this.loanQueriesM3 = loanQueriesM3;
	}
	public Integer getSelfQueriesM3() {
		return selfQueriesM3;
	}
	public void setSelfQueriesM3(Integer selfQueriesM3) {
		this.selfQueriesM3 = selfQueriesM3;
	}
    
}
