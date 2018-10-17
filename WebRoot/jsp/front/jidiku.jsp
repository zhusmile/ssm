<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基地库</title>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/yzhStyle.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/imgHandle.js"></script>

</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div class="center" style="padding-top:15px;">
		<!-- <div class="index">
			<a class="ind1" href="index.html">首页</a>
			<a href="baseExp.html">示范基地</a>
			<a>基地库</a>
		</div> -->
		<div class="main-container">
			<div class="index-public-title jidiku">
				<a href="">基地库</a>
			</div>
			<div class="jidiku-news-container">
				<div class="news-list">
					<ul id="jidiku-news-list-ul" style="min-height: 200px;position: relative;"></ul>
					<div id="jidiku-fenye">
					
					</div>
				</div>
				<div class="news-tab">
					<div class="title">
						<div class="img-wrapper"><img src="../images/front/jidi_icon1.png"></div>
						<label class="label1" id="jidizongshu"></label>
						<label class="label2">基地</label>
					</div>
					<div class="query">
						<p>
							 <span>省份</span>
							 <select class="province" id="baseArea">
							 		<option value="">请选择</option>
							 		<c:choose>
									<c:when test="${not empty areas}">
										<c:forEach items="${areas }" var="area">
											<option value="${area.aId }">${area.aName }</option>
										</c:forEach>
									</c:when>
									</c:choose>
							 </select>
						</p>
						<p>
							<span>基地名称</span>
							<input type="text" id="baseName">
						</p>
						<p class="t-center">
							 <button onclick="jidikuRequest()">查询</button>
						</p>
					</div>
					<div class="news-tab-btn">
						<div class="news-tab-guidao">
							<img src="../images/front/tab_guidao.png">
							<div class="biao hangbiao active"><img src="../images/front/tab_biao.png"></div>
							<div class="biao hangbiao" style="top:102px;"><img src="../images/front/tab_biao.png"></div>
							<div class="biao hangbiao" style="top:230px;"><img src="../images/front/tab_biao.png"></div>
						</div>
						<div class="tab-btn">
							<a class="a1 active" href="javascript:;" id="quanbu">全部</a>
							<a class="a2 jidiku-pici" href="javascript:;" id="quanbu-pici">批次</a>
							<a class="a3 jidiku-pici" href="javascript:;" id="shoupi">首批</a>
							<a class="a4 jidiku-pici" href="javascript:;" id="dierpi">第二批</a>
							<a class="a5 jidiku-leixing" href="javascript:;" id="quanbu-leixing">类型</a>
							<a class="a6 jidiku-leixing" href="javascript:;" id="type00">区域示范基地</a>
							<a class="a7 jidiku-leixing" href="javascript:;" id="type01">高校和科研院所示范基地</a>
							<a class="a8 jidiku-leixing" href="javascript:;" id="type02">企业示范基地</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<a class="TopBack" href="#"><span>Top</span></a>
	<script type="text/javascript" src="../js/headerFooterIndex.js"></script>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/jidiku.js"></script>
<jsp:include page="footer.jsp" flush="true"/>
</body>
<script>
</script>
</html>