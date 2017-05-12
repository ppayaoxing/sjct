package com.qfw.bizservice.custinfo.impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qfw.api.SuanhuaUtil;
import com.qfw.bizservice.custinfo.ICustInfoBS;
import com.qfw.bizservice.custinfo.account.ICustAccountBS;
import com.qfw.common.bizservice.impl.BaseServiceImpl;
import com.qfw.common.bizservice.permission.IUserBS;
import com.qfw.common.exception.BizException;
import com.qfw.common.log.LogFactory;
import com.qfw.common.model.permission.SysUser;
import com.qfw.common.util.CollectionUtil;
import com.qfw.common.util.NumberUtils;
import com.qfw.common.util.web.ViewOper;
import com.qfw.dao.custinfo.ICustInfoDAO;
import com.qfw.dao.custinfo.enterprise.IEnterpriseDAO;
import com.qfw.model.AppConst;
import com.qfw.model.bo.BizAccountBO;
import com.qfw.model.bo.BizContactsBO;
import com.qfw.model.bo.BizCustomerBO;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.bo.BizEnterpriseLegalBO;
import com.qfw.model.vo.credit.BizCreditLimitApplyVO;
import com.qfw.model.vo.custinfo.CustInfoCreditVO;
import com.qfw.model.vo.custinfo.CustInfoVO;
import com.qfw.model.vo.custinfo.SearchCustInfoVO;
import com.qfw.model.vo.custinfo.basicInfo.CustBasicInfoVO;
import com.qfw.platform.model.json.Pager;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Service("custInfoBS")
public class CustInfoBSImpl extends BaseServiceImpl implements ICustInfoBS {
	
	@Autowired
	private ICustInfoDAO custInfoDAO;
	@Autowired
	private IEnterpriseDAO enterpriseDAO;
	@Autowired
	private ICustAccountBS custAccountBS;
	@Autowired
	private IUserBS userBS;
	
	private Logger log = LogFactory.getInstance().getBusinessLogger();

	@Override
	@Transactional(rollbackFor = Exception.class,propagation = Propagation.REQUIRED)
	public List<CustInfoVO> findCustInfo(SearchCustInfoVO searchCustInfoVO) throws BizException {
		
		return this.custInfoDAO.findCustInfo(searchCustInfoVO);
	}

	@Override
	public List<CustInfoVO> findCustInfoPagesByVO(SearchCustInfoVO searchCustInfoVO, int first, int pageSize) {
		try {
			List<CustInfoVO> custInfoVOs = this.custInfoDAO.findCustInfoPagesByVO(searchCustInfoVO, first, pageSize);
			if (custInfoVOs != null && !custInfoVOs.isEmpty()) {
				return custInfoVOs;
			}
		} catch (BizException e) {
			if (log.isDebugEnabled()) {
				log.error(e.getMessage());
			}
		}
		return null;
	}
	@Override
	public Pager findMyRecommend(int requestPage, int pageSize, Integer custId) throws BizException{
		return custInfoDAO.findMyRecommend(requestPage, pageSize, custId);
	}

	@Override
	public int findCustInfoCountByVO(SearchCustInfoVO searchCustInfoVO) {
		int count = 0;
		try {
			count = this.custInfoDAO.findCustInfoCountByVO(searchCustInfoVO);
		} catch (BizException e) {
			if (log.isDebugEnabled()) {
				log.error(e.getMessage());
			}
		}
		return count;
	}
	
	public int countReferee(Integer custId) {
		int count = 0;
		try {
			count = this.custInfoDAO.countReferee(custId);
		} catch (BizException e) {
			if (log.isDebugEnabled()) {
				log.error(e.getMessage());
			}
		}
		return count;
	}
	
	/**
	 * 根据客户编号查询客户相关信息
	 * @param custId
	 * @return
	 * @throws BizException
	 */
	public CustInfoVO findCustInfoById (Integer custId) {
		try {
			List<CustInfoVO> custInfoVOs = this.custInfoDAO.findCustInfoById(custId);
			if (custInfoVOs != null && !custInfoVOs.isEmpty()) {
				return custInfoVOs.get(0);
			}
		} catch (BizException e) {
			if (log.isDebugEnabled()) {
				log.error(e.getMessage());
			}
		}
		return null;
		
	}

	@Override
	public CustBasicInfoVO findCustBasicInfo(Integer custId) {
		return null;
	}
	
	
	/**
	 * 添加用户信息
	 * @param user
	 * @param deptIds
	 */
	public void addCust(BizCustomerBO  cust) throws BizException{
		cust.setSysCreateTime(new Timestamp(new Date().getTime()));
		cust.setSysCreateUser(ViewOper.getUser().getUserId());
		cust.setSysUpdateTime(new Timestamp(new Date().getTime()));
		cust.setSysUpdateUser(ViewOper.getUser().getUserId());
		getHibernateTemplate().saveOrUpdate(cust);
	}

	/**
	 * 更新用户信息
	 * @param user
	 * @param deptIds
	 */
	public void updateCust(BizCustomerBO  cust) throws BizException{
		cust.setSysCreateTime(new Timestamp(new Date().getTime()));
		cust.setSysCreateUser(ViewOper.getUser().getUserId());
		cust.setSysUpdateTime(new Timestamp(new Date().getTime()));
		cust.setSysUpdateUser(ViewOper.getUser().getUserId());
		getHibernateTemplate().update(cust);
		
		if(null!=cust.getUserId()&&cust.getUserId()>0){
			SysUser user =  this.userBS.findUserByUserId(cust.getUserId());	
			user.setTel(cust.getMobileTelephone());
			user.setSex(cust.getSex());
			user.setCardid(cust.getCertificateNum());
			getHibernateTemplate().update(user);
		}
		
	}
	
	/**
	 * 根据用户ID 查找对应的客户ID
	 * @param userId
	 * @return
	 * @throws BizException 
	 */
	public CustInfoVO findCust(Integer userId) throws BizException{
		List<CustInfoVO> custInfoVOs = this.custInfoDAO.findCustInfoByUserId(userId);
		if (custInfoVOs != null && !custInfoVOs.isEmpty()) {
			return custInfoVOs.get(0);
		}
		return null;
		
	}
	
	public BizCustomerBO findCustById(Integer id){
		BizCustomerBO cust = new BizCustomerBO();
		cust = (BizCustomerBO) custInfoDAO.findById(BizCustomerBO.class, id);
		return cust;
	}
	
	/**
	 * 通过用户id查询客户信息
	 * @param userId
	 * @return
	 * @throws BizException
	 */
	public BizCustomerBO findCustByUserId(Integer userId) throws BizException{
		try{
			List list = getHibernateTemplate().find("from BizCustomerBO where userId = ?",userId);
			if(CollectionUtil.isNotEmpty(list)){
				return (BizCustomerBO) list.get(0);
			}
		}catch(Exception e){
			throw new BizException("客户信息查询失败");
		}
		return null;
	}
	
	public BizCustomerBO findCustByRefereeCode(String refereeCode) throws BizException{
		try{
			List list = getHibernateTemplate().find("from BizCustomerBO where refereeCode = ?",refereeCode);
			if(CollectionUtil.isNotEmpty(list)){
				return (BizCustomerBO) list.get(0);
			}
		}catch(Exception e){
			throw new BizException("客户信息查询失败");
		}
		return null;
	}
	
	public List<BizCustomerBO> findCustomer(String mobile) throws BizException {
		try{
			List<BizCustomerBO> list = getHibernateTemplate().find("from BizCustomerBO where mobileTelephone = ?",mobile);
			return list;
		}catch(Exception e){
			throw new BizException("客户信息查询失败");
		}
	}
	
	public ICustInfoDAO getCustInfoDAO() {
		return custInfoDAO;
	}

	public void setCustInfoDAO(ICustInfoDAO custInfoDAO) {
		this.custInfoDAO = custInfoDAO;
	}

	@Override
	@Transactional(rollbackFor = Exception.class,propagation = Propagation.REQUIRED)
	public void saveCust(BizCustomerBO cust) throws BizException {
		try {
			this.addCust(cust);
			BizAccountBO accountBO = new BizAccountBO();
	    	accountBO.setAccount(cust.getId().toString());
	    	accountBO.setCustId(cust.getId());
	    	custAccountBS.addCustAccount(accountBO);
		} catch (Exception e) {
			log.error("客户信息新增失败", e);
			throw new BizException(e);
		}
	}
	
	public int getCustCountByIdCard(String IdCard) throws BizException {
		StringBuilder sb = new StringBuilder(
				"select count(id) from BizCustomerBO where certificateNum = '" + IdCard
						+ "' and certificateTypeCd = '0'" );
		return custInfoDAO.count(sb.toString()) ;
		
	}
	@Override
	public CustInfoVO getPlatCustInfo() throws BizException {
		CustInfoVO custInfoVO = null;
		List<CustInfoVO> list = custInfoDAO.sumAccount();
		if(list != null && list.size() > 0){
			custInfoVO = list.get(0);
		}else{
			custInfoVO = new CustInfoVO();
			custInfoVO.setAccountBalAmt(BigDecimal.ZERO);
			custInfoVO.setUsableBalAmt(BigDecimal.ZERO);
		}
		custInfoVO.setCountCust(new Long(custInfoDAO.countCust()));
		custInfoVO.setCountVip(new Long(custInfoDAO.countVip()));
		custInfoVO.setRecommend(new Long(custInfoDAO.countRecommend()));
		return custInfoVO;
	}
	@Override
	public int countCust() throws BizException{
		return custInfoDAO.countCust();
	}
	/**
	 * 创建企业
	 * @throws BizException
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,propagation = Propagation.REQUIRED)
	public void createEnterprise(BizCreditLimitApplyVO vo)throws BizException{
		if(vo.getEnterprise() == null 
				|| vo.getCust() == null || vo.getEnterpriseLegal() == null){
			throw new BizException("参数不完整");
		}
		Date now = new Date();
		SysUser optUser = ViewOper.getUser();
		Integer optUserId = optUser.getUserId();
		//更新用户信息
		BizCustomerBO cust = vo.getCust();
		Integer custId = cust.getId();
		Integer userId = cust.getUserId();
		
		cust.setCustTypeCd(AppConst.CUST_TYPE_CD_ENTERPRISE);//会员类型：企业
		cust.setSysUpdateUser(optUserId);
		cust.setSysUpdateTime(now);
		update(cust);
		
		updateUserByCust(cust,optUser);
		//保存企业信息
		BizEnterpriseBO enterprise = vo.getEnterprise();
		
		if(enterprise.getId() != null){
			enterprise.setSysUpdateTime(now);
			enterprise.setSysUpdateUser(optUserId);
			update(enterprise);
			
		}else{
			enterprise.setUserId(userId);
			enterprise.setSysCreateTime(now);
			enterprise.setSysCreateUser(optUserId);
			enterprise.setCustId(custId);
			save(enterprise);
		}
		
		//保存法人信息
		BizEnterpriseLegalBO enterpriseLegal = vo.getEnterpriseLegal();
		
		if(enterpriseLegal.getId() != null){
			enterpriseLegal.setSysUpdateTime(now);
			enterpriseLegal.setSysUpdateUser(optUserId);
			update(enterpriseLegal);
		}else{
			enterpriseLegal.setUserId(userId);
			enterpriseLegal.setCustId(custId);
			enterpriseLegal.setEnterpriseId(enterprise.getId());
			enterpriseLegal.setSysCreateTime(now);
			enterpriseLegal.setSysCreateUser(optUserId);
			save(enterpriseLegal);
		}
		
		List<BizContactsBO> contacts = vo.getContacts();
		if(CollectionUtil.isNotEmpty(contacts)){
			for (BizContactsBO bizContactsBO : contacts) {
				bizContactsBO.setWorkItemId("0");//联系人信息不走流程
				bizContactsBO.setCustId(cust.getId());
				bizContactsBO.setSysUpdateUser(optUserId);
				if(NumberUtils.isBlank(bizContactsBO.getId())){
					bizContactsBO.setSysCreateUser(optUserId);
					bizContactsBO.setSysCreateTime(now);
					save(bizContactsBO);
				}else{
					update(bizContactsBO);
				}
			}
		}
		//删除移除的联系信息人
		List<BizContactsBO> removeContacts = vo.getRemoveContacts();
		if(CollectionUtil.isNotEmpty(removeContacts)){
			for (BizContactsBO bizContactsBO : removeContacts) {
				delete(bizContactsBO);
			}
		}
		
	}
	
	private void updateUserByCust(BizCustomerBO cust,SysUser optUser){
		SysUser user = this.userBS.findUserById(cust.getUserId());
//		user.setEmail(cust.getEmail());			//邮箱
		user.setUserName(cust.getCustName());	//用户名
		user.setTel(cust.getMobileTelephone()); //电话
		user.setSex(cust.getSex());				//性别
		user.setCardid(cust.getCertificateNum());//身份证
		user.setQq(cust.getQq());				// qq
		user.setSysUpdateTime(new Date());
		user.setSysUpdateUser(optUser.getUserId().toString());
		update(user);
	}
	
	@Override
	public CustInfoCreditVO queryCredit(String custName,
			String certificateNumSession) throws BizException {
		try {
			String result = SuanhuaUtil.testPbccrcQ(custName, certificateNumSession);
			if(null != result && !"".equals(result)){
				JSONObject resultJson = JSONObject.fromObject(result);
				if(null != resultJson && !"".equals(resultJson)){
					JSONObject dataJs =  resultJson.getJSONObject("data");
					if(null != dataJs && !"".equals(dataJs)){
						String reportRiskString =  dataJs.getString(CustInfoCreditVO.report_risk);
						if(null != reportRiskString && !"".equals(reportRiskString)){
							
							JSONObject reportRisk = JSONObject.fromObject(reportRiskString);
							
							if(null != reportRisk && !"".equals(reportRisk)){
								CustInfoCreditVO CustInfoCreditVO = (CustInfoCreditVO)JSONObject.toBean(reportRisk, CustInfoCreditVO.class);
								
								return CustInfoCreditVO;
							}
						}
					}
				}
			}
		} catch (JSONException e) {
//			e.printStackTrace();
			log.error(e.getMessage());
		}
		return null;
	}
}
