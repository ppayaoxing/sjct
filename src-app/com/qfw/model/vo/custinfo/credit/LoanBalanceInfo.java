package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title: 贷款余额详列 
  * @author ljn   
  * @date 2016-6-3 
  */
public class LoanBalanceInfo {
	private String org ;//'放贷机构'
    private String type;//''
    private String amts;//'放贷总额'
    private String balances;//'放贷余额'
    private String debtMonths;//'未偿月数'
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAmts() {
		return amts;
	}
	public void setAmts(String amts) {
		this.amts = amts;
	}
	public String getBalances() {
		return balances;
	}
	public void setBalances(String balances) {
		this.balances = balances;
	}
	public String getDebtMonths() {
		return debtMonths;
	}
	public void setDebtMonths(String debtMonths) {
		this.debtMonths = debtMonths;
	}
    
}
