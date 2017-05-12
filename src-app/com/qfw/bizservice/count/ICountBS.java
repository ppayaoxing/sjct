package com.qfw.bizservice.count;

import java.math.BigDecimal;

import com.qfw.common.bizservice.IBaseService;
import com.qfw.common.exception.BizException;

/**
 *
 */
public interface ICountBS extends IBaseService {

	public int countCust() throws BizException;

	public BigDecimal sumCreditorRight();

	public int countCreditorRight();

	public BigDecimal sumLoan(String loanStatusCd);

	public int countLoan(String loanStatusCd);

	public int countCREffective();
	
}
	