package com.qfw.bean.custinfo;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

import org.apache.log4j.Logger;

import com.qfw.bizservice.credit.ICreditLimitApplyBS;
import com.qfw.bizservice.custinfo.ICustInfoBS;
import com.qfw.bizservice.custinfo.account.ICustAccountBS;
import com.qfw.bizservice.custinfo.enterprise.IEnterpriseBS;
import com.qfw.common.bizservice.permission.IUserInfoSyncBS;
import com.qfw.common.log.LogFactory;
import com.qfw.common.util.NumberUtils;
import com.qfw.common.util.StringUtils;
import com.qfw.common.util.web.ViewOper;
import com.qfw.common.util.web.WorkFlowAndPartyUserBackingBean;
import com.qfw.model.bo.BizAccountBO;
import com.qfw.model.bo.BizContactsBO;
import com.qfw.model.bo.BizCustomerBO;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.bo.BizEnterpriseLegalBO;
import com.qfw.model.vo.credit.BizCreditLimitApplyVO;
import com.qfw.model.vo.custinfo.CustInfoVO;
import com.qfw.model.vo.custinfo.LazyCustDataModel;
import com.qfw.model.vo.custinfo.SearchCustInfoVO;
import com.qfw.model.vo.custinfo.SearchEnterpriseVO;

@ViewScoped
@ManagedBean(name="custInfoAddBean")
public class CustInfoAddBean extends WorkFlowAndPartyUserBackingBean{

	private static final long serialVersionUID = 1L;
	
	private String operateFlag;

	private SearchCustInfoVO searchCustInfoVO = new SearchCustInfoVO();
	
	private List<CustInfoVO> custInfoList;	
	
	private LazyCustDataModel dataModel;
	
	private CustInfoVO selectCust;
	
	private BizCustomerBO  cust = new BizCustomerBO();
	//add by yangjj 20160309 start
	private BizEnterpriseBO enterprise = new BizEnterpriseBO();//企业信息
	
	private BizEnterpriseLegalBO enterpriseLegal = new BizEnterpriseLegalBO();
	//add by yangjj 20160309 end
	@ManagedProperty(value = "#{custInfoBS}")
	private ICustInfoBS custInfoBS;
	
	@ManagedProperty(value = "#{custAccountBS}")
	private ICustAccountBS custAccountBS;
	@ManagedProperty(value = "#{creditLimitApplyBS}")
	private ICreditLimitApplyBS creditLimitApplyBS;
	
	@ManagedProperty(value = "#{userInfoSync}")
	private IUserInfoSyncBS userInfoSyncBS;
	
	@ManagedProperty(value = "#{enterpriseBS}")
	private IEnterpriseBS enterpriseBS;
	
	private BizAccountBO accountBO = new BizAccountBO();
	
	private BizCreditLimitApplyVO creditLimitApplyVO = new BizCreditLimitApplyVO();
	private Logger log = LogFactory.getInstance().getBusinessLogger();
	
	@PostConstruct
	public void init() {
		operateFlag = ViewOper.getRequestParameter("operateFlag");
		Object userid = ViewOper.getSessionTmpAttr("userId");
		try {
			creditLimitApplyBS.initCreditLimitApplyVOByCustId(String.valueOf((Integer) userid),creditLimitApplyVO);
		} catch (Exception e) {
			log.warn("客户信息获取异常",e);
			this.alert("客户信息获取异常");
		}
		
	}
	
	public void save(){
		try{
			if(null==creditLimitApplyVO||null==creditLimitApplyVO.getCust()){
				this.alert("客户信息不能空");
			}else{
				cust = creditLimitApplyVO.getCust();
			}
			cust.setScore(0);
			String valInfo = this.validateCust(cust);
			if(!StringUtils.isEmpty(valInfo)){
//				System.out.print(valInfo);
				this.alert(valInfo);
				return;
			}
			String errorInfo = "";// 记录错误信息   
	        String Ai = "";  
	        if (cust.getCertificateNum().length() == 18) {   
	            Ai = cust.getCertificateNum().substring(0, 17);   
	        } 
	        
	        Pattern p = Pattern.compile("^((1[0-9][0-9])|(15[^4,\\D])|(18[0-3,5-9]))\\d{8}$");  
	        Matcher m = p.matcher(cust.getMobileTelephone()); 
	        
	        if( Integer.valueOf(cust.getAge())> 110 || Integer.valueOf(cust.getAge())< 0){
	        	alert("年龄只能在0-110之间！");
	            return;
	        }
	        if (isNumeric(Ai) == false || cust.getCertificateNum().length() != 18) {   
	            errorInfo = "身份证18位号码都应为数字 ; 18位号码除最后一位外，都应为数字。";   
	            alert(errorInfo);
	            return;
	        }  
	        if( !m.matches()){
	        	alert("请输入正确的移动电话号码！");
	            return;
	        }
	        
	        String mess = "";
//	        if(cust.getUserId()==null || cust.getUserId()==0){
//	        	if("".equals(this.getSelectPartyUser().getUserId()) || null == this.getSelectPartyUser().getUserId()){
//		        	alert("用户ID不能为空！");
//		            return;
//		        }
//	        	cust.setUserId(this.getSelectPartyUser().getUserId());
//	        	custInfoBS.saveCust(cust);;
//	        	mess = "用户"+cust.getCustName()+"保存成功！";
//	        } else {
//	        	custInfoBS.updateCust(cust);
	        // 保存客户信息
	        this.creditLimitApplyBS.saveCreditlimtTabInfo(creditLimitApplyVO);
	        BizCustomerBO cust = creditLimitApplyVO.getCust();
	        /*if(cust != null){
	        	 UserInfo userInfo = new UserInfo();
	        	 if(cust.getAge() != null){
	        		 userInfo.setAge(cust.getAge().toString());
	        	 }
	 	        userInfo.setBirthday(DateUtils.getDateString("yyyy-MM-dd", cust.getBirthDate()));
//	 	        userInfo.setCity(city);
	 	      	userInfo.setCultural(cust.getEducationCd());
	 	      	userInfo.setCustName(cust.getCustName());
//		 	    userInfo.setHaveChild(haveChild);
		 	    userInfo.setIdCard(cust.getCertificateNum());
//		 	    userInfo.setLoginName();
//		 	  	userInfo.setMail(mail);
			 	userInfo.setMarital(cust.getMaritalStatusCd());
			 	userInfo.setMobile(cust.getMobileTelephone());
//			 	userInfo.setNativeAddr(nativeAddr);
			 	userInfo.setTelephone(cust.getTelephone());
			 	userInfo.setSex("0".equals(cust.getSex()) ? "F" : "M");
//			 	userInfo.setRefereeName(refereeName);
//			 	userInfo.setPassword(password);
			 	userInfo.setOperate(AppConst.USERINFO_SYN_MOD);
	 	        userInfoSyncBS.userInfoSync(userInfo);
	        }*/
	       
	        //更新会员认证情况开始
//			Map<String,BizAuthBO> authMap = creditLimitApplyVO.getAuthMap();
//			Collection<BizAuthBO> authBOs = authMap.values();
//			for (BizAuthBO bizAuthBO : authBOs) {
//				bizAuthBO.setRelId(String.valueOf(cust.getId()));
//				bizAuthBO.setRelTypeCd(AppConst.AUTH_REL_TYPE_CD_CUST);
//				bizAuthBO.setSysUpdateUser(ViewOper.getUser().getUserId());
//				bizAuthBO.setWorkItemId("0");
//				if(NumberUtils.isBlank(bizAuthBO.getId())){
//					bizAuthBO.setSysCreateUser(ViewOper.getUser().getUserId());
//					bizAuthBO.setSysCreateTime(new Date());
//					custInfoBS.save(bizAuthBO);
//				}else{
//					custInfoBS.update(bizAuthBO);
//				}
//			}
			//更新会员认证情况结束
	        mess = "用户"+cust.getCustName()+"更新成功！";
//	        }
	        
	        this.alertInfo(mess);
			executeJS("alert('"+mess+"');closeParMainDialog();");
		}catch(Exception e){
			 
			this.alert("操作失败，请与管理员联系");
		}
		
	}
	public void saveEnterprise(){
		try{
			cust = creditLimitApplyVO.getCust();
			enterprise = creditLimitApplyVO.getEnterprise();
			enterpriseLegal = creditLimitApplyVO.getEnterpriseLegal();
			
			if(enterprise == null){
				alert("企业信息不能为空");
			}
			if(null == cust){
				this.alert("用户信息不能为空");
			}
			if(null == enterpriseLegal){
				this.alert("法人信息不能为空");
			}
			
			cust.setScore(0);
			String errorInfo = "";// 记录错误信息   
			String ai = "";  
			if (cust.getCertificateNum().length() == 18) {   
				ai = cust.getCertificateNum().substring(0, 17);   
			} 
			
//			Pattern p = Pattern.compile("^((1[0-9][0-9])|(15[^4,\\D])|(18[0-3,5-9]))\\d{8}$");  
//			Matcher m = p.matcher(cust.getMobileTelephone()); 
			
			if (isNumeric(ai) == false || cust.getCertificateNum().length() != 18) {   
				errorInfo = "身份证填写有误";   
				alert(errorInfo);
				return;
			}  
//			if( !m.matches()){
//				alert("请输入正确的移动电话号码！");
//				return;
//			}
			
			String mess = "";
			SearchEnterpriseVO vo = new SearchEnterpriseVO();
			vo.setOrganizationCode(enterprise.getOrganizationCode());
//			List<BizEnterpriseBO> list = enterpriseBS.findByParams(vo);
			/*if(list != null && list.size() > 0){
				alert("企业已经存在");
				return;
			}*/
			custInfoBS.createEnterprise(creditLimitApplyVO);
			mess = "企业信息保存成功";
			
			this.alertInfo(mess);
			executeJS("alert('"+mess+"');closeParMainDialog();");
		}catch(Exception e){
			log.error(e.getMessage());
			this.alert("操作失败，请与管理员联系");
		}
		
	}
	public String validateCust(BizCustomerBO cust){
		StringBuffer mess = new StringBuffer();
		if(null == cust){
			mess.append("客户信息不能为空<br/>");
		}
		if(null == cust.getAge()||cust.getAge() == 0){
			mess.append("年龄不能为空<br/>");
		}
		if(null == cust.getCustName()||cust.getCustName().length()<=0){
			mess.append("客户名称不能为空<br/>");
		}
		if(null == cust.getMobileTelephone()||cust.getMobileTelephone().length()<=0){
			mess.append("移动电话不能为空<br/>");
		}
		if(null == cust.getSex()||cust.getSex().length()<=0){
			mess.append("性别不能为空<br/>");
		}
		if(null == cust.getCertificateNum()){
			mess.append("身份证 不能为空<br/>");
		}
		String Ai = ""; 
		if (cust.getCertificateNum().length() == 18) {   
	        Ai = cust.getCertificateNum().substring(0, 17);   
	    } 
	    if (isNumeric(Ai) == false || cust.getCertificateNum().length() != 18) {   
	    	mess.append("身份证格式有误<br/>");   
	    }
	    if(null == cust.getMaritalStatusCd()||cust.getMaritalStatusCd().length()<=0){
	    	mess.append("婚姻状况不能为空<br/>");
	    }
	    if(null == cust.getEducationCd()||cust.getEducationCd().length()<=0){
	    	mess.append("学历不能为空<br/>");
	    }
	    if(null == cust.getProvinceCd()||cust.getProvinceCd().length()<=0
	    		|| null == cust.getCityCd()||cust.getCityCd().length()<=0
	    		|| null == cust.getNationalityCd() || cust.getNationalityCd().length()<=0
	    		|| null == cust.getStreetAddress() || cust.getStreetAddress().length()<=0){
	    	mess.append("户籍地址需要全部填写详细<br/>");
	    }
	    if(null == cust.getLiveProvinceCd()||cust.getLiveProvinceCd().length()<=0
	    		|| null == cust.getLiveCityCd()||cust.getLiveCityCd().length()<=0
	    		|| null == cust.getLiveNationalityCd() || cust.getLiveNationalityCd().length()<=0
	    		|| null == cust.getLiveStreetAddress() || cust.getLiveStreetAddress().length()<=0){
	    	mess.append("现居住地址需要全部填写详细<br/>");
	    }
		return mess.toString();
	}
	public String validateEnterprise(BizEnterpriseBO bizEnterprise){
		StringBuffer mess = new StringBuffer();
		return mess.toString();
	}
	
	/**
	 * 新增联系人信息
	 */
	public void addContact() {
		BizContactsBO contact = creditLimitApplyVO.getContact();
		String message = this.creditLimitApplyBS.verContactsInfo(contact);
		if(null != message && message.length()>0){
			alert(message);
		}else{
			creditLimitApplyVO.getContacts().add(contact);
			creditLimitApplyVO.setContact(new BizContactsBO());
		}
	}

	/**
	 * 删除关联信息
	 */
	public void deleteContact() {
		String index = ViewOper.getParameter("index");
		if (StringUtils.isNotEmpty(index)) {
			BizContactsBO contact = creditLimitApplyVO.getContacts().remove(
					Integer.valueOf(index).intValue());
			if (contact != null && !NumberUtils.isBlank(contact.getId())) {
				creditLimitApplyVO.getRemoveContacts().add(contact);
			}
		}
	}
	
	/**  
     * 功能：判断字符串是否为数字  
     * @param str  
     * @return  
     */  
    private static boolean isNumeric(String str) {   
        Pattern pattern = Pattern.compile("[0-9]*");   
        Matcher isNum = pattern.matcher(str);   
        if (isNum.matches()) {   
            return true;   
        } else {   
            return false;   
        }   
    }
	public LazyCustDataModel getDataModel() {
		return dataModel;
	}

	public void setDataModel(LazyCustDataModel dataModel) {
		this.dataModel = dataModel;
	}

	public SearchCustInfoVO getSearchCustInfoVO() {
		return searchCustInfoVO;
	}

	public void setSearchCustInfoVO(SearchCustInfoVO searchCustInfoVO) {
		this.searchCustInfoVO = searchCustInfoVO;
	}

	public List<CustInfoVO> getCustInfoList() {
		return custInfoList;
	}

	public void setCustInfoList(List<CustInfoVO> custInfoList) {
		this.custInfoList = custInfoList;
	}

	public ICustInfoBS getCustInfoBS() {
		return custInfoBS;
	}

	public void setCustInfoBS(ICustInfoBS custInfoBS) {
		this.custInfoBS = custInfoBS;
	}

	public CustInfoVO getSelectCust() {
		return selectCust;
	}

	public void setSelectCust(CustInfoVO selectCust) {
		this.selectCust = selectCust;
	}

	public String getOperateFlag() {
		return operateFlag;
	}

	public void setOperateFlag(String operateFlag) {
		this.operateFlag = operateFlag;
	}

	public void searchCustInfo () {
		init();
	}
	
	public String reset () {
		searchCustInfoVO = new SearchCustInfoVO();
		return null;
	}

	public BizCustomerBO getCust() {
		return cust;
	}

	public void setCust(BizCustomerBO cust) {
		this.cust = cust;
	}

	public ICustAccountBS getCustAccountBS() {
		return custAccountBS;
	}

	public void setCustAccountBS(ICustAccountBS custAccountBS) {
		this.custAccountBS = custAccountBS;
	}

	public BizAccountBO getAccountBO() {
		return accountBO;
	}

	public void setAccountBO(BizAccountBO accountBO) {
		this.accountBO = accountBO;
	}

	public ICreditLimitApplyBS getCreditLimitApplyBS() {
		return creditLimitApplyBS;
	}

	public void setCreditLimitApplyBS(ICreditLimitApplyBS creditLimitApplyBS) {
		this.creditLimitApplyBS = creditLimitApplyBS;
	}

	public BizCreditLimitApplyVO getCreditLimitApplyVO() {
		return creditLimitApplyVO;
	}

	public void setCreditLimitApplyVO(BizCreditLimitApplyVO creditLimitApplyVO) {
		this.creditLimitApplyVO = creditLimitApplyVO;
	}

	public IUserInfoSyncBS getUserInfoSyncBS() {
		return userInfoSyncBS;
	}

	public void setUserInfoSyncBS(IUserInfoSyncBS userInfoSyncBS) {
		this.userInfoSyncBS = userInfoSyncBS;
	}

	public BizEnterpriseBO getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BizEnterpriseBO enterprise) {
		this.enterprise = enterprise;
	}

	public IEnterpriseBS getEnterpriseBS() {
		return enterpriseBS;
	}

	public void setEnterpriseBS(IEnterpriseBS enterpriseBS) {
		this.enterpriseBS = enterpriseBS;
	}

	public BizEnterpriseLegalBO getEnterpriseLegal() {
		return enterpriseLegal;
	}

	public void setEnterpriseLegal(BizEnterpriseLegalBO enterpriseLegal) {
		this.enterpriseLegal = enterpriseLegal;
	}

}
