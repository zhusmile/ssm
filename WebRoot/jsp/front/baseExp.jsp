<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>示范基地</title>

<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/acList.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
<style type="text/css">
	.tabs li a{
		width: 200px;
	}
	.tabs .leixing a{
		padding-left: 15px;
	}
</style>
</head>
<body>
<div class="main">
	<jsp:include page="head.jsp" flush="true"/>
	<div class="actList" style="min-height:940px;padding-top:15px;">				
			<!-- 轮播图开始 -->
			<div class="cxzg-video-wrapper">			
				<div class="cxzg-slider-container">
					<ul class="cxzg-slider-body" id="cxzg-slider-body">			    		
			    	</ul>				    	
			    	<div class="prev" id="cxzg-prev"><img src="../images/front/i_prev.png"></div>
			    	<div class="next" id="cxzg-next"><img src="../images/front/i_next.png"></div>
			    	<div class="bottom-bg">
						<ul id="cxzg-title-ul" style="height: 100%;">
							
						</ul>
			    	</div>
			    	<div class="up_focus" id="cxzg-focus"><span class="on"></span><span></span><span></span></div>
				</div>				
			</div>
			<!-- 轮播图结束 -->
			<h2 class="basetit" style="margin-top:22px;">最新动态</h2>
			<div class="listAll posR">
				<div class="tabs">
					<ul>
						<li><a class="current tabFir" id="quanbu">全部</a></li>
						<li class="pici"><a id="pici-quanbu"><em id="pici-text">批次</em>
							<img style="display:inline-block;padding-left:5px;" src="../images/front/down_arrow_icon.png">
							<div style="width:201px;left:-2px;">
								<b id="buxian" data-value="" class="on">不限</b><br>
								<b id="shoupi" data-value="0">首批</b><br>
								<b id="dierpi" data-value="1">第二批</b>
							</div>
						</a></li>
						<li class="leixing"><a id="leixing-quanbu" style="width: 215px;"><em id="leixing-text">类型</em>
							<img style="display:inline-block;" src="../images/front/down_arrow_icon.png">
							<div style="width:247px;left:-2px;">
								<b id="typebuxian" data-value="" class="on">不限</b><br>
								<b id="type00" data-value="0">区域示范基地</b><br>
								<b id="type01" data-value="2">企业示范基地</b><br>
								<b id="type02" data-value="1">高校和科研院所示范基地</b>
							</div>
						</a></li>
					</ul>
				</div>
				<div class="lisitConAll">
					<div class="listCon" style="display: block;">
						<div id="dtlist" style="min-height: 200px;position: relative;"></div>
						<!--分页-->
						<div id="page"></div>
                        
                        
                        
					</div>
					<!-- <div class="listCon">测试信息tab第2块</div>
					<div class="listCon">测试信息tab第3块</div>
					<div class="listCon">测试信息tab第4块</div>
					<div class="listCon">测试信息tab第5块</div>
					<div class="listCon">测试信息tab第6块</div> -->
				</div>
				<!--<a class="JiDiKu" href="jidiku.html">基地库</a>
				<div class="rightMenu2">
					<a class="baseExp1 condCur" id="huodong-all">全部</a>
					<a class="baseExp2" id="huodong" data-value="Y">活动</a>
					<a class="baseExp3" id="dongtai" data-value="N">动态</a>
				</div>-->
			</div>			
		</div>
	<a class="TopBack" href="#"><span>Top</span></a>
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../js/headerFooterIndex.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../js/imgHandle.js"></script>
	<script type="text/javascript" src="../js/baseExp.js"></script>
	<jsp:include page="footer.jsp" flush="true"/>
</div>
</body>
</html>