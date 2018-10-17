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
				<td>前台默认展示简介，不展示图片，图片可以不上传
				</td>
			</tr>
		</table>
	</div>
	<form action="info.html" method="post" name="infoForm" id="infoForm">
	<input type="hidden" name="code" id="code" value="${code }"/>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllInfo()"/></th>
			<th>名称</th>
			<th>链接</th>
			<th>排序</th>
			<th>类别</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty infoList}">
				<c:forEach items="${infoList}" var="info" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="infoIds" id="infoIds${info.infoId }" value="${info.infoId }"/></td>
				<td>${info.infoName }</td>
				<td>${info.infoLink }</td>
				<td>${info.infoOrder }</td>
				<td>${info.infoType }</td>
				<td>
					<c:if test='${info.infoSetTop==1 }'>置顶</c:if>
					<c:if test='${info.infoSetTop==2 }'>未置顶</c:if>
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
			<a href="javascript:addInfo();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editInfo();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delInfo();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setInfo();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetInfo();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${info.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllInfo(){
			if($("#sltAll").attr("checked")){
				$("input[name='infoIds']").attr("checked",true);
			}else{
				$("input[name='infoIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("infoIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addInfo(){
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
				page:'info/toAdd.html?code='+$('#code').val()
				});
    		dg.ShowDialog();
		}
		function editInfo(){
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
					page:'info/toEdit.html?infoId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delInfo(){
			list=load_check();
			if(list.length>0){
				var url = "info/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setInfo(){
			list=load_check();
			if(list.length>0){
				var url = "info/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetInfo(){
			list=load_check();
			if(list.length>0){
				var url = "info/unsetTop.html?list="+list;
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