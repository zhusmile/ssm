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
				<td>广告位图片的大小为1000*80，请上传符合条件的图片，否则将无法显示！如果链接是其他网站请以http://开头！

				</td>
			</tr>
		</table>
	</div>
	<form action="advert.html" method="post" name="advertForm" id="advertForm">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllad()"/></th>
			<th>名称</th>
			<th>链接</th>
			<th>路径</th>
			<th>插入用户</th>
			<th>插入时间</th>
			<th>更新用户</th>
			<th>更新时间</th>
			<th>排序</th>
			<th>置顶</th>
		</tr>
		<c:choose>
			<c:when test="${not empty adList}">
				<c:forEach items="${adList}" var="ad" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1 }</td>
				<td><input type="checkbox" name="adIds" id="adIds${ad.adId }" value="${ad.adId }"/></td>
				<td>${ad.adName }</td>
				<td>${ad.adLink }</td>
				<td>${ad.adSrc }</td>
				<td>${ad.adIssuer }</td>
				<td><fmt:formatDate value="${ad.adAddTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ad.adModifier }</td>
				<td><fmt:formatDate value="${ad.adChangeTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ad.adOrder }</td>
				<td>
					<c:if test='${ad.adSetTop==1 }'>置顶</c:if>
					<c:if test='${ad.adSetTop==2 }'>未置顶</c:if>
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
			<a href="javascript:addAd();" class="myBtn"><em>新增</em></a>
			<a href="javascript:editAd();" class="myBtn"><em>修改</em></a>
			<a href="javascript:delAd();" class="myBtn"><em>删除</em></a>
			<a href="javascript:setAd();" class="myBtn"><em>置顶</em></a>
			<a href="javascript:unsetAd();" class="myBtn"><em>取消置顶</em></a>
		</div>
		${ad.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllad(){
			if($("#sltAll").attr("checked")){
				$("input[name='adIds']").attr("checked",true);
			}else{
				$("input[name='adIds']").attr("checked",false);
			}
		}
		function load_check(){
			//获取id的数组
		     obj = document.getElementsByName("adIds");
		     checkval = [];
		     for(k in obj){
		         if(obj[k].checked)
		             checkval.push(obj[k].value);
		     }
		     console.log(checkval);
		     return checkval;
		}
		function addAd(){
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
				page:'advert/toAdd.html?'
				});
    		dg.ShowDialog();
		}
		function editAd(){
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
					page:'advert/toEdit.html?adId='+list[0]
					});
	    		dg.ShowDialog();
			}
		}
		function delAd(){
			list=load_check();
			if(list.length>0){
				var url = "advert/delete.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}
		}
		function setAd(){
			list=load_check();
			if(list.length>0){
				var url = "advert/setTop.html?list="+list;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}else{
				alert("至少选择一条记录");
			}

		}
		function unsetAd(){
			list=load_check();
			if(list.length>0){
				var url = "advert/unsetTop.html?list="+list;
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