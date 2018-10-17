<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>建言献策</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/word.css">
</head>
<body>
<div class="main">
<jsp:include page="head.jsp" flush="true"/>
<div class="adviceContent">
			<h2 class="basetit">建言献策</h2>
			<div class="adviceMessage">
				<form class="leaveMessage" id="adviceForm" method="post" action="word.html">
					<ul class="messageItem">
						<li style="margin-top:0;">
							<span class="star">*</span>
							<span>姓 名：</span>
							<input type="text" name="sName" id="name" nullmsg="不能为空" datatype="zh2-10" placeholder="请输入姓名" value=${state.sName }>
							<span class="Validform_checktip"></span>
						</li>
						<li>
							<span style="padding-left:10px">单 位：</span>
							<input type="text" name="sUnit" id="unitname" placeholder="请输入单位名称" value=${state.sUnit }>
						</li>
						<li>
							<span class="star">*</span>
							<span>手 机：</span>
							<input type="text" name="sMp" id="phone" nullmsg="不能为空" errormsg="请填写正确的手机号" placeholder="请填写手机号" datatype="m" value=${state.sMp }>
							<span class="Validform_checktip"></span>
						</li>
						<li>
							<span class="star">*</span>
							<span>邮 箱：</span>
							<input type="email" name="sEmail" id="email" nullmsg="不能为空" errormsg="请填写正确的邮箱" placeholder="请填写邮箱" datatype="e" value=${state.sEmail }>
							<span class="Validform_checktip"></span>
						</li>
						<li>
							<span class="star">*</span>
							<span>标 题：</span>
							<input type="text" maxlength="25" name="sTitle" id="title" nullmsg="不能为空" errormsg="标题长度最大25个字符" placeholder="(最多25个字符)" datatype="*1-25" value=${state.sTitle }>
							<span class="Validform_checktip"></span>
						</li>
						<li class="adviceArea">
							<span class="star">*</span>
							<span>正 文：</span>
							<textarea maxlength="500" class="adviceText" id="content" name="sContent" placeholder="(最多500个字符)" nullmsg="不能为空" datatype="*1-500">${state.sContent }</textarea>
							<span class="Validform_checktip"></span>
						</li>
						<li class="adviceCode">
							<span class="star">*</span>
							<span>验证码：</span>
							<input type="text" name="code" id="code">
							<img id="codeImg" src="">
							<a id="changeCode">看不清? 换一张</a>
						</li>
						<li>
							<button type="button" id="btn_sub" class="submitBtn" onclick="check()">提交</button>
							<button type="button" class="refillBtn" onclick="reWrite()">重置</button>
						</li>
					</ul>
				</form>
				<!--建言须知-->
				<div class="adviceNotice">
					<dl class="noticeInfor" id="message1">
						${note.nContent }
					</dl>
				</div>
			</div>
		</div>
<jsp:include page="footer.jsp" flush="true"/>
</div>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/wp-content/themes/validform/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/Validform/v5.1/Validform_v5.1_min.js"></script>
<script>
/* $(".leaveMessage").Validform(); */
var errInfo = "${errInfo}";
var msg = "${msg}";
$(document).ready(function(){
	changeCode();
	$("#codeImg").bind("click",changeCode);
	if(errInfo!=''){
		alert("验证码输入错误")
		$("#code").focus();
	}
	if(msg!=''){
		alert("谢谢您的建言")
		window.location.href="http://localhost:8080/ssm/front/word.html";
	}
});

function genTimestamp(){
	var time = new Date();
	return time.getTime();
}

function changeCode(){
	$("#codeImg").attr("src","code.html?t="+genTimestamp());
}
function resetErr(){
	$(".Validform_checktip").each(function(){$(this).hide()});
	$(".Validform_checktip").each(function(){$(this).html("")});
}
function check(){
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$")
	var reg1 = new RegExp("/^1\d{10}$/")
 	 var flag=true
	 resetErr()
	if($("#name").val()==""){
		$("#name").next(".Validform_checktip").show()
		$("#name").next(".Validform_checktip").html("姓名不得为空！");
		console.log("error")
		$("#name").focus();
		flag= false;
	}
	if($("#phone").val()==""){
		$("#phone").next(".Validform_checktip").show()
		$("#phone").next(".Validform_checktip").html("手机不得为空！");
		$("#phone").focus();
		flag= false;
	}else if(!/^1[34578]\d{9}$/.test($("#phone").val())){
		$("#phone").next(".Validform_checktip").show()
		$("#phone").next(".Validform_checktip").html("手机号格式错误！");
		$("#phone").focus();
		flag= false;
	}
	if($("#email").val()==""){
		$("#email").next(".Validform_checktip").show()
		$("#email").next(".Validform_checktip").html("邮箱不得为空！");
		$("#email").focus();
		flag= false;
	}else if(!reg.test($("#email").val())){
		$("#email").next(".Validform_checktip").show()
		$("#email").next(".Validform_checktip").html("邮箱格式错误！");
		$("#email").focus();
		flag= false;
	}
	if($("#title").val()==""){
		$("#title").next(".Validform_checktip").show()
		$("#title").next(".Validform_checktip").html("标题不得为空！");
		$("#title").focus();
		flag= false;
	}
	if($("#content").val()==""){
		$("#content").next(".Validform_checktip").show()
		$("#content").next(".Validform_checktip").html("正文不得为空！");
		$("#content").focus();
		flag= false;
	}
	if($("#code").val()==""){
		$("#codeerr").show();
		$("#codeerr").html("验证码不得为空！");
		$("#code").focus();
		flag= false;
	}
	if(flag){
		$("#adviceForm").submit()
	} 
}
$("input").change(
		function(){
			if($(this).val()!=null || $(this).val()!=''){
				console.log("不为空")
				$(this).siblings(".Validform_checktip").html("")
			}
		}
		)
function reWrite(){
	$("input").each(function(){ $(this).val("")})
	$("textarea").val("")
}
$("#changeCode").click(function () {
	changeCode()
})
</script>
</html>