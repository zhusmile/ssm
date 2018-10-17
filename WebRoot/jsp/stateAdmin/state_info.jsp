<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.info th{text-align: left;width:100px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="stateForm" id="stateForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="sId" id="sId" value="${state.sId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>单位:</th>
			<td><input type="text" name="sUnit" id="sUnit" class="input_txt" value="${state.sUnit }" readonly="readonly"/></td>
			<th>姓名:</th>
			<td><input type="text" name="sName" id="sName" class="input_txt" value="${state.sName }" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>单位:</th>
			<td><input type="text"  id="sUnit" class="input_txt" value="${state.sUnit }" readonly="readonly"/></td>
			<th>姓名:</th>
			<td><input type="text"  id="sName" class="input_txt" value="${state.sName }" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>电话:</th>
			<td><input type="text"  id="sMp" class="input_txt" value="${state.sMp }" readonly="readonly"/></td>
			<th>邮箱:</th>
			<td><input type="text"  id="sEmail" class="input_txt" value="${state.sEmail }" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>标题:</th>
			<td><input type="text"  id="sTitle" class="input_txt" value="${state.sTitle }" readonly="readonly"/></td>
			<th>建言时间:</th>
			<td><input type="text"  id="Time" class="input_txt" value='<fmt:formatDate value="${state.sTime }" pattern="yyyy-MM-dd HH:mm:ss"/>' readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th></th>
			<td colspan="3"><textarea readonly="readonly">${state.sContent }</textarea></td>
		</tr>
		<tr class="info">
			<th>审核结果:</th>
			<td> <input type="radio" name="sStatus" value="1" checked="checked"/>审核未通过
			<input type="radio" name="sStatus" value="2"/>审核通过</td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#stateForm").submit();
			});
		});
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
	</script>
</body>
</html>