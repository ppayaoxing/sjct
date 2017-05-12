package com.qfw.platform.cache;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.jfree.util.Log;

import com.qfw.bizservice.count.ICountBS;
import com.qfw.common.bizservice.ICodeDictBS;
import com.qfw.common.exception.BizException;
import com.qfw.common.model.SysCodeDict;
import com.qfw.common.model.vo.HomeInfo;
import com.qfw.model.AppConst;
import com.qfw.platform.model.bo.CmsFriendLink;
import com.qfw.platform.model.bo.CmsNavigation;
import com.qfw.platform.service.ICmsFriendlinkService;
import com.qfw.platform.service.ICmsNavigationService;

/**
 * 缓存管理器
 * 
 * @author Administrator
 * 
 */
public class CacheManager {

	private ICodeDictBS codeDictBS;

	private ICmsFriendlinkService cmsFriendlinkService;
	
	private ICmsNavigationService cmsNavigationService;
	
	private ICountBS countBS;
	

	/**
	 * 数据字典Map
	 */
	private static Map<String, List<SysCodeDict>> sysCodeDictMap = new ConcurrentHashMap<String, List<SysCodeDict>>();
	
	private static HomeInfo homeInfo = new HomeInfo();

	/**
	 * 友情链接
	 */
	private List<CmsFriendLink> friendLinkList = null;
	
	/**
	 * 前台轮播图片
	 */
	private List<CmsFriendLink> carouselList = null;
	
	private List<CmsNavigation> topNavigationList = null;
	
	private List<CmsNavigation> bottomNavigationList = null;
	
	private static CacheManager instance = new CacheManager();

	public CacheManager() {
	}
	
	public static CacheManager getInstance() {
		return instance;
	}
	
	public void setCodeDictBS(ICodeDictBS codeDictBS) {
		this.codeDictBS = codeDictBS;
		refreshCodeDict();
	}
	
	public void setCountBS(ICountBS countBS) {
		this.countBS = countBS;
		refreshHomeInfo();
	}

	public void setCmsFriendlinkService(
			ICmsFriendlinkService cmsFriendlinkService) {
		this.cmsFriendlinkService = cmsFriendlinkService;
		refreshFriendlink();
	}
	
	public void setCmsNavigationService(
			ICmsNavigationService cmsNavigationService) {
		this.cmsNavigationService = cmsNavigationService;
		refreshNavigationList();
	}

	/**
	 * 刷新数据字典
	 */
	public void refreshCodeDict() {
		List<SysCodeDict> sysCodeDictList = codeDictBS.findAllSysCodeDicts();
		Map<String, List<SysCodeDict>> tmpSysCodeDictMap = new HashMap<String, List<SysCodeDict>>();
		if (null != sysCodeDictList && !sysCodeDictList.isEmpty()) {
			for (SysCodeDict sysCodeDict : sysCodeDictList) {
				if (null != sysCodeDict) {
					String codeType = sysCodeDict.getCodeType();
					List<SysCodeDict> tmpSysCodeDictList = tmpSysCodeDictMap
							.get(codeType);
					if (null == tmpSysCodeDictList) {
						tmpSysCodeDictList = new ArrayList<SysCodeDict>();
						tmpSysCodeDictMap.put(codeType, tmpSysCodeDictList);
					}
					tmpSysCodeDictList.add(sysCodeDict);
				}
			}
		}

		if (null != tmpSysCodeDictMap && !tmpSysCodeDictMap.isEmpty()) {
			sysCodeDictMap = tmpSysCodeDictMap;
		}
	}
	
	public void refreshHomeInfo() {
		try {
			int custCount = countBS.countCust();//会员总数
			BigDecimal transactionAmount = countBS.sumCreditorRight();//交易金额
			BigDecimal loanAmount = countBS.sumLoan(null);//借贷金额
			BigDecimal loanSettle = countBS.sumLoan(AppConst.LOAN_STATUS_CD_JQ);//借贷金额
			int loanOverdue = countBS.countLoan(AppConst.LOAN_STATUS_CD_YQ);//借款逾期
			int creditorRight = countBS.countCreditorRight();//出借人次
			int loan = countBS.countLoan(null);//借贷人次
			float loanOverdueFloat = loanOverdue;
			float loanFloat = loan;
			String overdueRateStr = "0";
			if(loanOverdue > 0){
				BigDecimal overdueRate = new BigDecimal(loanOverdueFloat / loanFloat * 100).setScale(1, BigDecimal.ROUND_HALF_UP);//逾期率
				overdueRateStr = overdueRate.toString();
			}
			homeInfo.setCreditorRight(String.valueOf(creditorRight));
			homeInfo.setCustCount(String.valueOf(custCount));
			homeInfo.setLoanAmount(amountDeal(loanAmount));
			homeInfo.setLoanOverdue(String.valueOf(loanOverdue));
			homeInfo.setLoanSettle(amountDeal(loanSettle));
			homeInfo.setOverdueRateStr(overdueRateStr);
			homeInfo.setTransactionAmount(amountDeal(transactionAmount));
			homeInfo.setTradeTime(String.valueOf(creditorRight+loan));
			homeInfo.setLoanTime(String.valueOf(loan));
//			HttpSession session = ViewOper.getSession();
//			session.setAttribute("homeInfo", homeInfo);
		} catch (BizException e) {
			Log.error("首页统计信息初始化异常"+e.getMessage());
		}
	}
	
	private String amountDeal(BigDecimal amount){
		if(amount == null
				|| amount.compareTo(BigDecimal.ZERO) == 0){
			return "0";
		}
		return amount.divide(new BigDecimal(10000)).setScale(2,BigDecimal.ROUND_HALF_UP).toString();
	}

	/**
	 * 刷新友情链接
	 * 首页轮播图片
	 */
	public void refreshFriendlink() {
		friendLinkList = cmsFriendlinkService.getFriendLinkList();
		carouselList =cmsFriendlinkService.getCarouselList();
	}

	
	/**
	 * 刷新导航栏
	 */
	public void refreshNavigationList() {
		topNavigationList = cmsNavigationService.getTopNavigationList();
		bottomNavigationList = cmsNavigationService.getBottomNavigationList();
	}

	public String getDisPlayNameByCodeTypeAndVal(String codeType,
			String codeValue) {
		if (StringUtils.isEmpty(codeType) || StringUtils.isEmpty(codeValue))
			return null;
		List<SysCodeDict> tmpSysCodeDictList = sysCodeDictMap.get(codeType);
		if (null != tmpSysCodeDictList && !tmpSysCodeDictList.isEmpty()) {
			for (SysCodeDict sysCodeDict : tmpSysCodeDictList) {
				String tmpCodeVal = sysCodeDict.getCodeValue();
				if (codeValue.equals(tmpCodeVal)) {
					return sysCodeDict.getDisplayValue();
				}
			}
		}
		return null;
	}
	
	public List<SysCodeDict> getCodeList(String codeType) {
		if (StringUtils.isEmpty(codeType))
			return null;
		List<SysCodeDict> tmpSysCodeDictList = sysCodeDictMap.get(codeType);
		return tmpSysCodeDictList;
	}
	
	/**
	 * 将Cd值替换成文字显示
	 * @param list
	 * @param changeColMap
	 * @return
	 */
	public List<Map<String,Object>> changeListDisplayName(List<Map<String,Object>> list,Map<String,String> changeColMap){
		String colVal = "";
		List<Map<String,Object>> newList = new ArrayList<Map<String,Object>>();
		
		for(Map<String,Object> map : list){
			Iterator iter = changeColMap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				String key = entry.getKey().toString();
				String val = entry.getValue().toString();
				
				colVal = map.get(key)==null?"":map.get(key).toString();
				if( !"".equals(colVal) ){
					map.remove(key);
					map.put(key, getDisPlayNameByCodeTypeAndVal(val,
							colVal));
				}
			}
			newList.add(map);
		}
		return newList;
	}
	
	/**
	 * 获取友情链接
	 * @return
	 */
	public List<CmsFriendLink> getFriendLinkList() {
		return friendLinkList;
	}

	public List<CmsNavigation> getTopNavigationList() {
		return topNavigationList;
	}

	public List<CmsNavigation> getBottomNavigationList() {
		return bottomNavigationList;
	}

	public List<CmsFriendLink> getCarouselList() {
		return carouselList;
	}

	public void setCarouselList(List<CmsFriendLink> carouselList) {
		this.carouselList = carouselList;
	}

	public HomeInfo getHomeInfo() {
		return homeInfo;
	}

	public void setHomeInfo(HomeInfo homeInfo) {
		CacheManager.homeInfo = homeInfo;
	}

}
