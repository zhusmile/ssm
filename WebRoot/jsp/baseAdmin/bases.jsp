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
				<td align="left">（1）编辑之前，请先选择一条记录。（2）示范基地名称不能重复。（3）请为每个示范基地上传3次图片，图片尺寸为1000×375，每次上传一张。（4）排序值越小，显示越靠前。
				</td>
			</tr>
		</table>
	</div>
	<form action="base.html" method="post" name="baseForm" id="baseForm">
	<div class="search_div">
		基地名称:<input type="text" name="bName" style="width:100px"/>
		基地类型:<select name="bType" id="bType">
				<option value="">请选择</option>
				<option value="0">区域示范基地</option>
			    <option value="1">高校和科研院所示范基地</option>
			    <option value="2">企业示范基地</option>
			   </select>
		批次:<select name="bBatch" id="bBatch">
				<option value="">请选择</option>
				<option value="0">首批</option>
			    <option value="1">第二批</option>
			</select>
		置顶:<select name="bSetTop" id="bSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			</select>

		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllBase()"/></th>
			<th>基地名称</th>
			<th>基地类型</th>
			<th>基地批次</th>
			<th>区域</th>
			<th>发布单位</th>
			<th>创建人</th>
			<th>创建时间</th>
			<th>修改人</th>
			<th>修改时间</th>
			<th>排序</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty baseList}">
				<c:forEach items="${baseList}" var="base" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="baseIds" id="baseIds${base.bId }" value="${base.bId }"/></td>
				<td>${base.bName }</td>
				<td><c:if test="${base.bType==0 }">区域示范基地</c:if>
					<c:if test="${base.bType==1 }">高校和科研院所示范基地</c:if>
					<c:if test="${base.bType==2 }">企业示范基地</c:if>
				</td>
				<td><c:if test="${base.bBatch==0 }">首批</c:if>
				<c:if test="${base.bBatch==1 }">第二批</c:if>
				</td>
				<td>${base.bAreaName }</td>
				<td>${base.bIssuerOrgName }</td>
				<td>${base.bCreator }</td>
				<td><fmt:formatDate value="${base.bCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${base.bModifier }</td>
				<td><fmt:formatDate value="${base.bModifyTime  }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${base.bOrder }</td>
				<td>
					<c:if test='${base.bSetTop==0 }'>置顶</c:if>
					<c:if test='${base.bSetTop==1 }'>未置顶</c:if>
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
			<a href="javascript:addBase();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editBase();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delBase();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setBase();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetBase();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${base.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllBase(){
			if($("#sltAll").attr("checked")){
				$("input[name='baseIds']").attr("checked",true);
			}else{
				$("input[name='baseIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("baseIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addBase(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'base_new',
				width:700,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'base/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editBase(){
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
					id:'base_edit',
					width:600,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'base/toEdit.html?bId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delBase(){
			list=load_check();
			if(list.length>0){
				var url = "base/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setBase(){
			list=load_check();
			if(list.length>0){
				var url = "base/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unsetBase(){
			list=load_check();
			if(list.length>0){
				var url = "base/unsetTop.html?list="+list;
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
			$("#baseForm").submit();
		}
		
	</script>
</body>
</html>