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
.info th{text-align: left;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="newsForm" id="newsForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="nId" id="nId" value="${news.nId }"/>
		<input type="hidden" name="code" id="code" value="${code }"/>
		<input type="hidden" name="nContent" id="nContent" value="${news.nContent }">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="nTitle" id="nTitle" class="input_txt" value="${news.nTitle }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>简介:</th>
			<td><input type="text" name="nAbstract" id="nAbstract" class="input_txt" value="${news.nAbstract }"/></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td><input type="text" name="nPublishTime" id="nPublishTime" value="<fmt:formatDate value="${news.nPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="nOrder" id="nOrder" class="input_txt" value="${news.nOrder }"/></td>
		</tr>
		<tr class="info">
			<th valign="top">正文:</th>
			<td><script id="editor" type="text/plain" style="width:70%;height:200px;">${news.nContent}</script></td>		
		</tr>
		<tr class="info">
			<th>来源:</th>
			<td><input type="text" name="nSource" id="nSource" class="input_txt" value="${news.nSource }"/></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				var ue = UE.getEditor('editor');
				document.getElementById("nContent").value=UE.getEditor('editor').getContent();
				$("#newsForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#nAbstract").val().length==0){
				alert("请输入简介!");
				return false;
			}
			if($("#nTitle").val()==""){
				alert("请输入名称!");
				$("#nTitle").focus();
				return false;
			}
			if($("#nOrder").val()==""){
				alert("请输入排序!");
				$("#nOrder").focus();
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
			alert("新增失败，该名称已存在！");
			$("#nTitle").select();
			$("#nTitle").focus();
		}
		function failed1(){
			alert("修改失败，该名称已存在！");
			$("#nTitle").select();
			$("#nTitle").focus();
		}
	</script>
</body>
</html>