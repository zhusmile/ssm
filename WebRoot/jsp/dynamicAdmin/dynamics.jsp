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
				<td align="left">双创动态管理：插入数据时上传图片，系统会自动截取第一张图片作为缩略图。缩略图大小为：500*290,200*90;如果没有图片的话请不要置顶展示在首页，否则会影响首页排版！
					搜索完成之后请记得清空搜索框内容
				</td>
			</tr>
		</table>
	</div>
	<form action="dynamic.html" method="post" name="dyForm" id="dyForm">
	<div class="search_div">
		标题:<input type="text" name="dyTitle" id="dyTitle" value="${dy.dyTitle }" style="width:100px"/>
		发布标识:<select name="dyPublish" id="dyPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		是否置顶:<select name="dySetTop" id="dySetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		创建时间:<input type="text" name="searchStart" value="<fmt:formatDate value="${dy.searchStart}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="searchEnd" value="<fmt:formatDate value="${dy.searchEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllDy()"/></th>
			<th>标题</th>
			<th>简介</th>
			<th>发布单位</th>
			<th>发布时间</th>
			<th>创建时间</th>
			<th>排序</th>
			<th>发布标识</th>
			<th>置顶</th>
			<th>领导标记</th>
		</tr>
		<c:choose>
			<c:when test="${not empty dyList}">
				<c:forEach items="${dyList}" var="dy" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="dyIds" id="dyIds${dy.dyId }" value="${dy.dyId }"/></td>
				<td>${dy.dyTitle }</td>
				<td>${dy.dyAbstract }</td>
				<td>${dy.dyIssuerName }</td>
				<td><fmt:formatDate value="${dy.dyPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${dy.dyCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${dy.dyOrder }</td>
				<td>
					<c:if test='${dy.dyPublish==0 }'>已发布</c:if>
					<c:if test='${dy.dyPublish==1 }'>未发布</c:if>
				</td>
				<td>
					<c:if test='${dy.dySetTop==0 }'>置顶</c:if>
					<c:if test='${dy.dySetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${dy.dyLeader==0 }'>已标记</c:if>
					<c:if test='${dy.dyLeader==1 }'>未标记</c:if>
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
			<a href="javascript:addDy();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editDy();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delDy();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setDy();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetDy();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:publishDy();" class="myBtn"><em>发布</em></a>
			<a href="javascript:unpublishDy();" class="myBtn"><em>取消发布</em></a>
		</div>
		${dy.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		function sltAllDy(){
			if($("#sltAll").attr("checked")){
				$("input[name='dyIds']").attr("checked",true);
			}else{
				$("input[name='dyIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("dyIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addDy(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'ac_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'dynamic/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editDy(){
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
					id:'dy_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'dynamic/toEdit.html?dyId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delDy(){
			list=load_check();
			if(list.length>0){
				var url = "dynamic/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setDy(){
			list=load_check();
			if(list.length>0){
				var url = "dynamic/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetDy(){
			list=load_check();
			if(list.length>0){
				var url = "dynamic/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function publishDy(){
			list=load_check();
			if(list.length>0){
				var url = "dynamic/publish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishDy(){
			list=load_check();
			if(list.length>0){
				var url = "dynamic/unpublish.html?list="+list;
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
			$("#dyForm").submit();
		}
		
	</script>
</body>
</html>