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
	<div style="margin-top:20px">
		<table>
			<tr>
				<th align="left">帮助信息</th>
			</tr>
			<tr>
				<td align="left">
				</td>
			</tr>
		</table>
	</div>
	<form action="assessment.html" method="post" name="assessmentForm" id="assessmentForm">
	<div class="search_div">
		标题:<input type="text" name="sTitle" style="width:100px"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllAssessment()"/></th>
			<th>标题</th>
			<th>简介</th>
			<th>来源</th>
			<th>分类</th>
			<th>发布时间</th>
			<th>创建时间</th>
			<th>创建人</th>
			<th>更新人</th>
			<th>更新时间</th>
			<th>发布标识</th>
		</tr>
		<c:choose>
			<c:when test="${not empty assessmentList}">
				<c:forEach items="${assessmentList}" var="assessment" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="assessmentIds" id="assessmentIds${assessment.aId }" value="${assessment.aId }"/></td>
				<td>${assessment.aTitle }</td>
				<td>${assessment.aAbstract }</td>
				<td>${assessment.aSource }</td>
				<td><c:if test="${assessment.aType==1 }">创业者服务</c:if>
				<c:if test="${assessment.aType==2 }">孵化器及众创空间服务</c:if></td>
				<td><fmt:formatDate value="${assessment.aPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${assessment.aCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${assessment.aCreator }</td>
				<td>${assessment.aModifier }</td>
				<td><fmt:formatDate value="${assessment.aModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test='${assessment.aPublish==0 }'>已发布</c:if>
					<c:if test='${assessment.aPublish==1 }'>未发布</c:if>
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
	<div class="page_and_btn">
		<div>
			<a href="javascript:addAssessment();" class="myBtn"><em>添加</em></a>
			<a href="javascript:editAssessment();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delAssessment();" class="myBtn"><em>删除</em></a>
			<a href="javascript:publishAssessment();" class="myBtn"><em>发布</em></a>
			<a href="javascript:unpublishAssessment();" class="myBtn"><em>撤回</em></a>
		</div>
		${assessment.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllAssessment(){
			if($("#sltAll").attr("checked")){
				$("input[name='assessmentIds']").attr("checked",true);
			}else{
				$("input[name='assessmentIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("assessmentIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addAssessment(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'assessment_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'assessment/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editAssessment(){
			console.log("edit")
			list=load_check();
			console.log(list.length);
			if(list.length==0){
				alert("请选择一条记录！");
			}else if(list.length!=1){
				alert("你好，只可以选择一条记录！");
			}else{
				console.log(list[0])
				var dg = new $.dialog({
					title:'修改',
					id:'assessment_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'assessment/toEdit.html?aId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delAssessment(){
			list=load_check();
			if(list.length>0){
				var url = "assessment/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function publishAssessment(){
			list=load_check();
			if(list.length>0){
				var url = "assessment/publish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unpublishAssessment(){
			list=load_check();
			if(list.length>0){
				var url = "assessment/unpublish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function search(){
			console.log("search")
			$("#assessmentForm").submit();
		}
		
	</script>
</body>
</html>