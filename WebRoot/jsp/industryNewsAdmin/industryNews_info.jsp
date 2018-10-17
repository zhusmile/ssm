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
	<form action="save.html" name="industryNewsForm" id="industryNewsForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="inId" id="inId" value="${industryNews.inId }"/>
		<input type="hidden" name="inContent" id="inContent" value="${industryNews.inContent }">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>产业类别:</th>
			<td>
				<select name="inType" id="inType">
				<option value="1" <c:if test="${industryNews.inType==1 }">selected</c:if>>节能环保产业</option>
				<option value="2" <c:if test="${industryNews.inType==2 }">selected</c:if>>新一代信息技术</option>
				<option value="3" <c:if test="${industryNews.inType==3 }">selected</c:if>>生物产业</option>
				<option value="4" <c:if test="${industryNews.inType==4 }">selected</c:if>>高端装备制造业</option>
				<option value="5" <c:if test="${industryNews.inType==5 }">selected</c:if>>新能源产业 </option>
				<option value="6" <c:if test="${industryNews.inType==6 }">selected</c:if>>新材料产业</option>
				<option value="7" <c:if test="${industryNews.inType==7 }">selected</c:if>>新能源汽车</option>
				<option value="8" <c:if test="${industryNews.inType==8 }">selected</c:if>>数字创意</option>
			</select>
			</td>
		</tr>
		<tr class="info">
			<th>标题:</th>
			<td><input type="text" name="inTitle" id="inTitle" class="input_txt" value="${industryNews.inTitle }"/></td>
		</tr>
		<tr class="info">
			<th>简介:</th>
			<td><input type="text" name="inAbstract" id="inAbstract" class="input_txt" value="${industryNews.inAbstract }"/></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td><input type="text" name="inPublishTime" id="inPublishTime" value="<fmt:formatDate value="${industryNews.inPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/></td>
		</tr>
		<tr class="info">
			<th>排序:</th>
			<td><input type="text" name="inOrder" id="inOrder" class="input_txt" value="${industryNews.inOrder }"/></td>
		</tr>
		<tr class="info">
			<th>来源:</th>
			<td><input type="text" name="inSource" id="inSource" class="input_txt" value="${industryNews.inSource }"/></td>
		</tr>
		<tr class="info">
			<th valign="top">正文:</th>
			<td><script id="editor" type="text/plain" style="width:70%;height:200px;">${industryNews.inContent}</script></td>		
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
				document.getElementById("inContent").value=UE.getEditor('editor').getContent();
				$("#industryNewsForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#inAbstract").val().length==0){
				alert("请输入简介!");
				return false;
			}
			if($("#inTitle").val()==""){
				alert("请输入标题!");
				$("#inTitle").focus();
				return false;
			}
			if($("#inOrder").val()==""){
				alert("请输入排序!");
				$("#inOrder").focus();
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
			$("#inTitle").select();
			$("#inTitle").focus();
		}
	</script>
</body>
</html>