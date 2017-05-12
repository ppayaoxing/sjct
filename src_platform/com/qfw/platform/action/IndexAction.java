package com.qfw.platform.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qfw.bizservice.bussparams.IProductInfoBS;
import com.qfw.bizservice.loan.ILoanManageBS;
import com.qfw.common.exception.BizException;
import com.qfw.common.model.vo.HomeInfo;
import com.qfw.common.util.MobileUtil;
import com.qfw.model.bo.BizProductBO;
import com.qfw.platform.cache.CacheManager;

/**
 * 首页
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/")
public class IndexAction extends BaseAction {

	@Resource(name = "loanManageBS")
	private ILoanManageBS loanManageBS;
	
	@Resource(name = "productInfoBS")
	private IProductInfoBS productInfoBS;    //产品信息

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		setCommonData(request);
		BizProductBO bizProductBO = new BizProductBO();// TODO
		try {
			bizProductBO = productInfoBS.findProductInfoById(1);
		} catch (BizException e1) {
			e1.printStackTrace();
		}
		HomeInfo homeInfo = CacheManager.getInstance().getHomeInfo();
		setAttribute(request,"leastRateYear",bizProductBO.getLeastRateYear());
		setAttribute(request,"mostRateYear",bizProductBO.getMostRateYear());
		setAttribute(request,"creditorRight",homeInfo.getCreditorRight());
		setAttribute(request,"custCount",homeInfo.getCustCount());
		setAttribute(request,"loanAmount",homeInfo.getLoanAmount());
		setAttribute(request,"loanOverdue",homeInfo.getLoanOverdue());
		setAttribute(request,"loanSettle",homeInfo.getLoanSettle());
		setAttribute(request,"transactionAmount",homeInfo.getTransactionAmount());
		if(StringUtils.isEmpty(homeInfo.getOverdueRateStr())
				|| "0".equals(homeInfo.getOverdueRateStr())){
			setAttribute(request,"overdueRateStr","0");
		}else{
			setAttribute(request,"overdueRateStr",homeInfo.getOverdueRateStr()+"%");
		}
		
		setAttribute(request,"tradeTime",homeInfo.getTradeTime());
		setAttribute(request,"loanTime",homeInfo.getLoanTime());
//		setAttribute(request, "errMes", request.getParameter("errMes"));
		if(MobileUtil.JudgeIsMoblie(request)){
			return getResultPath(MOBILE_INDEX);
		}
		return getResultPath("INDEX");
		
	}
}
