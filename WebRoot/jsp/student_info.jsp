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
	<form action="save.html" name="studentForm" id="studentForm" enctype="multipart/form-data" target="result" method="post" onsubmit="return checkInfo();">
		<input type="hidden" name="idKey" id="idKey" value="${student.id }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th></th>
			<td>
				<c:if test="${student.studentImage!='' }">
					<img alt="" src="${student.studentImage }" height="40px" id="showImage">
					<button type="button" id="deleteImage">清除头像</button>
				</c:if>
			</td>
		</tr>
		<tr class="info">
			<th>头像:</th>
			<td>
				<input type="file" name="file" id="file" class="input_txt" />
				<input type="hidden" name="studentImage" id="studentImage" value="${student.studentImage }">
			</td>
		</tr>
		<tr class="info">
			<th>学号:</th>
			<td><input type="text" name="studentNo" id="studentNo" class="input_txt" value="${student.studentNo }"/></td>
		</tr>
		<tr class="info">
			<th>班级:</th>
			<td><input type="text" name="studentClass" id="studentClass" class="input_txt" value="${student.studentClass}"/></td>
		</tr>
		<tr class="info">
			<th>姓名:</th>
			<td><input type="text" name="studentName" id="studentName" class="input_txt" value="${student.studentName }"/></td>
		</tr>
		<tr class="info">
			<th>性别:</th>
			<td>
			<select name="studentSex" id="studentSex" class="input_txt">
				<option value="">请选择</option>
				<option <c:if test="${student.studentSex==1 }">selected</c:if> value="1">男</option>
				<option <c:if test="${student.studentSex==2 }">selected</c:if> value="2">女</option>
			</select>
			</td>
		</tr>
		<tr class="info">
			<th>年龄:</th>
			<td><input type="text" name="studentAge" id="studentAge" class="input_txt" value="${student.studentAge }"/></td>
		</tr>
		<tr class="info">
			<th>身份证号:</th>
			<td><input type="text" name="studentId" id="studentId" class="input_txt" value="${student.studentId }"/></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		$("#deleteImage").click(function() {
			console.log("delete")
			$(this).hide()
			$("#showImage").hide()
			$("#studentImage").val(null)
			console.log($("#studentImage").val())
		})
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#studentForm").submit();
			});
 			if($("#idKey").val()!=""){
 				$("#studentNo").attr("readonly","readonly");
 				$("#studentNo").css("color","gray");
 			}
		});
		
		function checkInfo(){
			if($("#studentNo").val()==""){
				alert("请输入学号!");
				$("#studentNo").focus();
				return false;
			}
			if($("#studentClass").val()==""){
				alert("请输入班级!");
				$("#studentClass").focus();
				return false;
			}
			if($("#studentName").val()==""){
				alert("请输入姓名!");
				$("#studentName").focus();
				return false;
			}
			if($("#studentId").val()==""){
				alert("请输入身份证号!");
				$("#studentId").focus();
				return false;
			}
			if($("#studentSex").val()==""){
				alert("请选择性别!");
				$("#studentSex").focus();
				return false;
			}
			if($("#studentAge").val()==""){
				alert("请输入年龄!");
				$("#studentAge").focus();
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
			alert("新增失败，该学号已存在！");
			$("#studentNo").select();
			$("#studentNo").focus();
		}
	</script>
</body>
</html>