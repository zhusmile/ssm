<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动跟踪</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/policyKu.css">
</head>
<body>
	<div class="main">
		<jsp:include page="head.jsp" flush="true"/>
		<div class="quanchuanggai" id="banner"><img src="http://sccs.youedata.com/SCData/BannerImg/imgFolder/e83db4fa-d242-4b8b-a0db-1acc8d5d0c5f.png"></div>
		<div class="actList">			
			<!--<div class="tabs" style="padding:10px 0 4px 30px;">
				<ul>
					<li><a class="current tabFir" >主要活动</a></li>
					<li><a href="#buwei">部委</a></li>
					<li><a href="#diqu">地方</a></li>
					<li><a href="#jidi">基地</a></li>
					<li><a href="#tuanti">社会团体</a></li>
				</ul>
			</div>-->
			<div class="mainActi">
				<h2 class="acttit anchor-item" id="zyhd">主要活动</h2>
				<div class="pTopBot fix">
					<div class="actiBox fl">
						<a href="cxzg.html"><img src="../images/front/hdgz1.png"></a>
						<ul id="ccn"></ul>
					</div>
					<div class="actiBox actiBox2 fr">
						<a href="scz.html"><img src="../images/front/hdgz2.png"></a>
						<ul id="scz"></ul>
					</div>
				</div>
				<div class="load-more-wrapper" style="display: none;">
					<div class="load-more-btn">
						<img src="../images/front/hdgz_more_arrow.png">
						<span>点击查看更多</span>
					</div>
				</div>	
				<div class="tbConBox" id="buwei">
					<h2 class="acttit pl30 anchor-item" id="buwei">部委</h2>
					<div class="ConBoxDet">
						<!--<a href="">
							<img src="images/temp/buweiImg1.png">
							<p>中国创新创业大赛中国创新创业大赛中国创新创业大赛</p>
							<em>北京</em>
						</a>-->
					 </div>
					<div class="load-more-wrapper" style="display: block;">
						<div class="load-more-btn" id="buwei-more">
							<img src="../images/front/hdgz_more_arrow.png">
							<span>点击查看更多</span>
						</div>
					</div>				
				</div>
				<div class="tbConBox" id="diqu">
					<h2 class="acttit pl30 anchor-item" id="difang">地方</h2>
					<div class="ConBoxDet">
						<!--<a href="">
							<img src="images/temp/buweiImg1.png">
							<p>中国创新创业大赛中国创新创业大赛中国创新创业大赛</p>
							<em>北京</em>
						</a>-->
					</div>
					<div class="load-more-wrapper" style="display: block;">
						<div class="load-more-btn" id="difang-more">
							<img src="../images/front/hdgz_more_arrow.png">
							<span>点击查看更多</span>
						</div>
					</div>	
				</div>
				<div class="tbConBox" id="jidi">
					<h2 class="acttit pl30 anchor-item" id="jidi">基地</h2>
					<div class="ConBoxDet">
						<!--<a href="">
							<img src="images/temp/buweiImg1.png">
							<p>中国创新创业大赛中国创新创业大赛中国创新创业大赛</p>
							<em>北京</em>
						</a>-->
					</div>
					<div class="load-more-wrapper" style="display: block;">
						<div class="load-more-btn" id="jidi-more">
							<img src="../images/front/hdgz_more_arrow.png">
							<span>点击查看更多</span>
						</div>
					</div>				
				</div>
				<div class="tbConBox" id="tuanti">
					<h2 class="acttit anchor-item" id="shtt">社会团体</h2>
					<div class="ConBoxDet">
						<!--<a href="">
							<img src="images/temp/buweiImg1.png">
							<p>中国创新创业大赛中国创新创业大赛中国创新创业大赛</p>
							<em>北京</em>
						</a>-->
					</div>
					<div class="load-more-wrapper" style="display: block;">
						<div class="load-more-btn" id="tuanti-more">
							<img src="../images/front/hdgz_more_arrow.png">
							<span>点击查看更多</span>
						</div>
					</div>				
				</div>
			</div>
			<!-- 右侧导航栏 -->
			<ul class="right-nav-container" style="position: fixed; margin-left: 1200px; top: 30px;">
				<li class=""><a href="#zyhd"><img src="../images/front/hdgzr_01.png" class="right-nav-img"><img src="../images/front/hdgzr_active_01.png" class="right-nav-img-active"></a></li>
				<li class=""><a href="#buwei"><img src="../images/front/hdgzr_02.png" class="right-nav-img"><img src="../images/front/hdgzr_active_02.png" class="right-nav-img-active"></a></li>
				<li class=""><a href="#difang"><img src="../images/front/hdgzr_03.png" class="right-nav-img"><img src="../images/front/hdgzr_active_03.png" class="right-nav-img-active"></a></li>
				<li><a href="#jidi"><img src="../images/front/hdgzr_04.png" class="right-nav-img"><img src="../images/front/hdgzr_active_04.png" class="right-nav-img-active"></a></li>
				<li><a href="#shtt"><img src="../images/front/hdgzr_05.png" class="right-nav-img"><img src="../images/front/hdgzr_active_05.png" class="right-nav-img-active"></a></li>
				<div class="goTop"><a><img src="../images/front/hdgzr_06.png" class="right-nav-img"><img src="../images/front/hdgzr_active_06.png" class="right-nav-img-active"></a></div>
			</ul>
		</div>
		<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="../js/activeAfter.js"></script>
		<script type="text/javascript" src="../js/headerFooterIndex.js"></script>
		
		<jsp:include page="footer.jsp" flush="true"/>
	</div>
</body>
</html>