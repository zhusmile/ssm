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
				<td align="left">（1）所上传的文件全部为预览图，必须为图片。（2）所上传图片的尺寸为224×170！（3）前台首页展示的是已发布已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="mascot.html" method="post" name="mascotForm" id="mascotForm">
	<div class="search_div">
		标题:<input type="text" name="mTitle" style="width:100px"/>
		发布标识:<select name="mPublish" id="mPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="mSetTop" id="mSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllMascot()"/></th>
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
			<c:when test="${not empty mascotList}">
				<c:forEach items="${mascotList}" var="mascot" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="mascotIds" id="mascotIds${mascot.mId }" value="${mascot.mId }"/></td>
				<td>${mascot.mTitle }</td>
				<td>${mascot.mAbstract }</td>
				<td>${mascot.mIssuer }</td>
				<td><fmt:formatDate value="${mascot.mPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${mascot.mCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${mascot.mModifier }</td>
				<td><fmt:formatDate value="${mascot.mModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${mascot.mOrder }</td>
				<td>
					<c:if test='${mascot.mSetTop==0 }'>置顶</c:if>
					<c:if test='${mascot.mSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${mascot.mPublish==0 }'>已发布</c:if>
					<c:if test='${mascot.mPublish==1 }'>未发布</c:if>
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
			<a href="javascript:addMascot();" class="myBtn"><em>发布</em></a>
			<a href="javascript:editMascot();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delMascot();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setMascot();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetMascot();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:unpublishMascot();" class="myBtn"><em>撤回</em></a>
		</div>
		${moscot.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllMascot(){
			if($("#sltAll").attr("checked")){
				$("input[name='mascotIds']").attr("checked",true);
			}else{
				$("input[name='mascotIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("mascotIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addMascot(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'mascot_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'mascot/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editMascot(){
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
					id:'mascot_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'mascot/toEdit.html?mId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delMascot(){
			list=load_check();
			if(list.length>0){
				var url = "mascot/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setMascot(){
			list=load_check();
			if(list.length>0){
				var url = "mascot/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetMascot(){
			list=load_check();
			if(list.length>0){
				var url = "mascot/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishMascot(){
			list=load_check();
			if(list.length>0){
				var url = "mascot/unpublish.html?list="+list;
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
			$("#mascotForm").submit();
		}
		
	</script>
</body>
</html>