package com.qfw.model.vo.custinfo.credit;

import java.util.ArrayList;
import java.util.List;

/**   
  * @Title: 负债记录
  * @author ljn   
  * @date 2016-6-3 
  */
public class Debts {
	private Integer creditLimitMax;// 0, //'信用卡限额最大额额度'
    private Integer creditLimitTotal;// 0, //'信用卡限额总额度'
    
    private Integer creditOrgCounts;// 0, //'信用卡机构总数' - 排除销户和准贷记卡
    
    private Integer creditLimitUsed;// 0, //'已使用额度 + 逾期金额'
    private Integer creditLimitUseRate;// 0, //'信用卡额度使用率 creditLimitUsed/creditLimitTotal'

    private Integer loanAmts;// 0, //贷款总额（包括已结清和未结清）
    private Integer loanAmtsNoSettle;// 0, //未结清贷款总额
    private Integer loanCounts;// 0, //'贷款总笔数'
    
    private Integer loanBalances;// 0, //'贷款总余额'
    private Integer loanBalanceCounts;// 0, //'未结清贷款总笔数 '

    private Integer loanBalancesMortgage;// 0, //'房贷总余额'
    private Integer loanBalancesCar;// 0, //'车贷总余额'
    private Integer loanBalancesBiz;// 0, //'经营贷总余额'
    private Integer loanBalancesOther;// 0, //'其他贷总余额'

    private Integer loanBalancesMonth;// 0, //月还贷款总额
    private Integer loanBalancesMortgageMonth;// 0, //月还房贷金额
    private Integer loanBalancesCarMonth;// 0, //月还车贷
    private Integer loanBalancesBizMonth;//0, //月还经营贷
    private Integer loanBalancesOtherMonth;// 0, //月还其他贷总余额
    
    
    //loanBalanceInfos// [//贷款余额详列
    private List<LoanBalanceInfo> loanBalanceInfos=new ArrayList<LoanBalanceInfo>();

	public Integer getCreditLimitMax() {
		return creditLimitMax;
	}
	public void setCreditLimitMax(Integer creditLimitMax) {
		this.creditLimitMax = creditLimitMax;
	}
	public Integer getCreditLimitTotal() {
		return creditLimitTotal;
	}
	public void setCreditLimitTotal(Integer creditLimitTotal) {
		this.creditLimitTotal = creditLimitTotal;
	}
	public Integer getCreditOrgCounts() {
		return creditOrgCounts;
	}
	public void setCreditOrgCounts(Integer creditOrgCounts) {
		this.creditOrgCounts = creditOrgCounts;
	}
	public Integer getCreditLimitUsed() {
		return creditLimitUsed;
	}
	public void setCreditLimitUsed(Integer creditLimitUsed) {
		this.creditLimitUsed = creditLimitUsed;
	}
	public Integer getCreditLimitUseRate() {
		return creditLimitUseRate;
	}
	public void setCreditLimitUseRate(Integer creditLimitUseRate) {
		this.creditLimitUseRate = creditLimitUseRate;
	}
	public Integer getLoanAmts() {
		return loanAmts;
	}
	public void setLoanAmts(Integer loanAmts) {
		this.loanAmts = loanAmts;
	}
	public Integer getLoanAmtsNoSettle() {
		return loanAmtsNoSettle;
	}
	public void setLoanAmtsNoSettle(Integer loanAmtsNoSettle) {
		this.loanAmtsNoSettle = loanAmtsNoSettle;
	}
	public Integer getLoanCounts() {
		return loanCounts;
	}
	public void setLoanCounts(Integer loanCounts) {
		this.loanCounts = loanCounts;
	}
	public Integer getLoanBalances() {
		return loanBalances;
	}
	public void setLoanBalances(Integer loanBalances) {
		this.loanBalances = loanBalances;
	}
	public Integer getLoanBalanceCounts() {
		return loanBalanceCounts;
	}
	public void setLoanBalanceCounts(Integer loanBalanceCounts) {
		this.loanBalanceCounts = loanBalanceCounts;
	}
	public Integer getLoanBalancesMortgage() {
		return loanBalancesMortgage;
	}
	public void setLoanBalancesMortgage(Integer loanBalancesMortgage) {
		this.loanBalancesMortgage = loanBalancesMortgage;
	}
	public Integer getLoanBalancesCar() {
		return loanBalancesCar;
	}
	public void setLoanBalancesCar(Integer loanBalancesCar) {
		this.loanBalancesCar = loanBalancesCar;
	}
	public Integer getLoanBalancesBiz() {
		return loanBalancesBiz;
	}
	public void setLoanBalancesBiz(Integer loanBalancesBiz) {
		this.loanBalancesBiz = loanBalancesBiz;
	}
	public Integer getLoanBalancesOther() {
		return loanBalancesOther;
	}
	public void setLoanBalancesOther(Integer loanBalancesOther) {
		this.loanBalancesOther = loanBalancesOther;
	}
	public Integer getLoanBalancesMonth() {
		return loanBalancesMonth;
	}
	public void setLoanBalancesMonth(Integer loanBalancesMonth) {
		this.loanBalancesMonth = loanBalancesMonth;
	}
	public Integer getLoanBalancesMortgageMonth() {
		return loanBalancesMortgageMonth;
	}
	public void setLoanBalancesMortgageMonth(Integer loanBalancesMortgageMonth) {
		this.loanBalancesMortgageMonth = loanBalancesMortgageMonth;
	}
	public Integer getLoanBalancesCarMonth() {
		return loanBalancesCarMonth;
	}
	public void setLoanBalancesCarMonth(Integer loanBalancesCarMonth) {
		this.loanBalancesCarMonth = loanBalancesCarMonth;
	}
	public Integer getLoanBalancesBizMonth() {
		return loanBalancesBizMonth;
	}
	public void setLoanBalancesBizMonth(Integer loanBalancesBizMonth) {
		this.loanBalancesBizMonth = loanBalancesBizMonth;
	}
	public Integer getLoanBalancesOtherMonth() {
		return loanBalancesOtherMonth;
	}
	public void setLoanBalancesOtherMonth(Integer loanBalancesOtherMonth) {
		this.loanBalancesOtherMonth = loanBalancesOtherMonth;
	}
	public List<LoanBalanceInfo> getLoanBalanceInfos() {
		return loanBalanceInfos;
	}
	public void setLoanBalanceInfos(List<LoanBalanceInfo> loanBalanceInfos) {
		this.loanBalanceInfos = loanBalanceInfos;
	}

}
