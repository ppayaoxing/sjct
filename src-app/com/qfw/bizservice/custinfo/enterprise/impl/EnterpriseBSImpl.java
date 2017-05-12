package com.qfw.bizservice.custinfo.enterprise.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qfw.bizservice.custinfo.enterprise.IEnterpriseBS;
import com.qfw.common.bizservice.impl.BaseServiceImpl;
import com.qfw.common.exception.BizException;
import com.qfw.common.log.LogFactory;
import com.qfw.dao.custinfo.enterprise.IEnterpriseDAO;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.vo.custinfo.SearchEnterpriseVO;

@Service("enterpriseBS")
public class EnterpriseBSImpl extends BaseServiceImpl implements IEnterpriseBS {
	
	@Autowired
	private IEnterpriseDAO enterpriseDAO;
	
	private Logger log = LogFactory.getInstance().getBusinessLogger();
	
	@Override
	public List<BizEnterpriseBO> findByParams(SearchEnterpriseVO vo)
			throws BizException {
		return enterpriseDAO.findByParams(vo);
	}
	
	@Override
	public BizEnterpriseBO findByCustId(Integer custId)throws BizException {
		return enterpriseDAO.findByCustId(custId);
	}
	

}
