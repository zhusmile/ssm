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
				<td align="left">（（1）请为每个展厅上传一张预览图，必须为图片。（2）所上传图片的尺寸为233×170！（3）前台首页展示的是已发布已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="exhibitionRoom.html" method="post" name="exhibitionRoomForm" id="exhibitionRoomForm">
	<div class="search_div">
		标题:<input type="text" name="erTitle" style="width:100px"/>
		发布标识:<select name="erPublish" id="erPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="erSetTop" id="erSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllExhibitionRoom()"/></th>
			<th>标题</th>
			<th>简介</th>
			<th>发布人</th>
			<th>发布时间</th>
			<th>创建时间</th>
			<th>修改人</th>
			<th>修改时间</th>
			<th>排序</th>
			<th>置顶</th>
			<th>发布标识</th>
		</tr>
		<c:choose>
			<c:when test="${not empty exhibitionRoomList}">
				<c:forEach items="${exhibitionRoomList}" var="exhibitionRoom" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="exhibitionRoomIds" id="exhibitionRoomIds${exhibitionRoom.erId }" value="${exhibitionRoom.erId }"/></td>
				<td>${exhibitionRoom.erTitle }</td>
				<td>${exhibitionRoom.erAbstract }</td>
				<td>${exhibitionRoom.erIssuer }</td>
				<td><fmt:formatDate value="${exhibitionRoom.erPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${exhibitionRoom.erCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${exhibitionRoom.erModifier }</td>
				<td><fmt:formatDate value="${exhibitionRoom.erModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${exhibitionRoom.erOrder }</td>
				<td>
					<c:if test='${exhibitionRoom.erSetTop==0 }'>置顶</c:if>
					<c:if test='${exhibitionRoom.erSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${exhibitionRoom.erPublish==0 }'>已发布</c:if>
					<c:if test='${exhibitionRoom.erPublish==1 }'>未发布</c:if>
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
			<a href="javascript:addExhibitionRoom();" class="myBtn"><em>发布</em></a>
			<a href="javascript:editExhibitionRoom();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delExhibitionRoom();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setExhibitionRoom();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetExhibitionRoom();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:unpublishExhibitionRoom();" class="myBtn"><em>撤回</em></a>
		</div>
		${exhibitionRoom.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllExhibitionRoom(){
			if($("#sltAll").attr("checked")){
				$("input[name='exhibitionRoomIds']").attr("checked",true);
			}else{
				$("input[name='exhibitionRoomIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("exhibitionRoomIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addExhibitionRoom(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'exhibitionRoom_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'exhibitionRoom/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editExhibitionRoom(){
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
					id:'exhibitionRoom_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'exhibitionRoom/toEdit.html?mId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delExhibitionRoom(){
			list=load_check();
			if(list.length>0){
				var url = "exhibitionRoom/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setExhibitionRoom(){
			list=load_check();
			if(list.length>0){
				var url = "exhibitionRoom/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetExhibitionRoom(){
			list=load_check();
			if(list.length>0){
				var url = "exhibitionRoom/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishExhibitionRoom(){
			list=load_check();
			if(list.length>0){
				var url = "exhibitionRoom/unpublish.html?list="+list;
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
			$("#exhibitionRoomForm").submit();
		}
		
	</script>
</body>
</html>