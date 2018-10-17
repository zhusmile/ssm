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
				<td align="left">关于政策文本、政策图解、政策解读的上传需要注意的有：（1）所上传的文件全部为png图片。（2）所上传图片的命名规则是按图片展示顺序依次以数字命名（如：1.png，2.png...）
				</td>
			</tr>
		</table>
	</div>
	<form action="policy.html" method="post" name="policyForm" id="policyForm">
	<div>
	<div class="search_div">
		标题:<input type="text" name="pTitle" id="pTitle" style="width:100px"/>
		文号:<input type="text" name="pIndex" id="pIndex" style="width:100px"/>
		区域:<select id="pArea" name="pArea">
				<option value="">请选择</option>
				<c:forEach items="${aList }" var="area">
					<option value="${area.aName }">${area.aName }</option>
				</c:forEach>
			</select>
		是否置顶:<select name="pSetTop" id="pSetTop">
				<option value="">请选择</option>
				<option value="0">置顶</option>
			    <option value="1">未置顶</option>
			   </select>
	</div>
	<div class="search_div">
		行业:<select id="pIndustry" name="pIndustry">
				<option value="">请选择</option>
				<c:forEach items="${iList }" var="industry">
					<option value="${industry.iName }">${industry.iName }</option>
				</c:forEach>
			</select>
		主题分类:<select id="pTheClassfication" name="pTheClassfication">
				<option value="">请选择</option>
				<c:forEach items="${sList }" var="s">
					<option value="${s.sName }">${s.sName }</option>
				</c:forEach>	
			   </select>
		发布单位:<select id="pIssueOrg" id="pIssueOrg">
				<c:forEach items="${inList }" var="in">
					<option value="${in.inName }">${in.inName }</option>
				</c:forEach>
			  </select>
		发布标识:<select name="pPublish" id="pPublish">
			    <option value="">请选择</option>
			    <option value="0">已发布</option>
			    <option value="1">未发布</option>
			  </select>
	</div>
	<div class="search_div">
		时间:<input type="text" name="searchStart" value="<fmt:formatDate value="${p.searchStart}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="searchEnd" value="<fmt:formatDate value="${p.searchEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	</div>
	<div  style="overflow-x:scroll;">
		<table width="150%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllPolicy()"/></th>
			<th>标题</th>
			<th>发文字号</th>
			<th>发布机构</th>
			<th>发布人</th>
			<th>发布时间</th>
			<th>修改时间</th>
			<th>政策主题</th>
			<th>生态圈关键字</th>
			<th>时间轴阶段</th>
			<th>政策隶属</th>
			<th>区域</th>
			<th>创业人群</th>
			<th>创业服务</th>
			<th>行业</th>
			<th>政策排序</th>
			<th>政策置顶</th>
			<th>发布标识</th>
		</tr>
		<c:choose>
			<c:when test="${not empty pList}">
				<c:forEach items="${pList}" var="p" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="pIds" id="pIds${p.pId }" value="${p.pId }"/></td>
				<td>${p.pTitle }</td>
				<td>${p.pIndex }</td>
				<td>${p.pIssueOrg }</td>
				<td>${p.pIssuer }</td>
				<td><fmt:formatDate value="${p.pIssueTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${p.pModifyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${p.pTheClassfication }</td>
				<td>${p.pEcosphere }</td>
				<td>${p.pTimeAxis }</td>
				<td><c:if test="${p.pBelong==0 }">全部</c:if>
					<c:if test="${p.pBelong==1 }">国家政策</c:if>
					<c:if test="${p.pBelong==2 }">区域政策</c:if>
				</td>
				<td>${p.pArea }</td>
				<td>${p.pEntreGroup }</td>
				<td>${p.pService }</td>
				<td>${p.pIndustry }</td>
				<td>${p.pOrder }</td>
				<td>
					<c:if test='${p.pSetTop==0 }'>已置顶</c:if>
					<c:if test='${p.pSetTop==1 }'>未置顶</c:if>
				</td>
				<td>
					<c:if test='${p.pPublish==0 }'>已发布</c:if>
					<c:if test='${p.pPublish==1 }'>未发布</c:if>
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
	</div>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addPolicy();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editPolicy();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delPolicy();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setPolicy();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetPolicy();" class="myBtn"><em>取消置顶</em></a>
			<a href="javascript:publishPolicy();" class="myBtn"><em>发布</em></a>
			<a href="javascript:unpublishPolicy();" class="myBtn"><em>取消发布</em></a>
		</div>
		${policy.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		function sltAllPolicy(){
			if($("#sltAll").attr("checked")){
				$("input[name='pIds']").attr("checked",true);
			}else{
				$("input[name='pIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("pIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addPolicy(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增',
				id:'ac_new',
				width:850,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'policy/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editPolicy(){
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
					id:'dy_edit',
					width:850,
					height:400,
					iconTitle:false,
					cover:true,
					maxBtn:false,
					resize:false,
					page:'policy/toEdit.html?pId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function clear(){
			$("#nameForSearch").val(null);
		}
		function delPolicy(){
			list=load_check();
			if(list.length>0){
				var url = "policy/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setPolicy(){
			list=load_check();
			if(list.length>0){
				var url = "policy/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetPolicy(){
			list=load_check();
			if(list.length>0){
				var url = "policy/unsetTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function publishPolicy(){
			list=load_check();
			if(list.length>0){
				var url = "policy/publish.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function unpublishPolicy(){
			list=load_check();
			if(list.length>0){
				var url = "policy/unpublish.html?list="+list;
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
			$("#policyForm").submit();
		}
	</script>
</body>
</html>