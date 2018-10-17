<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.info th{text-align: right;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="infoForm" id="infoForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="infoId" id="infoId" value="${info.infoId }"/>
		<input type="hidden" name="code" id="code" value="${code }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>名称:</th>
			<td><input type="text" name="infoName" id="fName" class="input_txt" value="${info.infoName }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="infoOrder" id="infoOrder" class="input_txt" value="${info.infoOrder }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>链接:</th>
			<td><input type="text" name="infoLink" id="infoLink" class="input_txt" value="${info.infoLink }"/></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#infoForm").submit();
			});
		});
		
		function checkInfo(){
			if($("#infoLink").val().length==0){
				alert("请输入链接!");
				return false;
			}
			if($("#infoName").val()==""){
				alert("请输入名称!");
				$("#infoName").focus();
				return false;
			}
			if($("#infoOrder").val()==""){
				alert("请输入排序!");
				$("#infoOrder").focus();
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
			$("#infoName").select();
			$("#infoName").focus();
		}
	</script>
</body>
</html>