package com.qfw.dao.custinfo.enterprise.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qfw.common.dao.impl.BaseDAOImpl;
import com.qfw.common.exception.BizException;
import com.qfw.common.util.StringUtils;
import com.qfw.dao.custinfo.enterprise.IEnterpriseDAO;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.bo.BizEnterpriseLegalBO;
import com.qfw.model.vo.custinfo.SearchEnterpriseVO;

@Repository("enterpriseDAO")
public class EnterpriseDAOImpl  extends BaseDAOImpl implements IEnterpriseDAO {
	
	@Override
	public List<BizEnterpriseBO> findByParams(SearchEnterpriseVO vo)
			throws BizException {
		try {
			StringBuffer str = new StringBuffer(" from BizEnterpriseBO bo where 1=1");
			if(StringUtils.isNotEmpty(vo.getOrganizationCode())){
				str.append(" and bo.organizationCode = '").append(vo.getOrganizationCode()).append("'");
			}
			
			return super.findByHQL(str.toString());
		} catch (Exception e) {
			throw new BizException(e);
		}
	}
	
	@Override
	public BizEnterpriseBO findByUserId(Integer userId)throws BizException {
		try {
			StringBuffer str = new StringBuffer(" from BizEnterpriseBO bo where 1=1");
			str.append(" and bo.userId = ").append(userId);
			List<BizEnterpriseBO> list = findByHQL(str.toString());
			if(list != null && list.size() > 0){
				return list.get(0);
			}
			return null;
		} catch (Exception e) {
			throw new BizException(e);
		}
	}
	@Override
	public BizEnterpriseLegalBO findLegalByUserId(Integer userId)throws BizException {
		try {
			StringBuffer str = new StringBuffer(" from BizEnterpriseLegalBO bo where 1=1");
			str.append(" and bo.userId = ").append(userId);
			List<BizEnterpriseLegalBO> list = findByHQL(str.toString());
			if(list != null && list.size() > 0){
				return list.get(0);
			}
			return null;
		} catch (Exception e) {
			throw new BizException(e);
		}
	}
	@Override
	public BizEnterpriseBO findByCustId(Integer custId)throws BizException {
		try {
			StringBuffer str = new StringBuffer(" from BizEnterpriseBO bo where 1=1");
			str.append(" and bo.custId = ").append(custId);
			List<BizEnterpriseBO> list = findByHQL(str.toString());
			if(list != null && list.size() > 0){
				return list.get(0);
			}
			return null;
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

}
