package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title: 信贷历史 
  * @author ljn   
  * @date 2016-6-3 
  */
public class CreditLoanHis {
	 private Integer creditMOB;// 0,//信用卡最大账龄（单位 月）
	 private Integer loanMOB;// 0//贷款最大账龄（单位 月）
	public Integer getCreditMOB() {
		return creditMOB;
	}
	public void setCreditMOB(Integer creditMOB) {
		this.creditMOB = creditMOB;
	}
	public Integer getLoanMOB() {
		return loanMOB;
	}
	public void setLoanMOB(Integer loanMOB) {
		this.loanMOB = loanMOB;
	}
	 
}
