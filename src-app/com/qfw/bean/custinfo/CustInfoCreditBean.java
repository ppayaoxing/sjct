package com.qfw.bean.custinfo;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import org.apache.log4j.Logger;
import com.qfw.bizservice.custinfo.ICustInfoBS;
import com.qfw.common.log.LogFactory;
import com.qfw.common.util.web.BaseBackingBean;
import com.qfw.common.util.web.ViewOper;
import com.qfw.model.vo.custinfo.CustInfoCreditVO;

/**   
  * @Title: 信用报告
  * @author ljn   
  * @date 2016-6-3 
  */
@ViewScoped
@ManagedBean(name = "custInfoCreditBean")
public class CustInfoCreditBean extends BaseBackingBean {

	private static final long serialVersionUID = 1L;
	//信用报告 vo
	private CustInfoCreditVO credit;
	
	private String operateFlag;
	
	@ManagedProperty(value = "#{custInfoBS}")
	private ICustInfoBS custInfoBS;
	
	private Logger log = LogFactory.getInstance().getBusinessLogger();
	
	@PostConstruct
	public void init() {
		operateFlag = ViewOper.getRequestParameter("operateFlag");
		Object custNameSession = ViewOper.getSessionTmpAttr("custNameSession");
		Object certificateNumSession = ViewOper.getSessionTmpAttr("certificateNumSession");
		try {
			credit = custInfoBS.queryCredit(String.valueOf(custNameSession),String.valueOf(certificateNumSession));
		} catch (Exception e) {
			log.warn("信用报告获取异常",e);
			this.alert("信用报告获取异常");
		}
		
	}

	public CustInfoCreditVO getCredit() {
		return credit;
	}

	public void setCredit(CustInfoCreditVO credit) {
		this.credit = credit;
	}

	public String getOperateFlag() {
		return operateFlag;
	}

	public void setOperateFlag(String operateFlag) {
		this.operateFlag = operateFlag;
	}

	public ICustInfoBS getCustInfoBS() {
		return custInfoBS;
	}

	public void setCustInfoBS(ICustInfoBS custInfoBS) {
		this.custInfoBS = custInfoBS;
	}

	public Logger getLog() {
		return log;
	}

	public void setLog(Logger log) {
		this.log = log;
	}
}
