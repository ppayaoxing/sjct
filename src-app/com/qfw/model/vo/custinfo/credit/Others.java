package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title: 其他
  * @author ljn   
  * @date 2016-6-3 
  */
public class Others {
	private Integer guarantees;// 0, //'担保笔数',
    private Integer guaranteeAmts;// 0, //'担保金额',
    private Integer month6TaxAmts;// 0 //'6月内欠税总金额'
	public Integer getGuarantees() {
		return guarantees;
	}
	public void setGuarantees(Integer guarantees) {
		this.guarantees = guarantees;
	}
	public Integer getGuaranteeAmts() {
		return guaranteeAmts;
	}
	public void setGuaranteeAmts(Integer guaranteeAmts) {
		this.guaranteeAmts = guaranteeAmts;
	}
	public Integer getMonth6TaxAmts() {
		return month6TaxAmts;
	}
	public void setMonth6TaxAmts(Integer month6TaxAmts) {
		this.month6TaxAmts = month6TaxAmts;
	}
    
}
