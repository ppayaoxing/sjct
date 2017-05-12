package com.qfw.model.vo.credit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qfw.model.bo.BizAuthBO;
import com.qfw.model.bo.BizCollateralInfoBO;
import com.qfw.model.bo.BizContactsBO;
import com.qfw.model.bo.BizCreditLimitApplyBO;
import com.qfw.model.bo.BizCustomerBO;
import com.qfw.model.bo.BizDisclosureInfoBO;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.bo.BizEnterpriseLegalBO;
import com.qfw.model.bo.BizGuarantorInfoBO;
import com.qfw.model.bo.BizJobBO;

/**
 * 额度申请VO
 */

public class BizCreditLimitApplyVO  {
	
	private String comment; //审批意见
	private String applyStatusCd; //额度申请状态
	private String workItemId;
	
	private BizCreditLimitApplyBO creditLimitApply = new BizCreditLimitApplyBO();//额度bo
	private BizCustomerBO cust = new BizCustomerBO();//客户BO
	private BizJobBO job = new BizJobBO();//工作信息BO
	private List<BizCollateralInfoBO> collateralInfos = new ArrayList<BizCollateralInfoBO>();//担保品信息列表
	private List<BizGuarantorInfoBO> guarantorInfos = new ArrayList<BizGuarantorInfoBO>();//保证人信息列表
	private List<BizContactsBO> contacts = new ArrayList<BizContactsBO>();//联系人信息列表

	private List<BizCollateralInfoBO> removeCollateralInfos = new ArrayList<BizCollateralInfoBO>();//删除持久化担保品信息列表
	private List<BizGuarantorInfoBO> removeGuarantorInfos = new ArrayList<BizGuarantorInfoBO>();//删除持久化保证人信息列表
	private List<BizContactsBO> removeContacts = new ArrayList<BizContactsBO>();//删除持久化联系人信息列表
	
	private BizCollateralInfoBO collateralInfo = new BizCollateralInfoBO();//担保品信息
	private BizGuarantorInfoBO guarantorInfo = new BizGuarantorInfoBO();//保证人信息
	private BizContactsBO contact = new BizContactsBO();//联系人信息
	private Map<String,BizAuthBO> authMap = new HashMap<String, BizAuthBO>();//认证信息
	
	private BizDisclosureInfoBO disclosureInfo = new BizDisclosureInfoBO();//信息批露
	private List<BizDisclosureInfoBO> disclosureList = new ArrayList<BizDisclosureInfoBO>();//信息批露
	
	private BizEnterpriseBO enterprise = new BizEnterpriseBO();
	
	private BizEnterpriseLegalBO enterpriseLegal = new BizEnterpriseLegalBO();
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	

	public BizCreditLimitApplyBO getCreditLimitApply() {
		return creditLimitApply;
	}

	public void setCreditLimitApply(BizCreditLimitApplyBO creditLimitApply) {
		this.creditLimitApply = creditLimitApply;
	}

	public String getApplyStatusCd() {
		return applyStatusCd;
	}

	public void setApplyStatusCd(String applyStatusCd) {
		this.applyStatusCd = applyStatusCd;
	}

	public String getWorkItemId() {
		return workItemId;
	}

	public void setWorkItemId(String workItemId) {
		this.workItemId = workItemId;
	}

	public BizCustomerBO getCust() {
		return cust;
	}

	public void setCust(BizCustomerBO cust) {
		this.cust = cust;
	}

	public BizJobBO getJob() {
		return job;
	}

	public void setJob(BizJobBO job) {
		this.job = job;
	}

	public List<BizCollateralInfoBO> getCollateralInfos() {
		return collateralInfos;
	}

	public void setCollateralInfos(List<BizCollateralInfoBO> collateralInfos) {
		this.collateralInfos = collateralInfos;
	}

	public List<BizGuarantorInfoBO> getGuarantorInfos() {
		return guarantorInfos;
	}

	public void setGuarantorInfos(List<BizGuarantorInfoBO> guarantorInfos) {
		this.guarantorInfos = guarantorInfos;
	}

	public BizCollateralInfoBO getCollateralInfo() {
		return collateralInfo;
	}

	public void setCollateralInfo(BizCollateralInfoBO collateralInfo) {
		this.collateralInfo = collateralInfo;
	}

	public BizGuarantorInfoBO getGuarantorInfo() {
		return guarantorInfo;
	}

	public void setGuarantorInfo(BizGuarantorInfoBO guarantorInfo) {
		this.guarantorInfo = guarantorInfo;
	}

	public Map<String, BizAuthBO> getAuthMap() {
		return authMap;
	}

	public void setAuthMap(Map<String, BizAuthBO> authMap) {
		this.authMap = authMap;
	}

	public List<BizContactsBO> getContacts() {
		return contacts;
	}

	public void setContacts(List<BizContactsBO> contacts) {
		this.contacts = contacts;
	}

	public BizContactsBO getContact() {
		return contact;
	}

	public void setContact(BizContactsBO contact) {
		this.contact = contact;
	}

	public List<BizCollateralInfoBO> getRemoveCollateralInfos() {
		return removeCollateralInfos;
	}

	public void setRemoveCollateralInfos(
			List<BizCollateralInfoBO> removeCollateralInfos) {
		this.removeCollateralInfos = removeCollateralInfos;
	}

	public List<BizGuarantorInfoBO> getRemoveGuarantorInfos() {
		return removeGuarantorInfos;
	}

	public void setRemoveGuarantorInfos(
			List<BizGuarantorInfoBO> removeGuarantorInfos) {
		this.removeGuarantorInfos = removeGuarantorInfos;
	}

	public List<BizContactsBO> getRemoveContacts() {
		return removeContacts;
	}

	public void setRemoveContacts(List<BizContactsBO> removeContacts) {
		this.removeContacts = removeContacts;
	}

	public BizDisclosureInfoBO getDisclosureInfo() {
		return disclosureInfo;
	}

	public void setDisclosureInfo(BizDisclosureInfoBO disclosureInfo) {
		this.disclosureInfo = disclosureInfo;
	}

	public List<BizDisclosureInfoBO> getDisclosureList() {
		return disclosureList;
	}

	public void setDisclosureList(List<BizDisclosureInfoBO> disclosureList) {
		this.disclosureList = disclosureList;
	}

	public BizEnterpriseBO getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BizEnterpriseBO enterprise) {
		this.enterprise = enterprise;
	}

	public BizEnterpriseLegalBO getEnterpriseLegal() {
		return enterpriseLegal;
	}

	public void setEnterpriseLegal(BizEnterpriseLegalBO enterpriseLegal) {
		this.enterpriseLegal = enterpriseLegal;
	}

}