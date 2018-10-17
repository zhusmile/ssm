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
				<td align="left">关于媒体的上传需要注意的有：（1）所上传的文件全部为预览图，必须为图片。（2）所上传图片的尺寸为500×290！（3）视频只有展示顺序最小的那个会在前台播放！（4）前台首页展示的是已置顶的排序值最小的几条数据。（5）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="media.html" method="post" name="mediaForm" id="mediaForm">
		<div class="search_div">
		媒体名称:<input type="text" name="mName" id="nameForSearch" value="${media.mName }" style="width:100px"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllMedia()"/></th>
			<th>媒体名称</th>
			<th>业务类型</th>
			<th>媒体类型</th>
			<th>链接</th>
			<th>排序</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty mList}">
				<c:forEach items="${mList}" var="media" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="mIds" id="mIds${media.mId }" value="${media.mId }"/></td>
				<td>${media.mName }</td>
				<td>
					<c:if test='${media.mType1==0 }'>创响中国</c:if>
					<c:if test='${media.mType1==1 }'>双创活动周</c:if>
				</td>
				<td>
					<c:if test='${media.mType2==0 }'>图片</c:if>
					<c:if test='${media.mType2==1 }'>视频</c:if>
				</td>
				<td>${media.mLink }</td>
				<td>${media.mOrder }</td>
				<td>
					<c:if test='${media.mSetTop==0 }'>置顶</c:if>
					<c:if test='${media.mSetTop==1 }'>未置顶</c:if>
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
			<a href="javascript:addMedia();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editMedia();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delMedia();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setMedia();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetMedia();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${media.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllMedia(){
			if($("#sltAll").attr("checked")){
				$("input[name='mIds']").attr("checked",true);
			}else{
				$("input[name='mIds']").attr("checked",false);
			}
		}
		function search(){
			$("#mediaForm").submit();
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("mIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addMedia(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'media_new',
				width:600,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'media/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editMedia(){
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
					id:'media_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'media/toEdit.html?mId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delMedia(){
			list=load_check();
			if(list.length>0){
				var url = "media/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setMedia(){
			list=load_check();
			if(list.length>0){
				var url = "media/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetMedia(){
			list=load_check();
			if(list.length>0){
				var url = "media/unsetTop.html?list="+list;
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