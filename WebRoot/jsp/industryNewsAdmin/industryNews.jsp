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
				<td>八大产业信息管理:首页默认不显示此栏目的缩略图
				</td>
			</tr>
			
		</table>
	</div>
	<form action="industryNews.html" method="post" name="industryNewsForm" id="industryNewsForm">
	<div class="search_div">
		标题:<input type="text" name="inTitle" value="${industryNews.inTitle }">
		类别:<select name="inType" id="inType">
				<option value="">请选择</option>
				<option value="1">节能环保产业</option>
				<option value="2">新一代信息技术</option>
				<option value="3">生物产业</option>
				<option value="4">高端装备制造业</option>
				<option value="5">新能源产业 </option>
				<option value="6">新材料产业</option>
				<option value="7">新能源汽车</option>
				<option value="8">数字创意</option>
			</select>
		发布标识:<select name="inPublish" id="inPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="inSetTop" id="inSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllNews()"/></th>
			<th>类别</th>
			<th>标题</th>
			<th>简介</th>
			<th>发布时间</th>
			<th>创建时间</th>
			<th>修改时间</th>
			<th>排序</th>
			<th>发布标识</th>
			<th>置顶</th>
			<th>来源</th>
		</tr>
		<c:choose>
			<c:when test="${not empty industryNewsList}">
				<c:forEach items="${industryNewsList}" var="industryNews" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="newsIds" id="newsIds${industryNews.inId }" value="${industryNews.inId }"/></td>
				<td><c:if test="${industryNews.inType==1 }">节能环保产业</c:if>
					<c:if test="${industryNews.inType==2 }">新一代信息技术</c:if>
					<c:if test="${industryNews.inType==3 }">生物产业</c:if>
					<c:if test="${industryNews.inType==4 }">高端装备制造业</c:if>
					<c:if test="${industryNews.inType==5 }">新能源产业</c:if>
					<c:if test="${industryNews.inType==6 }">新材料产业</c:if>
					<c:if test="${industryNews.inType==7 }">新能源汽车</c:if>
					<c:if test="${industryNews.inType==8 }">数字创意</c:if>
				</td>
				<td>${industryNews.inTitle }</td>
				<td>${industryNews.inAbstract }</td>
				<td><fmt:formatDate value="${industryNews.inPublishTime }" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${industryNews.inCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${industryNews.inModifyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${industryNews.inOrder }</td>
				<td>
					<c:if test='${industryNews.inSetTop==0 }'>置顶</c:if>
					<c:if test='${industryNews.inSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${industryNews.inPublish==0 }'>已发布</c:if>
					<c:if test='${industryNews.inPublish==1 }'>未发布</c:if>
				</td>
				<td>${industryNews.inSource }</td>
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
			<a href="javascript:addNews();" class="myBtn"><em>添加</em></a>
			<a href="javascript:editNews();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delNews();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setTopNews();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetTopNews();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:setPublishNews();" class="myBtn"><em>发布</em></a>
			<a href="javascript:unsetPublishNews();" class="myBtn"><em>取消发布</em></a>
		</div>
		${industryNews.page.pageStr }
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
			$("#industryNewsForm").submit();
		}
		function sltAllNews(){
			if($("#sltAll").attr("checked")){
				$("input[name='newsIds']").attr("checked",true);
			}else{
				$("input[name='newsIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("newsIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addNews(){
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
				page:'industryNews/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editNews(){
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
					page:'industryNews/toEdit.html?inId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delNews(){
			list=load_check();
			if(list.length>0){
				var url = "industryNews/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setTopNews(){
			list=load_check();
			if(list.length>0){
				var url = "industryNews/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetTopNews(){
			list=load_check();
			if(list.length>0){
				var url = "industryNews/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setPublishNews(){
			console.log("publish")
			list=load_check();
			if(list.length>0){
				var url = "industryNews/publish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unsetPublishNews(){
			console.log("unpublish")
			list=load_check();
			if(list.length>0){
				var url = "industryNews/unpublish.html?list="+list;
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