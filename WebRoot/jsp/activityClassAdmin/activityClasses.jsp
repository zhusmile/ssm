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
				<td align="left">（1）请为每个活动上传一张预览图，必须为图片。（2）所上传图片的尺寸为292×163！（3）前台首页展示的是已发布已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="activityClass.html" method="post" name="activityClassForm" id="activityClassForm">
	<div class="search_div">
		活动标题:<input type="text" name="acTitle" style="width:100px"/>
		活动类别:<select name="acType" id="acType">
			    <option value="">请选择</option>
			    <option value="0">部委活动</option>
			    <option value="1">地方活动</option>
			  	<option value="2">基地活动</option>
			  	<option value="3">社会团体活动</option>
			  </select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllActivityClass()"/></th>
			<th>活动标题</th>
			<th>活动类别</th>
			<th>活动简介</th>
			<th>发布人</th>
			<th>发布时间</th>
			<th>更新人</th>
			<th>更新时间</th>
			<th>启用状态</th>
			<th>页面浏览量</th>
			<th>参与方式跳转链接</th>
		</tr>
		<c:choose>
			<c:when test="${not empty activityClassList}">
				<c:forEach items="${activityClassList}" var="activityClass" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="activityClassIds" id="activityClassIds${activityClass.acId }" value="${activityClass.acId }"/></td>
				<td>${activityClass.acTitle }</td>
				<td>
					<c:if test="${activityClass.acType==0 }">部委活动</c:if>
					<c:if test="${activityClass.acType==1 }">地方活动</c:if>
					<c:if test="${activityClass.acType==2 }">基地活动</c:if>
					<c:if test="${activityClass.acType==3 }">社会团体活动</c:if>
				</td>
				<td>${activityClass.acAbstract }</td>
				<td>${activityClass.acIssuer }</td>
				<td><fmt:formatDate value="${activityClass.acPublishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${activityClass.acModifier }</td>
				<td><fmt:formatDate value="${activityClass.acModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test='${activityClass.acEnabled==0 }'>已启用</c:if>
					<c:if test='${activityClass.acEnabled==1 }'>未启用</c:if>
				</td>
				<td>
					${activityClass.acVisitCount }
				</td>
				<td>
					${activityClass.acLink }
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
			<a href="javascript:addActivityClass();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editActivityClass();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delActivityClass();" class="myBtn"><em>删除</em></a>
			<a href="javascript:enableActivityClass();" class="myBtn"><em>启用</em></a>
			<a href="javascript:unenableActivityClass();" class="myBtn"><em>停用</em></a>
		</div>
		${activityClass.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllActivityClass(){
			if($("#sltAll").attr("checked")){
				$("input[name='activityClassIds']").attr("checked",true);
			}else{
				$("input[name='activityClassIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("activityClassIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addActivityClass(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'activityClass_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'activityClass/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editActivityClass(){
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
					id:'activityClass_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'activityClass/toEdit.html?acId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delActivityClass(){
			list=load_check();
			if(list.length>0){
				var url = "activityClass/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function enableActivityClass(){
			list=load_check();
			if(list.length>0){
				var url = "activityClass/enabled.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unenableActivityClass(){
			list=load_check();
			if(list.length>0){
				var url = "activityClass/unenabled.html?list="+list;
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
			$("#activityClassForm").submit();
		}
	</script>
</body>
</html>