<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="css/main.css"/>
</head>
<body>
	<form action="student.html" method="post" name="studentForm" id="studentForm">
	<div class="search_div">
		姓名：<input type="text" name="studentName" value="${student.studentName }" style="width:100px"/>
		学号：<input type="text" name="studentNo" value="${student.studentNo }" style="width:100px"/>
		性别：<select name="studentSex" id="studentSex" style="vertical-align: middle;">
				<option value="">请选择</option>
				<option value="1">男</option>
				<option value="2">女</option>
			</select>
		班级：<input type="text" name="studentClass" value="${student.studentClass }">
		身份证号：<input type="text" name="studentId" value="${student.studentId }">
		更新日期：<input type="text" name="timeStartForSearch" value="<fmt:formatDate value="${student.timeStartForSearch}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="timeEndForSearch" value="<fmt:formatDate value="${student.timeEndForSearch}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllStudent()"/></th>
			<th>序号</th>
			<th>头像</th>
			<th>学号</th>
			<th>班级</th>
			<th>姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>身份证号</th>
			<th>更新时间</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty studentList}">
				<c:forEach items="${studentList}" var="student" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="studentIds" id="studentIds${student.id }" value="${student.id }"/></td>
				<td>${vs.index+1}</td>
				<td><img alt="空" src="${student.studentImage }" height="30px"></td>
				<td>${student.studentNo }</td>
				<td>${student.studentClass }</td>
				<td>${student.studentName }</td>
				<td>
					<c:if test="${student.studentSex==1 }">男</c:if>
					<c:if test="${student.studentSex==2 }">女</c:if>
				</td>
				<td>${student.studentAge }</td>
				<td>${student.studentId }</td>
				<td><fmt:formatDate value="${student.changeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><a href="javascript:editStudent(${student.id });">修改</a> | <a href="javascript:delStudent(${student.id });">删除</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="10">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addStudent();" class="myBtn"><em>新增</em></a>
		</div>
		${student.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllStudent(){
			if($("#sltAll").attr("checked")){
				$("input[name='studentIds']").attr("checked",true);
			}else{
				$("input[name='studentIds']").attr("checked",false);
			}
		}
		function addStudent(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增学生',
				id:'student_new',
				width:330,
				height:300,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'student/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		
		function editStudent(idKey){
			console.log(idKey)
			var dg = new $.dialog({
				title:'修改学生',
				id:'student_edit',
				width:330,
				height:300,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'student/edit.html?id='+idKey
				});
    		dg.ShowDialog();
		}
		
		function delStudent(idKey){
			if(confirm("确定要删除该记录？")){
				var url = "student/delete.html?id="+idKey;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}
		}

		function search(){
			$("#studentForm").submit();
		}

	</script>
</body>
</html>