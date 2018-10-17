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
				<td>（1）所上传的文件全部为预览图，必须为图片。（2）所上传图片的尺寸为300×160！（3）前台首页展示的是已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="industrialPark.html" method="post" name="ipForm" id="ipForm">
	<div class="search_div">
		名称:<input type="text" name="ipName" id="ipName" value="${ip.ipName }">
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllIp()"/></th>
			<th>名称</th>
			<th>链接</th>
			<th>排序</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty ipList}">
				<c:forEach items="${ipList}" var="ip" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="ipIds" id="ipIds${ip.ipId }" value="${ip.ipId }"/></td>
				<td>${ip.ipName }</td>
				<td>${ip.ipLink }</td>
				<td>${ip.ipOrder }</td>
				<td>
					<c:if test='${ip.ipSetTop==0 }'>置顶</c:if>
					<c:if test='${ip.ipSetTop==1 }'>未置顶</c:if>
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
			<a href="javascript:addIp();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editIp();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delIp();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setIp();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetIp();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${ip.page.pageStr }
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
			$("#ipForm").submit();
		}
		function sltAllIp(){
			if($("#sltAll").attr("checked")){
				$("input[name='ipIds']").attr("checked",true);
			}else{
				$("input[name='ipIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("ipIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addIp(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'ad_new',
				width:600,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'industrialPark/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editIp(){
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
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'industrialPark/toEdit.html?ipId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delIp(){
			list=load_check();
			if(list.length>0){
				var url = "industrialPark/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setIp(){
			list=load_check();
			if(list.length>0){
				var url = "industrialPark/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetIp(){
			list=load_check();
			if(list.length>0){
				var url = "industrialPark/unsetTop.html?list="+list;
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