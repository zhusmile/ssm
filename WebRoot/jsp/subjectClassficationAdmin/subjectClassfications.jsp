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
	<form action="subjectClassfication.html" method="post" name="subjectClassficationForm" id="subjectClassficationForm">
	<div class="search_div">
		主题分类名称:<input type="text" name="sName" value="${subjectClassfication.sName }">
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllSc()"/></th>
			<th>主题分类名称</th>
		</tr>
		<c:choose>
			<c:when test="${not empty subjectClassficationList}">
				<c:forEach items="${subjectClassficationList}" var="subjectClassfication" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="subjectClassficationIds" id="subjectClassficationIds${subjectClassfication.sId }" value="${subjectClassfication.sId }"/></td>
				<td>${subjectClassfication.sName }</td>
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
			<a href="javascript:addSc();" class="myBtn"><em>添加</em></a>
			<a href="javascript:editSc();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delSc();" class="myBtn"><em>删除</em></a>
		</div>
		${subjectClassfication.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		function search(){
			//搜索
			$("#subjectClassficationForm").submit();
		}
		function sltAllSc(){
			if($("#sltAll").attr("checked")){
				$("input[name='subjectClassficationIds']").attr("checked",true);
			}else{
				$("input[name='subjectClassficationIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("subjectClassficationIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addSc(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'ad_new',
				width:350,
				height:200,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'subjectClassfication/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editSc(){
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
					id:'ad_edit',
					width:350,
					height:200,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'subjectClassfication/toEdit.html?sId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delSc(){
			list=load_check();
			if(list.length>0){
				var url = "subjectClassfication/delete.html?list="+list;
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