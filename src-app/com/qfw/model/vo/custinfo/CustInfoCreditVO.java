package com.qfw.model.vo.custinfo;

import com.qfw.model.vo.custinfo.credit.CreditLoanHis;
import com.qfw.model.vo.custinfo.credit.CreditLoanNeeds;
import com.qfw.model.vo.custinfo.credit.Debts;
import com.qfw.model.vo.custinfo.credit.Others;
import com.qfw.model.vo.custinfo.credit.Overdues;
import com.qfw.model.vo.custinfo.credit.Personalinfo;
import com.qfw.model.vo.custinfo.credit.Reportinfo;

/**   
  * @Title  信用报告
  * @author ljn   
  * @date 2016-6-3 
  */
public class CustInfoCreditVO {
	
	public static final String report_risk="report_risk";//接受信用报告，json key
	
    //reportinfo
    private Reportinfo reportinfo;
	//personalinfo
    private Personalinfo personalinfo;
    //overdues 逾期记录
    private Overdues overdues;
    //debts //负债记录
    private Debts debts;
    //creditLoanHis 信贷历史
    private CreditLoanHis creditLoanHis;
    //creditLoanNeeds 信贷需求
    private CreditLoanNeeds creditLoanNeeds;
    //others //其他
    private Others others;
	public Reportinfo getReportinfo() {
		return reportinfo;
	}
	public void setReportinfo(Reportinfo reportinfo) {
		this.reportinfo = reportinfo;
	}
	public Personalinfo getPersonalinfo() {
		return personalinfo;
	}
	public void setPersonalinfo(Personalinfo personalinfo) {
		this.personalinfo = personalinfo;
	}
	public Overdues getOverdues() {
		return overdues;
	}
	public void setOverdues(Overdues overdues) {
		this.overdues = overdues;
	}
	public Debts getDebts() {
		return debts;
	}
	public void setDebts(Debts debts) {
		this.debts = debts;
	}
	public CreditLoanHis getCreditLoanHis() {
		return creditLoanHis;
	}
	public void setCreditLoanHis(CreditLoanHis creditLoanHis) {
		this.creditLoanHis = creditLoanHis;
	}
	public CreditLoanNeeds getCreditLoanNeeds() {
		return creditLoanNeeds;
	}
	public void setCreditLoanNeeds(CreditLoanNeeds creditLoanNeeds) {
		this.creditLoanNeeds = creditLoanNeeds;
	}
	public Others getOthers() {
		return others;
	}
	public void setOthers(Others others) {
		this.others = others;
	}

}