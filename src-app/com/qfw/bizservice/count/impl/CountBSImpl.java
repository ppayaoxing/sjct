package com.qfw.bizservice.count.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qfw.bizservice.count.ICountBS;
import com.qfw.common.bizservice.impl.BaseServiceImpl;
import com.qfw.common.dao.ICommonQuery;
import com.qfw.common.exception.BizException;
import com.qfw.common.util.CollectionUtil;
import com.qfw.dao.custinfo.ICustInfoDAO;

@Service("countBS")
public class CountBSImpl extends BaseServiceImpl implements ICountBS {

	@Autowired
	private ICustInfoDAO custInfoDAO;

	@Autowired
	private ICommonQuery commonQuery;
	@Override
	public BigDecimal sumCreditorRight() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT sum(cr_amt) as CR_AMT");
		sql.append(" FROM biz_creditor_right");
		sql.append(" WHERE 1 = 1");
		List<?> sum = commonQuery.findBySQL(sql.toString());
		if(CollectionUtil.isEmpty(sum)){
			return new BigDecimal(0);
		}else{
			return (BigDecimal)((Map)sum.get(0)).get("CR_AMT");
		}
	}
	@Override
	public BigDecimal sumLoan(String loanStatusCd) {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT sum(LOAN_AMT) AS LOAN_AMT");
		sql.append(" FROM biz_loan loan");
		sql.append(" WHERE 1 = 1");
		if(StringUtils.isNotBlank(loanStatusCd)){
			sql.append(" and loan_status_cd = '").append(loanStatusCd+"'");
		}
		List<?> sum = commonQuery.findBySQL(sql.toString());
		if(CollectionUtil.isEmpty(sum)){
			return new BigDecimal(0);
		}else{
			return (BigDecimal)((Map)sum.get(0)).get("LOAN_AMT");
		}
	}
	@Override
	public int countLoan(String loanStatusCd) {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT count(*)");
		sql.append(" FROM biz_loan loan");
		sql.append(" WHERE 1 = 1");
		if(StringUtils.isNotBlank(loanStatusCd)){
			sql.append(" and loan_status_cd = '").append(loanStatusCd+"'");
		}
		return this.commonQuery.findCountBySQL(sql, null);
	}
	@Override
	public int countCreditorRight() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT count(*)");
		sql.append(" FROM biz_creditor_right");
		sql.append(" WHERE 1 = 1");
		return this.commonQuery.findCountBySQL(sql, null);
	}
	@Override
	public int countCREffective() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT count(*)");
		sql.append(" FROM biz_creditor_right");
		sql.append(" WHERE 1 = 1");
		sql.append(" and CR_STATUS_CD = '").append("");
		return this.commonQuery.findCountBySQL(sql, null);
	}

	@Override
	public int countCust() throws BizException {
		return custInfoDAO.countCust();
	}

}
