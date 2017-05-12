package com.qfw.dao.custinfo.enterprise;

import java.util.List;

import com.qfw.common.dao.IBaseDAO;
import com.qfw.common.exception.BizException;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.bo.BizEnterpriseLegalBO;
import com.qfw.model.vo.custinfo.SearchEnterpriseVO;

public interface IEnterpriseDAO  extends IBaseDAO{

	public List<BizEnterpriseBO> findByParams(SearchEnterpriseVO vo)
			throws BizException;

	public BizEnterpriseBO findByUserId(Integer userId) throws BizException;

	public BizEnterpriseBO findByCustId(Integer custId) throws BizException;

	public BizEnterpriseLegalBO findLegalByUserId(Integer userId) throws BizException;
	
 
}
