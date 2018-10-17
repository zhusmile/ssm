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
<form action="state.html" method="post" name="stateForm" id="stateForm">
	<div class="search_div">
		状态:<select id="sStatus" name="sStatus">
			<option value=''>请选择</option>
			<option value="0">未审核</option>
			<option value="1">审核未通过</option>
			<option value="2">审核通过</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllState()"/></th>
			<th>姓名</th>
			<th>单位</th>
			<th>电话</th>
			<th>邮箱</th>
			<th>标题</th>
			<th>时间</th>
			<th>状态</th>
		</tr>
		<c:choose>
			<c:when test="${not empty states}">
				<c:forEach items="${states}" var="state" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="stateIds" id="stateIds${state.sId }" value="${state.sId }"/></td>
				<td>${state.sName }</td>
				<td>${state.sUnit }</td>
				<td>${state.sMp }</td>
				<td>${state.sEmail }</td>
				<td>${state.sTitle }</td>
				<td><fmt:formatDate value="${state.sTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:if test="${state.sStatus==0 }">未审核</c:if>
					<c:if test="${state.sStatus==1 }">审核未通过</c:if>
					<c:if test="${state.sStatus==2 }">审核通过</c:if>
				</td>
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
	</form>
	<div class="page_and_btn">
		<div>
			<a href="javascript:auditState();" class="myBtn"><em>审核</em></a>
			<a href="javascript:delState();" class="myBtn"><em>删除</em></a>
		</div>
		${state.page.pageStr }
	</div>

	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		function sltAllState(){
			if($("#sltAll").attr("checked")){
				$("input[name='stateIds']").attr("checked",true);
			}else{
				$("input[name='stateIds']").attr("checked",false);
			}
		}
		function search() {
			$("#stateForm").submit();
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("stateIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function auditState(){
			console.log("audit")
			list=load_check();
			console.log(list.length);
			if(list.length==0){
				alert("请选择一条记录！");
			}else if(list.length!=1){
				alert("你好，只可以选择一条记录！");
			}else{
				console.log(list[0])
				var dg = new $.dialog({
					title:'审核',
					id:'ad_edit',
					width:600,
					height:300,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'state/toAudit.html?sId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delState(){
			list=load_check();
			if(list.length>0){
				var url = "state/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
	</script>
</body>
</html>