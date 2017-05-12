
<!DOCTYPE html>  <!--  注册 -->
<html lang="en">
<head>
<meta charset="utf-8">
<title>世纪创投</title>
 <meta name="viewport"content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no minimal-ui">
<meta name="description" content="">
<meta name="author" content="">
<link href="${base}/css/styleApp.css" rel="stylesheet" type="text/css">
<link href="${base}/css/loginAPP.css" rel="stylesheet" type="text/css">
<script src="${base}/js/jqueryAPP-1.8.3.min.js" type="text/javascript"></script> 
<#include "/common/resource.ftl">
<link rel="stylesheet" type="text/css" href="${base}/platform/bootstrap/css/style.css">
<link rel="stylesheet" type="text/css" href="${base}/platform/js/validator-0.7.3/jquery.validator.css">
<link rel="stylesheet" type="text/css" href="${base}/platform/bootstrap/css/pagination.css">
<link rel="stylesheet" href="${base}/platform/bootstrap/css/datepicker.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/platform/bootstrap/css/ui-dialog.css">
<link rel="shortcut icon" href="${base}/images1/sjt.ico">
<script type="text/javascript" src="${base}/platform/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${base}/platform/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${base}/platform/js/jquery.pagination.js"></script>
<script type="text/javascript" src="${base}/platform/js/idcard.validator.js"></script>
<script type="text/javascript" src="${base}/platform/js/validator-0.7.3/jquery.validator.js"></script>
<script type="text/javascript" src="${base}/platform/js/validator-0.7.3/local/zh_CN.js"></script>
<script type="text/javascript" src="${base}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/platform/js/dialog-min.js"></script>
<style>
.n-top, .n-right, .n-bottom, .n-left 
{
display: inline-block;
line-height: 0;
vertical-align: top;
outline: 0;
margin-left: 100px;
margin-top:-90px
}
.n-yellow .n-tip, .n-yellow .n-ok, .n-yellow .n-loading 
{
background-color: #f8fdff;
border-color: #ddd;
color: #333;
box-shadow: 0 1px 3px #ccc;

}
.n-arrow b, .n-arrow i {
line-height: 0px;
}
.red_text {
float: left;
width: 55%;
margin-left: 3%;
height: 18px;
line-height: 55px;
font-size: 20px;
text-indent: 5px;
color: #a2a2a2;}
</style>
</head>

<body>
<div class="logo">
	<img src="${base}/platform/img/logo.gif" />
</div>           
                <form id="registerForm" class="form" action="${base}/register/mobileRegister.do" method="post" onsubmit="return false;" autocomplete="off"  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
						<p class="red_text">昵称</p>
                        <div class="code1">
                           	<input name="username" style="height:35px;margin-left:-2%" type="text" data-rule="昵称:required;username;length[3~15]remote[get:ajaxCheckUserName.do]" value="${username}" />
						</div>
						<p class="red_text">密码</p>
						<div class="code1">
                            <input name="password" type="password"  style="height:35px;margin-left:-2%" data-rule="密码:required;password;" value="" />
                        </div>
                        <p class="red_text">确认密码</p>
                        <div class="code1">    
                            <input  name="confirmPassword" type="password" style="height:35px;margin-left:-2%" data-rule="确认密码:required;confirmPassword;match(password);" value="" />
                        </div>
                        <p class="red_text">手机号码</p>
                          <div id="phoneTr" class="code1">
                           	<input id="mobile" name="mobile"style="height:35px;margin-left:-2%"  type="text" data-rule="手机号码:required; mobile;remote[get:ajaxCheckTel.do]" data-rule-mobile="[/^1[34578]\d{9}$/, '请检查手机号格式']" value="${mobile}" />
                          </div>
                          <p class="red_text">手机验证码</p>
                          <div  style="height:45px;width:92%;margin-left:4%">
						<input name="authCode" type="text" style="height: 35px;float: left;width: 60%;margin-top: 15px;margin-left: -1%;text-indent:3%" placeholder="请输入您的手机验证码" name="paramMap.cellcode"  id="cellcode"/>
						<!-- <button id="btnyzm1"></button> -->
							<input type="button"id="getAuthCodeBtn" style="margin-top:4px;float:right;margin-right:10px;background:#ffb23f;color:#fff;width: 30%;border-radius: 5px;height:45px;margin-top:15px;" onclick="sendMobileValidSMSCode()" value="获取验证码"></input>
						</div>
                          <div >
                          <p class="red_text">推荐码</p>
                          <#if recommender?? && recommender != "">
                          	<div class="code1"> 
	              			<input  name="recommender" type="text"  style="height:35px;margin-left:-2%;;border: 1px solid #cecece;text-indent:3%;" value="${recommender}" readonly="true" data-rule="推荐人:remote[get:ajaxRecommender.do]"/>
                          	</div>
                          <#else>
                          <div class="code1"> 
                          <input  name="recommender" type="text"  style="height:35px;margin-left:-2%;;border: 1px solid #cecece;text-indent:3%;"  data-rule="推荐码:required;推荐码:remote[get:ajaxRecommender.do]" />    
                          </div>
                          </#if> 
                         </div>
                         <p class="red_text">验证码</p>
                          <div class="code1">
                            	<input class="input-small" name="j_captcha" type="text" style="height:35px;margin-left:-2%"  data-rule="验证码:required;length[4];remote[get:ajaxCaptcha.do]" value="" />
                            	<span class="msg-box n-right" for="j_captcha"></span>
                              	<img style="vertical-align: top;cursor:pointer;margin-top: -50px;float:right" id="captachaImg"  src="${base}/captcha.jpg"/>
<!--                             	<a style="vertical-align: top;margin-top: -40px;" id="refreshBtn"><img style="cursor:pointer;"  src="${base}/platform/img/refresh.png"/></a> -->
                          </div>


                    <div style="padding-bottom: 100px;">
                     
                    <button class="submit2" id="btn_cellregs" >注册</button>
                    <input name="allowp" style="margin-left:5%" type="checkbox" data-rule="checked;" data-msg-checked="请同意我们的条款" checked >&nbsp;<a  href="#myModal" role="button"style="text-decoration:none"  data-toggle="modal">我已经阅读并同意使用条款和隐私条款</a>
                        <p><span style="color:#464646;float: right;padding: 15px;padding-right: 25px;">已有帐号？<a href="${base}/loginAction/login.do">立即登录</a></span></p>
                  </div>
                  </form>
</div>
 <div id="myModal" class="modal hide fade" tabindex="-1" style="width: 90%;margin-left:-45%;" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">世纪创投网站服务协议</h3>
  </div>
  <div class="modal-body" style="max-height:250px">
  <h1  style="text-align:center;font-size:18px">世纪创投网站服务协议</h1>    
  <p>&nbsp;&nbsp;“世纪创投”网站（www.sjct888.com，以下简称“本网站”）由煜烨投资（北京）有限公司(以下简称“本公司”)负责运营。本服务协议双方为本网站用户与本公司，适用于用户注册使用本网站服务的全部活动。
<br>&nbsp;&nbsp;在注册成为本网站用户前，请您务必认真、仔细阅读并充分理解本服务协议全部内容。您在注册本网站取得用户身份时勾选同意本服务协议并成功注册为本网站用户，视为您已经充分理解和同意本服务协议全部内容，并签署了本服务协议，本服务协议立即在您与本公司之间产生合同法律效力，您注册使用本网站服务的全部活动将受到本服务协议的约束并承担相应的责任和义务。如您不同意本服务协议内容，请不要注册使用本网站服务。
 <br>&nbsp;&nbsp;本服务协议包括以下所有条款，同时也包括本网站已经发布的或者将来可能发布的各类规则。所有规则均为本服务协议不可分割的一部分，与本服务协议具有同等法律效力。
 <br>&nbsp;&nbsp;用户在此确认知悉并同意本公司有权根据需要不时修改、增加或删减本服务协议。本公司将采用在本网站公示的方式通知用户该等修改、增加或删减，用户有义务注意该等公示。一经本网站公示，视为已经通知到用户。若用户在本服务协议及各类规则变更后继续使用本网站服务的，视为用户已仔细认真阅读、充分理解并同意接受修改后的本服务协议及各类规则，且用户承诺遵守修改后的本服务协议及各类规则内容，并承担相应的义务和责任。若用户不同意修改后的本服务协议及各类规则内容，应立即停止使用本网站服务，本公司保留中止、终止或限制用户继续使用本网站服务的权利，但该等终止、中止或限制行为并不豁免用户在本网站已经进行的交易下所应承担的责任和义务。本公司不承担任何因此导致的法律责任。
 <br>&nbsp;&nbsp;一. 本网站服务
 <br>&nbsp;&nbsp;本网站为用户提供【投融资信息中介服务，为本网站的用户提供投融资信息，促成投融资双方的合作，并在投融资双方达成交易以后，进行还款管理、催收等工作】，用户通过本网站居间服务与其他用户达成的所有交易项下资金的存放和移转均通过银行实现，本网站并不存放交易资金。
 <br>&nbsp;&nbsp;二. 服务费用
 <br>&nbsp;&nbsp;用户注册使用本网站服务，本公司有权向用户收取服务费用，具体服务费用以本网站公告或其他协议为准。用户承诺按照本服务协议约定向本网站支付服务费用，并同意本网站有权自其有关账户中直接扣划服务费用。用户通过本网站与其他方签订协议的，用户按照签署的协议约定向其他方支付费用。
 <br>&nbsp;&nbsp;三. 使用限制
 <br>&nbsp;&nbsp;1. 注册成为本网站用户必须满足如下主体资格条件：具有中华人民共和国（以下简称“中国”）国籍（不包括中国香港、澳门及台湾地区）、年龄在18周岁以上、具有完全民事行为能力的自然人。若不具备前述主体资格条件，请立即终止注册使用本网站服务.若违反前述规定注册使用本网站服务，本公司保留终止用户资格、追究用户或用户的监护人相关法律责任的权利。
 <br>&nbsp;&nbsp;2. 用户在注册使用本网站服务时应当根据本网站的要求提供自己的真实信息（包括但不限于真实姓名、联系电话、地址、电子邮箱等信息），并保证向本网站提供的各种信息和资料是真实、准确、完整、有效和合法的，复印件与原件一致。如用户向本网站提供的各项信息和资料发生变更，用户应当及时向本网站更新用户的信息和资料，如因用户未及时更新信息和资料导致本网站无法向用户提供服务或发生错误，由此产生的法律责任和后果由用户自己承担。如使用他人信息和文件注册使用本网站服务或向本网站提供的信息和资料不符合上述规定，由此引起的一切责任和后果均由用户本人全部承担，本公司及本网站不因此承担任何法律责任，如因此而给本公司及本网站造成损失，用户应当承担赔偿本公司及本网站损失的责任。
 <br>&nbsp;&nbsp;3. 成功注册为本网站用户后，用户应当妥善保管自己的用户名和密码，不得将用户名转让、赠与或授权给第三方使用。用户在此确认，使用其用户的用户名和密码登录本网站及由用户在本网站的用户账户下发出的一切指令均视为用户本人的行为和意思，该等指令不可逆转，由此产生的一切责任和后果由用户本人承担，本公司及本网站不承担任何责任。
 <br>&nbsp;&nbsp;4. 用户不得利用本网站从事任何违法违规活动，用户在此承诺合法使用本网站提供的服务，遵守中国现行法律、法规、规章、规范性文件以及本服务协议的约定。若用户违反上述规定，所产生的一切法律责任和后果与本公司和本网站无关，由用户自行承担，如因此给本公司和本网站造成损失的，由用户赔偿本公司和本网站的损失。本公司保留将用户违法违规行为及有关信息资料进行公示、计入用户信用档案、按照法律法规的规定提供的有关政府部门或按照有关协议约定提供给第三方的权利。
 <br>&nbsp;&nbsp;5. 如用户在本网站的某些行为或言论不合法、违反有关协议约定、侵犯本公司的利益等，本公司有权基于独立判断直接删除用户在本网站上作出的上述行为或言论，有权中止、终止、限制用户使用本网站服务，而无需通知用户，亦无需承担任何责任。如因此而给本公司及本网站造成损失的，应当赔偿本公司及本网站的损失。
 <br>&nbsp;&nbsp;四. 不保证条款
 <br>&nbsp;&nbsp;本网站提供的服务中不含有任何明示、暗示的，对任何用户、任何交易的真实性、准确性、可靠性、有效性、完整性等的任何保证和承诺，用户需根据自身风险承受能力，衡量本网站披露的交易内容及交易对方的真实性、可靠性、有效性、完整性，用户因其选择使用本网站提供的服务、参与的交易等而产生的直接或间接损失均由用户自己承担，包括但不限于资金损失、利润损失、营业中断等。本公司及其股东、创始人、全体员工、代理人、关联公司、子公司、分公司均不对以上损失承担任何责任。
 <br>&nbsp;&nbsp;五. 责任限制
 <br>&nbsp;&nbsp;1. 基于互联网的特殊性，本公司无法保证本网站的服务不会中断，对于包括但不限于本公司、本网站及相关第三方的设备、系统存在缺陷，计算机发生故障、遭到病毒、黑客攻击或者发生地震、海啸等不可抗力而造成服务中断或因此给用户造成的损失，本公司不承担任何责任，有关损失由用户自己承担。
 <br>&nbsp;&nbsp;2. 本公司无义务监测本网站内容。用户对于本网站披露的信息、选择使用本网站提供的服务，选择参与交易等，应当自行判断真实性和承担风险，由此而产生的法律责任和后果由用户自己承担，本公司不承担任何责任。
 <br>&nbsp;&nbsp;3. 与本公司合作的第三方机构向用户提供的服务由第三方机构自行负责，本公司不对此等服务承担任何责任。
 <br>&nbsp;&nbsp;4. 本网站的内容可能涉及第三方所有的信息或第三方网站，该等信息或第三方网站的真实性、可靠性、有效性等由相关第三方负责，用户对该等信息或第三方网站自行判断并承担风险，与本网站和本公司无关。
 <br>&nbsp;&nbsp;5. 无论如何，本公司对用户承担的违约赔偿（如有）总额不超过向用户收取的服务费用总额。
 <br>&nbsp;&nbsp;六. 用户资料的使用与披露
 <br>&nbsp;&nbsp;1. 用户在此同意，对于用户提供的和本公司为提供本网站服务所需而自行收集的用户个人信息和资料，本公司有权按照本服务协议的约定进行使用或者披露。
 <br>&nbsp;&nbsp;2.  用户授权本公司基于履行有关协议、解决争议、调停纠纷、保障本网站用户交易安全的目的等使用用户的个人资料（包括但不限于用户自行提供的以及本公司审核行为所获取的其他资料）。本公司有权调查多个用户以识别问题或解决争议， 特别是本公司可审查用户的资料以区分使用多个用户名或别名的用户。
 <br>&nbsp;&nbsp;3. 为避免用户通过本网站从事欺诈、非法或其他刑事犯罪活动，保护本网站及其正常用户合法权益，用户授权本公司可通过人工或自动程序对用户的个人资料进行评价和衡量。
 <br>&nbsp;&nbsp;4. 用户同意本公司可以使用用户的个人资料以改进本网站的推广和促销工作、分析网站的使用率、改善本网站的内容和产品推广形式，并使本网站内容、设计和服务更能符合用户的要求。这些使用能改善本网站的网页，以调整本网站网页使其更能符合用户的需求，从而使用户在使用本网站服务时得到更为顺利、有效、安全及度身订造的交易体验。
 <br>&nbsp;&nbsp;5. 用户在此同意允许本公司通过在本网站的某些网页上使用诸如“Cookies”的设置收集用户信息并进行分析研究，以为用户提供更好的量身服务。
 <br>&nbsp;&nbsp;6. 用户同意本公司根据有关法律、法规、规章及其他政府规范性文件的要求向司法机关和政府部门提供用户的个人资料及交易信息。
 <br>&nbsp;&nbsp;7. 在用户未能按照与本公司签订的包括但不限于本服务协议或者与本网站其他用户签订的借款协议等其他法律文本的约定履行自己应尽的义务时，本公司有权将用户提供的及本公司自行收集的用户的个人信息、违约事实等通过网络、报刊、电视等方式对任何第三方披露，且本公司有权将用户提交或本公司自行收集的用户的个人资料和信息与任何第三方进行数据共享，以便对用户的其他申请进行审核等使用。由此而造成用户损失的，本公司不承担法律责任。
 <br>&nbsp;&nbsp;8. 本公司采用行业标准惯例以保护用户的个人信息和资料，鉴于技术限制，本公司不能确保用户的全部私人通讯及其他个人资料不会通过本条款中未列明的途径泄露出去。
 <br>&nbsp;&nbsp;七. 知识产权保护条款
 <br>&nbsp;&nbsp;1. 本网站中的所有内容均属于本公司所有,包括但不限于文本、数据、文章、设计、源代码、软件、图片、照片、音频、视频及其他全部信息。本网站内容受中国知识产权法律法规及各国际版权公约的保护。
 <br>&nbsp;&nbsp;2. 未经本公司事先书面同意,用户承诺不以任何形式复制、模仿、传播、出版、公布、展示本网站内容,包括但不限于电子的、机械的、复印的、录音录像的方式和形式等。用户承认本网站内容是属于本公司的财产。
 <br>&nbsp;&nbsp;3. 未经本公司书面同意,用户不得将本网站包含的资料等任何内容发布到任何其他网站或者服务器。任何未经授权对本网站内容的使用均属于违法行为,本公司有权追究用户的法律责任。
 <br>&nbsp;&nbsp;八. 违约责任
 <br>&nbsp;&nbsp;如一方发生违约行为，守约方可以书面通知方式要求违约方在指定的时限内停止违约行为，并就违约行为造成的损失要求违约方进行赔偿。
 <br>&nbsp;&nbsp;九. 法律适用及争议解决
 <br>&nbsp;&nbsp;1. 本服务协议的签订、效力、履行、终止、解释和争端解决受中国法律法规的管辖。
 <br>&nbsp;&nbsp;2. 因本服务协议发生任何争议或与本服务协议有关的争议，首先应由双方友好协商解决，协商不成的，任何一方有权将纠纷提交至本公司所在地有管辖权的人民法院诉讼解决。
 <br>&nbsp;&nbsp;十. 其他条款
 <br>&nbsp;&nbsp;1. 本服务协议自您同意勾选并成功注册为本网站用户之日起生效，除非本网站终止本服务协议或者用户丧失本网站用户资格，否则本服务协议始终有效。本服务协议终止并不免除用户根据本服务协议或其他有关协议、规则所应承担的义务和责任。
 <br>&nbsp;&nbsp;2. 本公司对于用户的违约行为放弃行使本服务协议规定的权利的，不得视为其对用户的其他违约行为放弃主张本服务协议项下的权利。
 <br>&nbsp;&nbsp;3. 本服务协议部分条款被认定为无效时，不影响本服务协议其他条款的效力。
 <br>&nbsp;&nbsp;4. 本服务协议不涉及用户与本网站其他用户之间因网上交易而产生的法律关系及法律纠纷，但用户在此同意将全面接受和履行与本网站其他用户通过本网站签订的任何电子法律文本，并承诺按该法律文本享有和/或放弃相应的权利、承担和/或豁免相应的义务。
 <br>&nbsp;&nbsp;5. 本公司对本服务协议享有最终的解释权。
  </p></div>
  <div class="modal-footer">
    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"data-target="#myModal">关闭</button>
    
  </div>
</div>
<script>
var errMes = '${errMes}';
var sucMes = '${sucMes}';
var isFistLoad1 = true;
var isFistLoad2 = true;
var isFistLoad3 = true;
var isFistLoad4 = true;
if(errMes!=''){
  showDialogNew(true,errMes,'E','提醒信息');
}

if(sucMes!=''){
  showDialogNew(true,sucMes,'S','提醒信息');
}
</script>
<script type="text/javascript">
var wait=60; 
function time(o) { 
    if (wait == 0) { 
        o.removeAttribute("disabled");           
        o.value="重新获取"; 
        wait = 60; 
    } else { 
        o.setAttribute("disabled", true); 
        o.value=wait+"重新发送"; 
        wait--; 
        setTimeout(function() { 
            time(o) 
        }, 
        1000) 
    } 
}


$("#getAuthCodeBtn").click(function(){

	var value = $("#mobile").val();
	if(value){
		sendAuthMessage(value);
		var butt = document.getElementById('getAuthCodeBtn');
		time(butt);
	}else{
		alert("手机号码不能为空");
		return null;
	}
	
	
});

function sendAuthMessage(mobile){
	$.ajax({
			type:"POST",
			url:"ajaxSendAuthMessage.do",
			dataType:"json",
			data:"mobile="+mobile,
			success:function(data) {
			},
			error:function(text) {
				//alert('请求后台出错.');
			} 
		});
	}
</script>

  
  <script>
 var timers=60;
 $(function(){
    timers=180;
	tipId=window.setInterval(timer,1000);
 });      
 //定时
 function timer(){
	if(timers>=0){
		timers--;
	}else{
		window.clearInterval(tipId);
		$.post("removecellCode.do","",function(data){});
	}
 }
</script>


<script type="text/javascript">
$(document).ready(function() {
	// 初始化页面
	init();
	
	var phoneTd ="<input id=\"mobileInput\" name=\"mobile\" type=\"text\"  data-rule=\"手机号码:required; mobile;remote[get:ajaxCheckTel.do]\" data-rule-mobile=\"[\/^1[34578]\\d{9}$\/, '请检查手机号格式']\" value=\"\" />";
	var emailTd ="<input id=\"emailInput\" name=\"email\" type=\"text\" data-rule=\"邮箱地址:required; email;remote[get:ajaxCheckEmail.do]\" value=\"\" />";
	function init(){
		$("#emailTr").hide();
		$("#phoneTr").show();
		$("#registerType").attr("value",0);
		$("#emailTr input").remove();
	}

	$("#registerUl li").click(function () {
		$("#registerForm").validator("cleanUp");
		$("span[class='n-icon']").remove();
		$("span[class='n-msg']").remove();
		var liId = $(this).attr('id');
		$(this).addClass("current").siblings().removeClass("current");
		if(liId == 'phoneRegister'){
			$("#emailTr").hide();
			$("#emailTr input").remove();
			$("#phoneTr td").html(phoneTd);
			$("#phoneTr").show();
			$("#registerType").attr("value",0);
		}else{
			$("#phoneTr").hide();
			$("#phoneTr input").remove();
			$("#emailTr td").html(emailTd);
			$("#emailTr").show();
			$("#registerType").attr("value",1);
		}
	});

   $("#captachaImg").click(function(){
   		refreshCaptcha();
   });
   
   $("#refreshBtn").click(function(){
   		refreshCaptcha();
   });
   
   function refreshCaptcha(){
        var randomVal = Math.random();
   		$("#captachaImg").attr("src",'${base}/captcha.jpg?'+randomVal);
   }
 });

$(function(){
	
	var zhi=$(".baizhi .wai i").html();
	var zhi1=100-zhi;
	$(".baizhi #aaa").animate({top:zhi1+"%"},600);
	
	$("body").append("<div class=\"bottom\"><a class=\"page\" href=\"${base}/index.do\"><img src=\"${base}/images/page.png\" /><span style=\"margin-top: 4px;\">主页</span>	</a><a class=\"lnd\" href=\"${base}/userIndex/index.do\"><img src=\"${base}/images/lnd.png\" /><span style=\"margin-top: 4px;\">账户</span></a><a class=\"out\" id=\"exitBtn\" href=\"${base}/loginAction/logout.do\"><img src=\"${base}/images/out.png\" /><span style=\"margin-top: 4px;\">退出</span></a></div>");
		$(".out").click(function(){
			 location.href='loginAction/logout.do';
		})
	})
</script>
</body>

</html>
