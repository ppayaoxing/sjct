<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>用户中心-首页-sjct888.com</title>
<!-- pc端 个人信息设置 -->
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=1349">
<#include "/common/resource.ftl">
</head>
<body>
	<div style="min-width: 1349px; margin: 0 auto; max-width: 1400px">
		<#include "/common/header.ftl">
		<div class="wapper">
			<div class="main">
				<div class="user_panel">
					<#include "/common/left.ftl">
					<div class="right">
						<div class="tab_table_N creditor auto_css">
							<div class="nav">
								<ul>
									<li class="current"><a href="javascript:void(0);">个人信息设置</a></li>
								</ul>
							</div>

							<div class="clear"></div>
							<div class="repayment">
								<div class="row row1">
									<div class="col col1">
										<i></i>昵称
									</div>
									<div class="col col2"><#if
										userSecurity.nickName?exists>已设置<#else>未设置</#if></div>
									<div class="col col3">${userSecurity.nickName}</div>
								</div>
								<div class="clear"></div>
								<hr class="line">
								<div class="row row1">
									<div class="col col1">
										<i></i>实名认证
									</div>
									<#if userSecurity.realName?? && userSecurity.idCard?? &&
									userSecurity.realName != "" && userSecurity.idCard != "">
									<div class="col col2">
										<span>${userSecurity.showRealName}</span>
									</div>
									<div class="col col3">
										<span>${userSecurity.showIdCard}</span>
									</div>
									<#else>
									<div class="col col2">
										<span style="color: #ffb23f;">未设置</span>
									</div>
									<div class="col col3">
										<a id="authRealNameSetBtn" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && errorMsg.type
											== 1)>设置<#else>取消设置</#if></a>
									</div>
									</#if>
								</div>
								<hr class="line">
								<div class="row row2">
									<div class="col col1">
										<i></i>出生日期
									</div>
									<div class="col col2">
										<span>${userSecurity.birthDate}</span>
									</div>
								</div>
								<div class="clear"></div>
								<hr class="line">
								<div class="pg-account-security" name="authRealNameSetDiv"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									" && errorMsg.type==0)>display:none;</#if>">
                        <div class="content">
                            <form action="${base}/userSecurity/realNameAuth.do" class="ui-form" method="post" id="authForm" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>真实姓名</label>
                                        <input  name="realname" type="text" class="ui-input" data-rule="真实姓名:required;" placeholder="请输入真实姓名">
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>身份证号码</label>
                                        <input name="idcard" type="text" class="ui-input" placeholder="请输入身份证号码">
                                        <span id="realNameAuthMsg" class="form-msg">
                                            <span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 0>${errorMsg.msg}</#if></span>
                                        </span>
                                    </div>
                                    
                                    <div class="ui-form-item">
                                        <input id="subModPswBt" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="row row3">
									<div class="col col1">
										<i></i>登录密码
									</div>
									<div class="col col2">已设置</div>
									<div class="col col3">
										<a id="loginPasswordBtn" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && errorMsg.type
											== 1)>修改<#else>取消修改</#if></a>
									</div>
								</div>
								<div class="clear"></div>
								<hr class="line">
								<div class="pg-account-security" name="loginPasswordDiv"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==1)>display:none;</#if>">
                        <div class="content">
                            <p class="info">为了您的账户安全，请定期更换登录密码，并确保登录密码设置与提现密码不同。</p>
                            <form action="${base}/userSecurity/modifyLoginPasswd.do" class="ui-form" method="post" id="modifyLoginPasswdForm" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>原密码</label>
                                        <input id="oldPassword" name="oldPassword" class="ui-input" data-rule="原密码:required;" placeholder="请输入原登录密码" type="password">
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>新密码</label>
                                        <input id="newPassword" name="newPassword" class="ui-input" data-rule="新密码:required;match[neq, oldPassword];" placeholder="6-12位字母、数字和符号(不包括空格)" data-is="isPassWord" type="password">
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>确认新密码</label>
                                        <input id="newPassword2" name="newPassword2" class="ui-input" data-rule="确认新密码:required;match(newPassword);" placeholder="请再次输入您的新密码" onpaste="return false" type="password">
                                    	<span id="loginPasswdMsg" class="form-msg">
                                            <span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 1>${errorMsg.msg}</#if></span>
                                        </span>
                                    </div>
                                    <div class="ui-form-item">
                                        <input id="subModPswBtn" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="row row4" style="display: none">
									<div class="col col1">
										<i></i>绑定邮箱
									</div>
									<#if userSecurity.email?? && userSecurity.email != "">
									<div class="col col2">
										<span>${userSecurity.email}</span>
									</div>
									<div class="col col3">
										<a id="UnBingEmailBtn" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && errorMsg.type
											== 2)>解绑<#else>取消解绑</#if></a>
									</div>
									<#else>
									<div class="col col2">
										<span style="color: #ffb23f;">未绑定邮箱</span>
									</div>
									<div class="col col3">
										<a id="BingEmailBtn" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && errorMsg.type
											== 2)>绑定<#else>取消绑定</#if></a>
									</div>
									</#if>
								</div>
								<div class="clear"></div>
								<hr class="line">
								<div class="pg-account-security" name="modifyMailDiv"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==2)>display:none;</#if>">
                        <div class="content">
                            <form action="${base}/userSecurity/operEmail.do" class="ui-form" method="post" id="modPswForm" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>邮箱</label>
                                        <#if userSecurity.email?? && userSecurity.email != "">
                                           <span>${userSecurity.email}</span>
                                           <input id="email" name="email" class="ui-input"  type="hidden" value="${userSecurity.email}" >
                                           <input id="emailMode" name="emailMode" class="ui-input" value="2" type="hidden" >
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 2>${errorMsg.msg}</#if></span>
                                        	</span>
                                        <#else>
                                           <input id="email" name="email" class="ui-input" placeholder="请输入邮箱" data-rule="邮箱:required;email;" type="text" >
                                           <input id="emailMode" name="emailMode" class="ui-input" value="1" type="hidden" >
                                           <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 2>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </#if>
                                    </div> 
                                    <div class="ui-form-item">
                                      <#if userSecurity.email?? && userSecurity.email != "">
                                        <input id="UnEmailBtn" value="解绑" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                      <#else> 
                                      	<input id="EmailBtn" value="绑定邮箱" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                       </#if>
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="row row5">
									<div class="col col1">
										<i></i>绑定手机
									</div>
									<#if userSecurity.showTel?? && userSecurity.showTel != "">
									<div class="col col2">
										<span>${userSecurity.showTel}</span>
									</div>
									<!-- 		                        <div class="col col3"> -->
									<!-- 		                        	<a id="modifyMobileBtn1" href="javascript:void(0);"> -->
									<!-- 		                        	<#if !(errorMsg.msg?exists && errorMsg.msg != "" && (errorMsg.type == 3 || errorMsg.type == 5 || errorMsg.type == 6))>修改<#else>取消修改</#if></a> -->
									<!-- 		                        </div> -->
									<#else>
									<div class="col col2">
										<span style="color: #ffb23f;">未绑定</span>
									</div>
									<div class="col col3">
										<a id="modifyMobileBtn2" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && (errorMsg.type
											== 3 || errorMsg.type == 5 || errorMsg.type ==
											6))>绑定<#else>取消绑定</#if></a>
									</div>
									</#if>
								</div>
								<div class="pg-account-security" name="modifyMobileDiv1"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && (errorMsg.type== 5 || errorMsg.type==6))>display:none;</#if>">
                        <div class="content" >
                                <div style="height:100px"><div class="safety_step">
	                                      <div class="bgline">
	                                      </div>
                                        <div class="threeStep steps">
                                            <ul class="fn-clear">
                                                <li class="one">验证原手机号码</li>
                                                <li class="no">验证新手机号码</li>
                                                <li class="no">成功</li>
                                            </ul>
                                        </div>
                                    </div>
                         </div>
                                <form  id="modifyPhone" method="post" action="${base}/userSecurity/modifyPhone.do" class="ui-form"  autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                    <div class="inputs" name="oneStepDiv" style="<#if errorMsg.msg?exists && errorMsg.msg != ""  && errorMsg.type == 6>display:none;</#if>">
                                        <div class="ui-form-item clearboth">
                                            <label class="ui-label">原手机号码</label> <span>${userSecurity.showTel}</span>
                                        </div>
                                        <div class="ui-form-item">
                                            <label class="ui-label"><span class="ui-form-required">*</span>手机验证码</label>
                                            <input class="ui-input code" id="authCode1"  name="authCode1" value="${authCode1}" placeholder="6位验证码" data-rule="手机验证码:required;" type="text">
                                            <input type="button" id="getAuthCodeBtn1" class="btn btn-primary" value="获取验证码"/>
                                            <span class="msg-box n-right" for="authCode1"></span>
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 5>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </div>
                                     	<div class="ui-form-item">
                                			<span id="mobileMsg1" style="color: #FF0000;"></span>
                                        </div>
                                        <div class="ui-form-item">
                                              <input value="下一步" id="nextStepButt" class="ui-button ui-button-blue ui-button-mid" type="button">
                                        </div>	
                                    </div>
                                    
                                    <div class="inputs" name="nextStepDiv"  style="<#if !(errorMsg.msg?exists && errorMsg.msg != ""  && errorMsg.type == 6)>display:none;</#if>">
                                        <div class="ui-form-item clearboth">
                                            <label class="ui-label"><span class="ui-form-required">*</span>新手机号码：</label> 
                                            <input class="ui-input code" name="mobile2" id="mobile2" type="text"  placeholder="请输入手机号" data-rule="新手机号码:required; mobile;">
                                        </div>
                                        
                                        <div class="ui-form-item">
                                            <label class="ui-label"><span class="ui-form-required">*</span>手机验证码：</label> 
                                            <input class="ui-input code" name="authCode2" id="authCode2" value="" type="text"  placeholder="6位验证码" data-rule="验证码:required;length[6];">
                                            <input type="button" id="getAuthCodeBtn2" class="btn btn-primary" value="获取验证码"/>
                                            <span class="msg-box n-right" for="authCode2"></span>
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 6>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </div>
                                        <div class="ui-form-item">
                                			<span id="mobileMsg2" style="color: #FF0000;"></span>
                                        </div>
                                        <div class="ui-form-item">
                                            <input value="提交" id="modifyButt" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                        </div>	
                                    </div>
                                </form>
                        </div>	
					         </div>
								<div class="pg-account-security" name="modifyMobileDiv2"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==3)>display:none;</#if>">
                        <div class="content">
                            <p class="info">绑定手机号码</p>
                            <form action="${base}/userSecurity/bindPhone.do" class="ui-form" method="post" id="modifyLoginPasswdForm" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>手机号码</label>
                                        <input id="mobile3" name="mobile3" class="ui-input" data-rule="手机号码:required;mobile;" placeholder="请输入手机号码" type="text">
                                    </div>
                                    <div class="ui-form-item">
                                            <label class="ui-label"><span class="ui-form-required">*</span>手机验证码：</label> 
                                            <input class="ui-input code" name="authCode3" id="authCode3" value="" type="text"  placeholder="6位验证码" data-rule="验证码:required;length[6];">
                                            <input type="button" id="getAuthCodeBtn3" class="btn btn-primary" value="获取验证码"/>

                                        <span class="msg-box n-right" for="authCode3"></span>
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 3>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </div>
                                        <div class="ui-form-item">
                                			<span id="mobileMsg3" style="color: #FF0000;"></span>
                                        </div>
                                        
                                    <div class="ui-form-item">
                                        <input id="subModPswBtn" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="clear"></div>
								<hr class="line">
								<div class="row row6">
									<div class="col col1">
										<i></i>交易密码
									</div>
									<#if userSecurity.cashPassword?? && userSecurity.cashPassword
									!= "">
									<div class="col col2">
										<span>已设置</span>
									</div>
									<div class="col col3">
										<a id="modifycashPassword1" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && (errorMsg.type
											== 4 || errorMsg.type == 7 || errorMsg.type ==
											8))>修改<#else>取消修改</#if></a> &nbsp;|&nbsp;<a
											id="modifycashPassword2" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && (errorMsg.type
											== 4 || errorMsg.type == 7 || errorMsg.type ==
											8))>找回密码<#else>取消找回密码</#if></a>
									</div>
									<#else>
									<div class="col col2">
										<span style="color: #ffb23f;">未绑定</span>
									</div>
									<div class="col col3">
										<a id="modifycashPassword3" href="javascript:void(0);"><#if
											!(errorMsg.msg?exists && errorMsg.msg != "" && (errorMsg.type
											== 4 || errorMsg.type == 7 || errorMsg.type ==
											8))>设置<#else>取消设置</#if></a>
									</div>
									</#if>
								</div>
								<div class="clear"></div>

								<div class="pg-account-security" name="modifyCashPasswordDiv1"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==7)>display:none;</#if>">
                        <div class="content">
                            <form action="${base}/userSecurity/modifyCashPassword.do" class="ui-form" method="post" id="modPswForm" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>老交易密码</label>
                                        <input id="oldCashPassword" name="oldCashPassword" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" type="password" data-rule="密码:required;" >
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>新交易密码</label>
                                        <input id="newCashPassword" name="newCashPassword" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" type="password" data-rule="新密码:required;match[neq, oldCashPassword];length[6]" >
                                    </div>
                                    
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>确认交易密码</label>
                                        <input id="newCashPassword1" name="newCashPassword1" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" type="password" data-rule="确认交易密码:required;match(newCashPassword);length[6]">
                                    	<span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 7>${errorMsg.msg}</#if></span>
                                       </span>
                                    </div>
                                    <div class="ui-form-item">
                                        <input id="subModPswBt" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="pg-account-security" name="modifyCashPasswordDiv2"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==8)>display:none;</#if>">
                        <div class="content">
                            <form  action="${base}/userSecurity/findCashPwd.do" class="ui-form" method="post" id="findCashPwd" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>身份证</label>
                                        <input id="certNo" name="certNo" class="ui-input" placeholder="18位身份证" type="text">
                                    </div>
                                     <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>新交易密码</label>
                                        <input id="newCashPassword4" name="newCashPassword4" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" type="password" data-rule="密码:required;length[6];" >
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>确认交易密码</label>
                                        <input id="confirmPassword4" name="confirmPassword4" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" data-rule="确认交易密码:required;confirmPassword;match(newCashPassword4);length[6];" type="password">
                                    </div>
                                     <div class="ui-form-item">
                                            <label class="ui-label"><span class="ui-form-required">*</span>手机验证码：</label> 
                                            <input class="ui-input code" name="authCode5" id="authCode5" value="" type="text"  placeholder="6位验证码" data-rule="验证码:required;length[6];">
                                            <input type="button" id="getAuthCodeBtn5" class="btn btn-primary" value="获取验证码"/>
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 8>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </div>
                                    	<div class="ui-form-item">
                                			<span id="mobileMsg5" style="color: #FF0000;"></span>
                                        </div>
                                    <div class="ui-form-item">
                                        <input id="subModPswBt" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
								<div class="pg-account-security" name="modifyCashPasswordDiv3"
									style="<#if !(errorMsg.msg?exists && errorMsg.msg != "
									"  && errorMsg.type==4)>display:none;</#if>">
                        <div class="content">
                            <form action="${base}/userSecurity/bindCashPassword.do" class="ui-form" method="post"  autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                                <div class="inputs">
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>交易密码</label>
                                        <input id="cashPassword3" name="cashPassword3" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" data-rule="密码:required;length[6];" type="password">
                                    </div>
                                    <div class="ui-form-item">
                                        <label class="ui-label"><span class="ui-form-required">*</span>确认交易密码</label>
                                        <input id="confirmPassword3" name="confirmPassword3" class="ui-input" placeholder="6-12位字母、数字和符号(不包括空格)" data-rule="确认交易密码:required;confirmPassword;match(cashPassword3);length[6];" type="password">
                                    </div>
                                    <div class="ui-form-item">
                                            <label class="ui-label"><span class="ui-form-required">*</span>手机验证码：</label> 
                                            <input class="ui-input code" name="authCode4" id="authCode4" value="" type="text"  placeholder="6位验证码" data-rule="验证码:required;length[6];">
                                         <span  class="msg-box n-right" for="authCode4" style="left:110px;"></span>
                                            <input type="button" id="getAuthCodeBtn4" class="btn btn-primary" value="获取验证码"/>
                                            <span id="loginPasswdMsg" class="form-msg">
                                            	<span class="warn"><#if errorMsg.msg?exists && errorMsg.type == 4>${errorMsg.msg}</#if></span>
                                        	</span>
                                        </div>
                                    	<div class="ui-form-item">
                                			<span id="mobileMsg4" style="color: #FF0000;"></span>
                                        </div>
                                    <div class="ui-form-item">
                                        <input id="subModPswBt" value="提 交" class="ui-button ui-button-blue ui-button-mid" type="submit">
                                    </div>	
                              </div>
                          </form>
                      </div>	
                  </div>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div style="margin: 0 auto"><#include "/common/footer.ftl"></div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#authForm').validator({
				rules : {
					idcard : function(element, param, field) {
						return isIdCardNo(element.value) || '请正确输入您的身份证号码';
					}
				},

				fields : {
					idcard : '身份证号码:required;idcard;'
				}
			});

			$('#findCashPwd').validator({
				rules : {
					idcard : function(element, param, field) {
						return isIdCardNo(element.value) || '请正确输入您的身份证号码';
					}
				},

				fields : {
					certNo : '身份证号码:required;idcard;'
				}
			});

		});
		// 隐藏所有
		function hideAll(type) {
			$("span[class='form-msg']").hide();
			if (type != 0) {
				$("#authRealNameSetBtn").html("设置");
				$("div[name='authRealNameSetDiv']").hide();
			}

			if (type != 1) {
				$("#loginPasswordBtn").html("修改");
				$("div[name='loginPasswordDiv']").hide();
			}

			if (type != 2) {
				$("#UnBingEmailBtn").html("解绑");
				$("#BingEmailBtn").html("绑定");
				$("div[name='modifyMailDiv']").hide();
			}

			if (type != 3) {
				$("#modifyMobileBtn2").html("绑定");
				$("div[name='modifyMobileDiv2']").hide();
			}

			if (type != 4) {
				$("#modifycashPassword3").html("设置");
				$("div[name='modifyCashPasswordDiv3']").hide();
			}

			if (type != 5) {
				$("#modifyMobileBtn1").html("修改");
				$("div[name='modifyMobileDiv1']").hide();
			}

			if (type != 7) {
				$("#modifycashPassword1").html("修改");
				$("div[name='modifyCashPasswordDiv1']").hide();
			}

			if (type != 8) {
				$("#modifycashPassword2").html("找回密码");
				$("div[name='modifyCashPasswordDiv2']").hide();
			}
		}

		$("#authRealNameSetBtn").click(function() {
			hideAll(0);
			if ($(this).html() == "设置") {
				$(this).html("取消设置");
				$("div[name='authRealNameSetDiv']").show();
			} else {
				$(this).html("设置");
				$("div[name='authRealNameSetDiv']").hide();
			}
		});

		$("#loginPasswordBtn").click(function() {
			hideAll(1);
			if ($(this).html() == "修改") {
				$(this).html("取消修改");
				$("div[name='loginPasswordDiv']").show();
			} else {
				$(this).html("修改");
				$("div[name='loginPasswordDiv']").hide();
			}
		});

		$("#modifyMailBtn").click(function() {
			hideAll(2);
			if ($(this).html() == "修改") {
				$(this).html("取消修改");
				$("div[name='modifyMailDiv']").show();
			} else {
				$(this).html("修改");
				$("div[name='modifyMailDiv']").hide();
			}
		});

		$("#modifyMobileBtn1").click(function() {
			hideAll(5);
			if ($(this).html() == "修改") {
				$(this).html("取消修改");
				$("div[name='modifyMobileDiv1']").show();
			} else {
				$(this).html("修改");
				$("div[name='modifyMobileDiv1']").hide();
			}
		});

		$("#modifyMobileBtn2").click(function() {
			hideAll(3);
			if ($(this).html() == "绑定") {
				$(this).html("取消绑定");
				$("div[name='modifyMobileDiv2']").show();
			} else {
				$(this).html("绑定");
				$("div[name='modifyMobileDiv2']").hide();
			}
		});

		$("#UnBingEmailBtn").click(function() {
			hideAll(2);
			if ($(this).html() == "解绑") {
				$(this).html("取消解绑");
				$("div[name='modifyMailDiv']").show();
			} else {
				$(this).html("解绑");
				$("div[name='modifyMailDiv']").hide();
			}
		});

		$("#BingEmailBtn").click(function() {
			hideAll(2);
			if ($(this).html() == "绑定") {
				$(this).html("取消绑定");
				$("div[name='modifyMailDiv']").show();
			} else {
				$(this).html("绑定");
				$("div[name='modifyMailDiv']").hide();
			}
		});

		$("#modifycashPassword1").click(function() {
			hideAll(7);
			if ($(this).html() == "修改") {
				$(this).html("取消修改");
				$("div[name='modifyCashPasswordDiv1']").show();
			} else {
				$(this).html("修改");
				$("div[name='modifyCashPasswordDiv1']").hide();
			}
		});

		$("#modifycashPassword2").click(function() {
			hideAll(8);
			if ($(this).html() == "找回密码") {
				$(this).html("取消找回密码");
				$("div[name='modifyCashPasswordDiv2']").show();
			} else {
				$(this).html("找回密码");
				$("div[name='modifyCashPasswordDiv2']").hide();
			}
		});

		$("#modifycashPassword3").click(function() {
			hideAll(4);
			if ($(this).html() == "设置") {
				$(this).html("取消设置");
				$("div[name='modifyCashPasswordDiv3']").show();
			} else {
				$(this).html("设置");
				$("div[name='modifyCashPasswordDiv3']").hide();
			}
		});

		$("#getAuthCodeBtn1").click(function() {
			var mobile = $("#mobile1").val();
			sendAuthMessageForUser();
			var waitTime = 60;
			time(this, waitTime);
		});

		$("#getAuthCodeBtn2").click(function() {
			var mobile = $("#mobile2").val();
			if (mobile == "") {
				var mobileMsgSpan = $("#mobileMsg2");
				mobileMsgSpan.html("请先输入手机号");
				return false;
			}
			sendAuthMessage(mobile);
			var waitTime = 60;
			time(this, waitTime);
		});

		$("#getAuthCodeBtn3").click(function() {
			var mobile = $("#mobile3").val();
			if (mobile == "") {
				var mobileMsgSpan = $("#mobileMsg3");
				mobileMsgSpan.html("请先输入手机号");
				return false;
			}
			sendAuthMessage(mobile);
			var waitTime = 60;
			time(this, waitTime);
		});

		$("#getAuthCodeBtn4").click(function() {
			sendAuthMessageForUser();
			var waitTime = 60;
			time(this, waitTime);
		});

		$("#getAuthCodeBtn5").click(function() {
			sendAuthMessageForUser();
			var waitTime = 60;
			time(this, waitTime);
		});

		$("#nextStepButt")
				.click(
						function() {
							var authCode = $("#authCode1").val();
							var mobileMsgSpan = $("#mobileMsg1");
							if (authCode == "") {
								mobileMsgSpan.html("请输入验证码！");
								return false;
							}
							$
									.ajax({
										type : "POST",
										url : "checkAuthCode.do",
										dataType : "json",
										data : "authCode1=" + authCode,
										complete : function(XMLHttpRequest,
												textStatus) {
											if (XMLHttpRequest.status == 535) {
												//如果超时就处理 ，指定要跳转的页面 
												dialog(
														{
															title : "提醒信息",
															content : "登陆超时，请重新登陆！",
															okvalue : "确定",
															ok : function() {
																window.location
																		.replace("${base}/loginAction/login.do");
															},
															onclose : function() {
																window.location
																		.replace("${base}/loginAction/login.do");
															}
														}).showModal();
											}
										},
										success : function(data) {
											if (data.status == 0) {
												$("div[name='oneStepDiv']")
														.hide();
												$("div[name='nextStepDiv']")
														.show();
											} else {
												var errMsg = data.message;
												var mobileMsgSpan = $("#mobileMsg1");
												mobileMsgSpan.html(errMsg);
												//alert(errMsg);
											}
										},
										error : function(text) {
											//alert('请求后台出错.');
										}
									});
						});

		var wait = 60;
		function time(o, waitTime) {

			if (waitTime == 60) {
				wait = waitTime;
			}
			if (wait == 0) {
				o.removeAttribute("disabled");
				o.value = "再次获取验证码";
				wait = 60;
			} else {
				o.setAttribute("disabled", true);
				o.value = wait + "秒后可以重新发送";
				--wait;
				setTimeout(function() {
					time(o, wait)
				}, 1000)
			}
		}

		function sendAuthMessage(phone) {
			var mobile = phone;
			//alert(mobile);
			$
					.ajax({
						type : "POST",
						url : "ajaxSendAuthMessage.do",
						dataType : "json",
						data : "mobile=" + mobile,
						complete : function(XMLHttpRequest, textStatus) {
							if (XMLHttpRequest.status == 535) {
								//如果超时就处理 ，指定要跳转的页面 
								dialog(
										{
											title : "提醒信息",
											content : "登陆超时，请重新登陆！",
											okvalue : "确定",
											ok : function() {
												window.location
														.replace("${base}/loginAction/login.do");
											},
											onclose : function() {
												window.location
														.replace("${base}/loginAction/login.do");
											}
										}).showModal();
							}
						},
						success : function(data) {
						},
						error : function(text) {
							alert('发送短信失败.');
						}
					});
		}

		function sendAuthMessageForUser() {
			$
					.ajax({
						type : "POST",
						url : "ajaxSendAuthMessageForUser.do",
						dataType : "json",
						complete : function(XMLHttpRequest, textStatus) {
							if (XMLHttpRequest.status == 535) {
								//如果超时就处理 ，指定要跳转的页面 
								dialog(
										{
											title : "提醒信息",
											content : "登陆超时，请重新登陆！",
											okvalue : "确定",
											ok : function() {
												window.location
														.replace("${base}/loginAction/login.do");
											},
											onclose : function() {
												window.location
														.replace("${base}/loginAction/login.do");
											}
										}).showModal();
							}
						},
						success : function(data) {
						},
						error : function(text) {
							alert('发送短信失败.');
						}
					});
		}
	</script>
</body>
</html>