<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: left;width:120px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="assessmentForm" id="assessmentForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="aId" id="aId" value="${assessment.aId }"/>
		<input type="hidden" name="aContent" id="aContent">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="aTitle" id="aTitle" class="input_txt" value="${assessment.aTitle }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>简介:</th>
			<td><input type="text" name="aAbstract" id="aAbstract" class="input_txt" value="${assessment.aAbstract }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>来源:</th>
			<td><input type="text" name="aSource" id="aSource" class="input_txt" value="${assessment.aSource }"/></td>
		</tr>
		<tr class="info">
			<th>分类:</th>
			<td><select name="aType">
				<option value="1" <c:if test="${assessment.aType==1 }">selected</c:if>>创业者服务</option>
				<option value="2" <c:if test="${assessment.aType==2 }">selected</c:if>>孵化器及众创空间服务</option>
			</select></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="aPublishTime" id="aPublishTime" value="<fmt:formatDate value="${assessment.aPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
		<tr class="info">
			<th>正文:</th>
			<td><script id="editor" type="text/plain" style="width:70%;height:200px;">${assessment.aContent}</script></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.js"></script>
	<!-- 上传控件 -->
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				var ue = UE.getEditor('editor');
				document.getElementById("aContent").value=UE.getEditor('editor').getContent();
				$("#assessmentForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#aTitle").val()==""){
				alert("请输入标题!");
				$("#aTitle").focus();
				return false;
			}
			if($("#aAbstract").val()==""){
				alert("请输入简介!");
				$("#aAbstract").focus();
				return false;
			}
			if($("#aSource").val()==""){
				alert("请输入来源!");
				$("#aSource").focus();
				return false;
			}
			return true;
		}
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
		function failed(){
			alert("该标题已存在！");
			$("#aTitle").select();
			$("#aTitle").focus();
		}
	</script>
</body>
</html>