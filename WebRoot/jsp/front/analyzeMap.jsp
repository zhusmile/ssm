<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策分析</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/baseCon.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">

</head>
<body>
<jsp:include page="head.jsp" flush="true"></jsp:include>
<div class="analyze"> 		
		<div class="eacher" id="queryGraph"></div>	
		<ul class="queryCate" id="policyTab">
			<li class="current tabTit2">政策关注度</li>  
		    <li class="tabTit1">双创活跃度</li>                   
            <li class="tabTit3">政策数量分布</li>
        </ul>
		<div class="policyTop">
	        <p class="topTitle" id="hotTop5Name"></p>
	        <ul class="topInfo" id="hotTop5Content">
	        	<!--<li><a href="">测试信息</a></li>-->
	        </ul>
	    </div>
	    <ul class="queryMax clearfix">
            <li>
                <p class="title">年度最火政策</p>
                <ul class="maxList" id="yearHotPolicyList">
                	<!--<li><i></i><p><a href="">测试信息</a></p></li>-->
                </ul>
            </li>
            <li>
                <p class="title">季度最火政策</p>
                <ul class="maxList" id="quarterHotPolicyList">
                	<!--<li><i></i><p><a href="">测试信息</a></p></li>-->
                </ul>
            </li>
            <li>
                <p class="title">月度最火政策</p>
                <ul class="maxList" id="monthHotPolicyList">
                	<!--<li><i></i><p><a href="">测试信息</a></p></li>-->
                </ul>
            </li>
            <li class="end">
                <p class="title">周度最火政策</p>
                <ul class="maxList" id="weekHotPolicyList">
                	<!--<li><i></i><p><a href="">测试信息</a></p></li>-->
                </ul>
            </li>
        </ul>
   </div>
   <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
   	<script type="text/javascript" src="../js/common.js"></script>
   		<script type="text/javascript" src="../js/analyzeMap.js"></script>
   <script type="text/javascript" src="../js/headerFooterIndex.js"></script>
   
   
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>