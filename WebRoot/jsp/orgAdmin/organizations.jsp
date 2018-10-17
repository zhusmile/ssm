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
			<c:if test="${code==1 }">
			<tr>
				<td>金融机构：前台需要上传图片来展示
				</td>
			</tr>
			</c:if>
		</table>
	</div>
	<form action="org.html" method="post" name="orgForm" id="orgForm">
	<input type="hidden" name="code" id="code" value="${code }"/>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllOrg()"/></th>
			<th>名称</th>
			<th>链接</th>
			<th>路径</th>
			<th>排序</th>
			<th>类别</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty orgList}">
				<c:forEach items="${orgList}" var="org" varStatus="vs">
				<tr class="main_org">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="orgIds" id="orgIds${org.orgId }" value="${org.orgId }"/></td>
				<td>${org.orgName }</td>
				<td>${org.orgLink }</td>
				<td>${org.orgSrc }</td>
				<td>${org.orgOrder }</td>
				<td>${org.orgType }</td>
				<td>
					<c:if test='${org.orgSetTop==1 }'>置顶</c:if>
					<c:if test='${org.orgSetTop==2 }'>未置顶</c:if>
				</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_org">
					<td colspan="10">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addOrg();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editOrg();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delOrg();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setOrg();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetOrg();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${org.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_org:even").addClass("main_table_even");
		});
		
		function sltAllOrg(){
			if($("#sltAll").attr("checked")){
				$("input[name='orgIds']").attr("checked",true);
			}else{
				$("input[name='orgIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("orgIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addOrg(){
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
				page:'org/toAdd.html?code='+$('#code').val()
				});
    		dg.ShowDialog();
		}
		function editOrg(){
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
					page:'org/toEdit.html?orgId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delOrg(){
			list=load_check();
			if(list.length>0){
				var url = "org/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setOrg(){
			list=load_check();
			if(list.length>0){
				var url = "org/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetOrg(){
			list=load_check();
			if(list.length>0){
				var url = "org/unsetTop.html?list="+list;
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