package com.qfw.model.vo.custinfo.credit;
/**   
  * @Title:  Personalinfo
  * @author ljn   
  * @date 2016-6-3 
  */
public class Personalinfo {
	private String IDnumber;// 证件号
    private String IDtype;// 证件类型
    private String name;//姓名
    private String marital;// 婚姻状态
	public String getIDnumber() {
		return IDnumber;
	}
	public void setIDnumber(String iDnumber) {
		IDnumber = iDnumber;
	}
	public String getIDtype() {
		return IDtype;
	}
	public void setIDtype(String iDtype) {
		IDtype = iDtype;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMarital() {
		return marital;
	}
	public void setMarital(String marital) {
		this.marital = marital;
	}
    
}
