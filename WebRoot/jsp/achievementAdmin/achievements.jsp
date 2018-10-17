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
				<td>成果展示管理：添加成果展示需要上传图片，程序会自动截取第一张图片作为置顶到首页时展示的图片，且图片大小一定要符合235*90的倍数！
				</td>
			</tr>
		</table>
	</div>
	<form action="achievement.html" method="post" name="acForm" id="acForm">
	<div class="search_div">
		标题:<input type="text" name="acTitle" id="nameForSearch" value="${ac.acTitle }" style="width:100px"/>
		发布标识:<select name="acPublish" id="acPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="acSetTop" id="acSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllac()"/></th>
			<th>标题</th>
			<th>发布时间</th>
			<th>创建时间</th>
			<th>排序</th>
			<th>发布标识</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty acList}">
				<c:forEach items="${acList}" var="ac" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="acIds" id="acIds${ac.acId }" value="${ac.acId }"/></td>
				<td>${ac.acTitle }</td>
				<td><fmt:formatDate value="${ac.acPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${ac.acCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ac.acOrder }</td>
				<td>
					<c:if test='${ac.acPublish==0 }'>已发布</c:if>
					<c:if test='${ac.acPublish==1 }'>未发布</c:if>
				</td>
				<td>
					<c:if test='${ac.acSetTop==0 }'>置顶</c:if>
					<c:if test='${ac.acSetTop==1 }'>未置顶</c:if>
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
			<a href="javascript:addAc();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editAc();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delAc();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setAc();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetAc();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:publishAc();" class="myBtn"><em>发布</em></a>
			<a href="javascript:unpublishAc();" class="myBtn"><em>取消发布</em></a>
		</div>
		${ac.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllac(){
			if($("#sltAll").attr("checked")){
				$("input[name='acIds']").attr("checked",true);
			}else{
				$("input[name='acIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("acIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addAc(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'ac_new',
				width:600,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'achievement/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editAc(){
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
					id:'ac_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'achievement/toEdit.html?acId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delAc(){
			list=load_check();
			if(list.length>0){
				var url = "achievement/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setAc(){
			list=load_check();
			if(list.length>0){
				var url = "achievement/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetAc(){
			list=load_check();
			if(list.length>0){
				var url = "achievement/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function publishAc(){
			list=load_check();
			if(list.length>0){
				var url = "achievement/publish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishAc(){
			list=load_check();
			if(list.length>0){
				var url = "achievement/unpublish.html?list="+list;
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
			$("#acForm").submit();
		}
		
	</script>
</body>
</html>