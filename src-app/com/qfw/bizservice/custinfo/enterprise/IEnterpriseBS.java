package com.qfw.bizservice.custinfo.enterprise;

import java.util.List;

import com.qfw.common.bizservice.IBaseService;
import com.qfw.common.exception.BizException;
import com.qfw.model.bo.BizEnterpriseBO;
import com.qfw.model.vo.custinfo.SearchEnterpriseVO;

public interface IEnterpriseBS extends IBaseService{

	public List<BizEnterpriseBO> findByParams(SearchEnterpriseVO vo)
			throws BizException;

	public BizEnterpriseBO findByCustId(Integer custId) throws BizException;

}
