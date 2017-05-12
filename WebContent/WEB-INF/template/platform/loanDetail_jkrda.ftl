<head>
<script src="${base}/js/prefixfree.min.js"></script>
<style>
.gallery {
	width: 100%;
	margin: 30px auto;
	padding: 5px;
	/*background: #333;*/
}

.gallery>div {
	/*   position: relative; */
	/*   float: left; */
	/*   padding: 8px; */
	
}

.gallery>div>img {
	/*   width: 250px; */
	transition: .1s transform;
	transform: translateZ(0);
	/* hack */
}

.gallery>div:hover {
	z-index: 1;
}

.gallery>div:hover>img {
	transform: scale(2, 2);
	transition: .3s transform;
}

.cf:before, .cf:after {
	display: table;
	content: "";
	line-height: 0;
}

.cf:after {
	clear: both;
}

ul li img:hover {
	transform: scale(1.5, 1.5);
	transition: .3s transform;
}

ul li img:hover {
	z-index: 9999;
}
/* 证件档案 */
.bodyCon08 {
	background: url(../images/dy_pic11.jpg);
}

.bodyCon08 .students {
	margin: 0 auto;
	width: 1100px;
	height: 480px;
	position: relative;
}

.bodyCon08 .students p.PP {
	width: 510px;
	height: 50px;
	font-size: 16px;
	color: #333;
	text-align: center;
	position: absolute;
	top: 60px;
	left: 300px;
}

#four_flash {
	position: relative;
	width: 1100px;
	height: 400px;
	margin: 0 auto;
	bottom: 40px;
}

#four_flash .flashBg {
	width: 998px;
	height: 400px;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
}

#four_flash .flashBg ul.mobile {
	width: 2000%;
	height: 400px;
	position: absolute;
	top: 15;
	left: 0;
}

#four_flash .flashBg ul.mobile li {
	border: 10px solid #fff;
	float: left;
	width: 280px;
	height: 340px;
	margin-left: 26px;
	padding-top: 40px;
	color: #6C6E85;
}
/* #four_flash .flashBg ul.mobile li:hover{border:10px solid #343851; color:#fff;} */
#four_flash .flashBg ul.mobile li img {
	width: 140px;
	height: 140px;
	display: block;
	margin: 0 auto;
	border: 10px solid #fff;
}

#four_flash .flashBg ul.mobile li dd {
	font-size: 20px;
	width: 250px;
	line-height: 60px;
	text-align: center;
	border-bottom: 1px solid #6C6E85;
}

#four_flash .flashBg ul.mobile li p {
	font-size: 16px;
	text-align: center;
	width: 250px;
	line-height: 24px;
	margin-top: 10px;
}

#four_flash .flashBg ul.mobile li a {
	display: block;
	background: url(../images/jiantou.png);
	width: 31px;
	height: 31px;
	border: 0px;
	margin: 8px auto;
}
/* #four_flash .flashBg ul.mobile li a:hover{background:url(../images/jiantou2.png);} */
#four_flash .but_left {
	width: 50px;
	height: 100px;
	position: absolute;
	top: 136px;
	left: 0px;
}

#four_flash .but_right {
	width: 50px;
	height: 100px;
	position: absolute;
	top: 136px;
	right: 0px;
}

#four_flash .but_left:hover {
	background: url(../images/qianxleft1.png) no-repeat;
}

#four_flash .but_right:hover {
	background: url(../images/qianxr1.png) no-repeat;
}
</style>
</head>
<#--
<div id="loanDetailJkrda" class="bulk_user_content1">
	<div class="bulk_user_box">
		<h2>用户信息</h2>
		<div class="row">
			<div class="item">
				<span class="title">用户名</span><span class="value"><a
					href="javascript:void(0);">${loanDetailVO.userCode}</a></span>
			</div>
			<div class="item">
				<span class="title">年龄</span><span class="value">${customerDetailVO.age}</span>
			</div>

			<div class="item">
				<span class="title">学历</span><span class="value"><@sysCodeVal
					codeType='educationCd' codeValue='${customerDetailVO.educationCd}'
					/></span>
			</div>
		</div>

		<div class="row">
			<div class="item">
				<span class="title">婚姻状况</span><span class="value"><@sysCodeVal
					codeType='maritalStatusCd'
					codeValue='${customerDetailVO.maritalStatusCd}' /></span>
			</div>
			<div class="item">
				<span class="title">公司名称</span><span class="value">${customerDetailVO.jobCompanyName}</span>
			</div>
			<div class="item">
				<span class="title">公司性质</span><span class="value"><@sysCodeVal
					codeType='companyTypeCd'
					codeValue='${customerDetailVO.companyIndustryCd}'/></span>
			</div>
		</div>
		<div class="row">
			<div class="item">
				<span class="title">职位</span><span class="value"><@sysCodeVal
					codeType='jobPosition'
					codeValue='${customerDetailVO.jobPosition}'/></span>
			</div>
			<div class="item">
				<span class="title">所处部门</span><span class="value">${jobDeptName}</span>
			</div>
			<div class="item">
				<span class="title">月收入<span><span class="value"><@sysCodeVal
							codeType='jobIncomeCd'
							codeValue='${customerDetailVO.jobIncomeCd}' /></span>
			</div>
		</div>
	</div>
	<div class="bulk_user_box">
		<h2>信用档案</h2>
		<div class="row">
			<div class="item">
				<span class="title">信用等级</span><span class="value">${loanDetailVO.creditRate}</span>
			</div>
			<div class="item">
				<span class="title">信用额度</span><span class="value">${creditReportDetailVO.creditAmt}(元)</span>
			</div>
			<div class="item">
				<span class="title">剩余额度</span><span class="value">${creditReportDetailVO.remainAmt}(元)</span>
			</div>
		</div>
		<div class="row">
			<div class="item">
				<span class="title">借款总额</span><span class="value">${creditReportDetailVO.loanTolAmt}(元)</span>
			</div>
			<div class="item">
				<span class="title">借款余额</span><span class="value">${creditReportDetailVO.loanBal}(元)</span>
			</div>
			<div class="item">
				<span class="title">逾期金额</span><span class="value">${creditReportDetailVO.overdueAmt}(元)</span>
			</div>

		</div>
		<div class="row">
			<div class="item">
				<span class="title">申请笔数</span><span class="value">${creditReportDetailVO.applyLoanNum}</span>
			</div>

			<div class="item">
				<span class="title">成功笔数</span><span class="value">${creditReportDetailVO.approveNum}</span>
			</div>

			<div class="item">
				<span class="title">还清笔数</span><span class="value">${creditReportDetailVO.payOffNum}</span>
			</div>
		</div>
		<div class="row">
			<div class="item">
				<span class="title">逾期次数</span><span class="value">${creditReportDetailVO.overdueNum}</span>
			</div>
			<div class="item">
				<span class="title">严重逾期次数</span><span class="value">${creditReportDetailVO.serOverdueNum}</span>
			</div>
			<div class="item">&nbsp;</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="bulk_user_box">
		<h2>审核状态</h2>
		<table class="table">
			<thead>
				<tr>
					<th>认证项目</th>
					<th>认证状态</th>
					<th>通过日期</th>
				</tr>
			</thead>
			<tbody>
				<#list (authDetailVOList)! as list>
				<tr>
					<td><@sysCodeVal codeType='authItemCd'
						codeValue='${list.authItemCd}' /></td>
					<td><a href="javascript:void(0);"><img
							src="${base}/platform/img/big_fish.gif" align="absmiddle" /></a></td>
					<td>${list.sysCreateTime}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</div>
	<div class="bulk_user_box">
		<h2>借款描述</h2>
		<p><#if loanDetailVO.remark??>${loanDetailVO.remark}<#else></#if>
		</p>
	</div>
</div>
-->



<!--借款人档案 开始-->
<div class="new-info-box-two" id="load-info-one">
	<div class="info-title-one">
		<img src="${base}/platform/img/jibenxinxi.png" />
	</div>
	<div class="info-title-two">
	<#if customerDetailVO.custTypeCd == '1'>
		<table class="new-info-table">
			<tbody>
				<tr>
					<td>企业性质</td>
					<td><span class="value"><@sysCodeVal codeType='companyTypeCd'
							codeValue='${enterpriseDetailVO.type}' /></span></td>
					<td>成立年限</td>
					<td>${enterpriseDetailVO.duration}</td>
					<td>注册地址</td>
					<td>${enterpriseDetailVO.registerAddress}</td>
				</tr>
				<tr>
					<td>经营范围</td>
					<td>${enterpriseDetailVO.businessScope}</td>
					<td>主要债务</td>
					<td>${enterpriseDetailVO.debt}</td>
					<td>对外担保</td>
					<td><span class="value"><@sysCodeVal
							codeType='haveOrNot'
							codeValue='${enterpriseDetailVO.externalGuaranty}' /></td>
				</tr>
				<tr>
					<td>信用评级</td>
					<td>${enterpriseDetailVO.creditRate}</td>
				</tr>
			</tbody>
		</table>
		<#else>
		<table class="new-info-table">
			<tbody>
				<tr>
					<td>性别</td>
					<td><span class="value"><@sysCodeVal codeType='sex'
							codeValue='${customerDetailVO.sex}' /></span></td>
					<td>年龄</td>
					<td>${customerDetailVO.age}</td>
					<td>学历</td>
					<td><span class="value"><@sysCodeVal
							codeType='educationCd'
							codeValue='${customerDetailVO.educationCd}' /></span></td>
				</tr>
				<tr>
					<td>婚姻状况</td>
					<td><span class="value"><@sysCodeVal
							codeType='maritalStatusCd'
							codeValue='${customerDetailVO.maritalStatusCd}' /></span></td>
					<td>户籍</td>
					<td>${customerDetailVO.addressName}</td>
					<td>行业</td>
					<td><span class="value"><@sysCodeVal
							codeType='companyIndustryCd'
							codeValue='${customerDetailVO.companyIndustryCd}' /></td>
				</tr>
				<tr>
					<td>职位</td>
					<td><span class="value"><@sysCodeVal
							codeType='jobPosition'
							codeValue='${customerDetailVO.jobPosition}'/></span></td>
					<td>月收入</td>
					<td><span class="value"><@sysCodeVal
							codeType='jobIncomeCd'
							codeValue='${customerDetailVO.jobIncomeCd}' /></span></td>
					<td>是否购房</td>
					<td><span class="value"><@sysCodeVal
							codeType='whether'
							codeValue='${customerDetailVO.hasHouse}' /></td>
				</tr>
				<tr>
					<td>是否购车</td>
					<td><span class="value"><@sysCodeVal
							codeType='whether'
							codeValue='${customerDetailVO.hasCar}' /></td>
					<td>主要债务</td>
					<td>无</td>
					<td>信用评级</td>
					<td>${customerDetailVO.creditRate}</td>
				</tr>
			</tbody>
		</table>
		</#if>
	</div>
	<div class="info-title-one">
		<img src="${base}/platform/img/backgroundimg01.png" />
	</div>
	<div class="info-title-two">
		<table class="new-info-table">
			<tbody>
				<tr>
					<#--
					<td class="info-box-table-td">信用等级</td>
					<td><div class="info-box-lev">
							<span class="value"><img
								src="${base}/platform/img/xydj${loanDetailVO.creditRate}.png" /></span>
						</div></td> -->
					<td class="info-box-table-td">借款余额</td>
					<td>${creditReportDetailVO.loanBal?string(',##0.00')}(元)</td>
					<td class="info-box-table-td">还清笔数</td>
					<td>${creditReportDetailVO.payOffNum}</td>
				</tr>
				<tr>
					<#--
					<td>信用额度</td>
					<td>${creditReportDetailVO.creditAmt?string(',##0.00')}(元)</td> -->
					<td>逾期金额</td>
					<td>${creditReportDetailVO.overdueAmt?string(',##0.00')}(元)</td>
					<td>逾期次数</td>
					<td><span class="rednumber">${creditReportDetailVO.overdueNum}</span></td>
				</tr>
				<tr>
					<#--
					<td>剩余额度</td>
					<td>${creditReportDetailVO.remainAmt?string(',##0.00')}(元)</td> -->
					<td>申请笔数</td>
					<td>${creditReportDetailVO.applyLoanNum}</td>
					<td>严重逾期</td>
					<td><span class="rednumber">${creditReportDetailVO.serOverdueNum}</span></td>
				</tr>
				<tr>
					<td>借款总额</td>
					<td>${creditReportDetailVO.loanTolAmt?string(',##0.00')}(元)</td>
					<td>成功笔数</td>
					<td>${creditReportDetailVO.approveNum}</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<!--  证件档案 -->
		<div style="position: absolute; margin-left: -7.5%; z-index: 10000">
			<img src="${base}/images/zhengjianbackground.png" />
		</div>
		<#if (disclosureList)!>
		<div id="four_flash" style="top: 40px;">
			<div class="flashBg" style="margin-left: -100px;">
				<ul class="mobile">
					<#list (disclosureList)! as list>
					<li><img
						style="width: 200px; height: 280px; margin-left: 20px"
						src="${base}/${list.collateralAtt1}" /></li> </#list>
				</ul>
			</div>
			<div class="but_left" style="left: -86px;">
				<img src="${base}/images/qianxleft.png" />
			</div>
			<div class="but_right" style="right: 207px">
				<img src="${base}/images/qianxr.png" />
			</div>
		</div>
		<#else></#if>
	</div>
	<#if (disclosureList)!>
	<div class="info-con" style="margin-top: 35%">
		<img src="${base}/platform/img/backgroundimg02.png" />
	</div>
	<div class="info-con-tb-box">
		<table class="new-info-table2">
			<thead>
				<tr class="table-th-tr">
					<th>认证项目</th>
					<!--<th>认证详情</th>-->
					<th>认证状态</th>
					<th>通过日期</th>
				</tr>
			</thead>
			<tbody>
				<#list (authDetailVOList)! as list>
				<tr>
					<td><@sysCodeVal codeType='authItemCd'
						codeValue='${list.authItemCd}' /></td>
					<td><a href="javascript:void(0);"><img
							src="${base}/platform/img/big_fish.gif" align="absmiddle" /></a></td>
					<td>${list.sysCreateTime}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</div>
	<#else>
	<div class="info-con" style="margin-top: 7%">

		<img src="${base}/platform/img/backgroundimg02.png" />
	</div>
	<div class="info-con-tb-box">
		<table class="new-info-table2">
			<thead>
				<tr class="table-th-tr">
					<th>认证项目</th>
					<!--<th>认证详情</th>-->
					<th>认证状态</th>
					<th>通过日期</th>
				</tr>
			</thead>
			<tbody>
				<#list (authDetailVOList)! as list>
				<tr>
					<td><@sysCodeVal codeType='authItemCd'
						codeValue='${list.authItemCd}' /></td>
					<td><a href="javascript:void(0);"><img
							src="${base}/platform/img/big_fish.gif" align="absmiddle" /></a></td>
					<td>${list.sysCreateTime}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</div>
	</#if>
	<div class="info-con">
		<img src="${base}/platform/img/backgroundimg03.png" />
	</div>
	<div class="info-con-text-box">
		<p><#if loanDetailVO.remark??>${loanDetailVO.remark}<#else></#if>
		</p>
	</div>

</div>
<!--借款人档案 结束-->
<script type="text/javascript">
	//学员
	var _index5 = 0;
	$("#four_flash .but_right img").click(
			function() {
				_index5++;
				var len = $(".flashBg ul.mobile li").length;
				if (_index5 + 5 > len) {
					$("#four_flash .flashBg ul.mobile").stop().append(
							$("ul.mobile").html());
				}
				$("#four_flash .flashBg ul.mobile").stop().animate({
					left : -_index5 * 326
				}, 1000);
			});

	$("#four_flash .but_left img").click(function() {
		if (_index5 == 0) {
			$("ul.mobile").prepend($("ul.mobile").html());
			$("ul.mobile").css("left", "-1380px");
			_index5 = 6
		}
		_index5--;
		$("#four_flash .flashBg ul.mobile").stop().animate({
			left : -_index5 * 326
		}, 1000);
	});
</script>
