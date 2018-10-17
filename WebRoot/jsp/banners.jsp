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
				<td>（1）图片的大小为1920×400，除了首页，其余的Banner图片只会在前台展示排序最小的那一张。（2）前台首页展示的是已置顶的排序值最小的几条数据。（3）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="banner.html" method="post" name="bannerForm" id="bannerForm">
	<div class="search_div">
		名称：<input type="text" name="bannerName" id="nameForSearch" value="${banner.bannerName }" style="width:100px"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
		<a href="javascript:clear();" class="myBtn"><em>重置</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th></th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllBanner()"/></th>
			<th>名称</th>
			<th>类型</th>
			<th>链接</th>
			<th>发布人</th>
			<th>发布时间</th>
			<th>修改人</th>
			<th>修改时间</th>
			<th>排序</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty bannerList}">
				<c:forEach items="${bannerList}" var="banner" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="bannerIds" id="bannerIds${banner.bannerId }" value="${banner.bannerId }"/></td>
				<td>${banner.bannerName }</td>
				<td>${banner.bannerType }</td>
				<td>${banner.bannerLink }</td>
				<td>${banner.issuer }</td>
				<td><fmt:formatDate value="${banner.addTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${banner.modifier }</td>
				<td><fmt:formatDate value="${banner.changeTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${banner.bannerOrder }</td>
				<td>
					<c:if test='${banner.bannerSet==1 }'>置顶</c:if>
					<c:if test='${banner.bannerSet==2 }'>未置顶</c:if>
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
			<a href="javascript:addBanner();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editBanner();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delBanner();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setBanner();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetBanner();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${banner.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllBanner(){
			if($("#sltAll").attr("checked")){
				$("input[name='bannerIds']").attr("checked",true);
			}else{
				$("input[name='bannerIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("bannerIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addBanner(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'banner_new',
				width:600,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'banner/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		
		function editBanner(){
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
					id:'banner_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'banner/toEdit.html?bannerId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delBanner(){
			list=load_check();
			if(list.length>0){
				var url = "banner/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setBanner(){
			list=load_check();
			if(list.length>0){
				var url = "banner/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetBanner(){
			list=load_check();
			if(list.length>0){
				var url = "banner/unsetTop.html?list="+list;
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
			$("#bannerForm").submit();
		}
		
	</script>
</body>
</html>