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
				<td align="left">（1）所上传的文件全部为预览图，必须为图片。（2）所上传图片的尺寸为150×150！（3）前台首页展示的是已发布已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="guest.html" method="post" name="guestForm" id="guestForm">
	<div class="search_div">
		标题:<input type="text" name="gTitle" style="width:100px"/>
		发布标识:<select name="gPublish" id="gPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="gSetTop" id="gSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllGuest()"/></th>
			<th>标题</th>
			<th>所属活动类别</th>
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
			<c:when test="${not empty guestList}">
				<c:forEach items="${guestList}" var="g" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="gIds" id="gIds${g.gId }" value="${g.gId }"/></td>
				<td>${g.gTitle }</td>
				<td>${g.gTypeName }</td>
				<td>${g.gIssuer }</td>
				<td><fmt:formatDate value="${g.gPublishTime}" pattern="yyyy-MM-dd"/></td>				
				<td><fmt:formatDate value="${g.gCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td id="1111">${g.gModifier }</td>
				<td><fmt:formatDate value="${g.gModifyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${g.gOrder }</td>
				<td>
					<c:if test='${g.gSetTop==0 }'>置顶</c:if>
					<c:if test='${g.gSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${g.gPublish==0 }'>已发布</c:if>
					<c:if test='${g.gPublish==1 }'>未发布</c:if>
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
			<a href="javascript:addGuest();" class="myBtn"><em>发布</em></a>
			<a href="javascript:editGuest();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delGuest();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setGuest();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetGuest();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:unpublishGuest();" class="myBtn"><em>撤回</em></a>
		</div>
		${guest.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllGuest(){
			if($("#sltAll").attr("checked")){
				$("input[name='gIds']").attr("checked",true);
			}else{
				$("input[name='gIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("gIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addGuest(){
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
				page:'guest/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editGuest(){
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
					page:'guest/toEdit.html?gId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delGuest(){
			list=load_check();
			if(list.length>0){
				var url = "guest/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setGuest(){
			list=load_check();
			if(list.length>0){
				var url = "guest/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetGuest(){
			list=load_check();
			if(list.length>0){
				var url = "guest/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishGuest(){
			list=load_check();
			if(list.length>0){
				var url = "guest/unpublish.html?list="+list;
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
			$("#guestForm").submit();
		}
		
	</script>
</body>
</html>