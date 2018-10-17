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
				<td align="left">（1）请为每个活动上传一张预览图，必须为图片。（2）所上传图片的尺寸为292×163！（3）前台首页展示的是已发布已置顶的排序值最小的几条数据。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="activity.html" method="post" name="acForm" id="acForm">
	<div class="search_div">
		活动标题:<input type="text" name="aTitle" style="width:100px"/>
		活动种类:<select name="aType" id="aType">
				<option value="">请选择</option>
				<option value="0">主会场活动</option>
				<option value="1">分会场活动</option>
				<option value="2">部委活动</option>
				<option value="3">创响中国</option>
			  </select>
		所属区域:<select name="aAreaId">
				<option value="">请选择</option>
				<c:choose>
					<c:when test="${not empty areaList }">
						<c:forEach items="${areaList}" var="area" varStatus="vs">
						<option value="${area.aId}">${area.aName }</option>
						</c:forEach>
					</c:when>			
				</c:choose>
		</select>
		发布标识:<select name="aPublish" id="aPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
		置顶:<select name="aSetTop" id="aSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllAc()"/></th>
			<th>活动标题</th>
			<th>活动种类</th>
			<th>所属区域</th>
			<th>活动简介</th>
			<th>发布单位</th>
			<th>发布人</th>
			<th>发布时间</th>
			<th>来源</th>
			<th>创建时间</th>
			<th>修改人</th>
			<th>修改时间</th>
			<th>排序</th>
			<th>置顶</th>
			<th>发布标识</th>
		</tr>
		<c:choose>
			<c:when test="${not empty acList}">
				<c:forEach items="${acList}" var="ac" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="acIds" id="acIds${ac.aId }" value="${ac.aId }"/></td>
				<td>${ac.aTitle }</td>
				<td>
					<c:if test="${ac.aType==0 }">主会场活动</c:if>
					<c:if test="${ac.aType==1 }">分会场活动</c:if>
					<c:if test="${ac.aType==2 }">部委活动</c:if>
					<c:if test="${ac.aType==3 }">创响中国</c:if>
				</td>
				<td>${ac.aAreaName }</td>
				<td>${ac.aDescript }</td>
				<td>${ac.aIssuerName }</td>
				<td>${ac.aIssuer }</td>
				<td><fmt:formatDate value="${ac.aPublishTime}" pattern="yyyy-MM-dd"/></td>
				<td>${ac.aSource }</td>
				<td><fmt:formatDate value="${ac.aCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td id="1111">${ac.aModifier }</td>
				<td><fmt:formatDate value="${ac.aModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ac.aOrder }</td>
				<td>
					<c:if test='${ac.aSetTop==0 }'>置顶</c:if>
					<c:if test='${ac.aSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${ac.aPublish==0 }'>已发布</c:if>
					<c:if test='${ac.aPublish==1 }'>未发布</c:if>
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
			<a href="javascript:addAc();" class="myBtn"><em>发布</em></a>
			<a href="javascript:editAc();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delAc();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setAc();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetAc();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:unpublishAc();" class="myBtn"><em>撤回</em></a>
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
		
		function sltAllAc(){
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
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'activity/toAdd.html?'
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
					page:'activity/toEdit.html?aId='+list[0]
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
				var url = "activity/delete.html?list="+list;
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
				var url = "activity/setTop.html?list="+list;
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
				var url = "activity/unsetTop.html?list="+list;
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
				var url = "activity/unpublish.html?list="+list;
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