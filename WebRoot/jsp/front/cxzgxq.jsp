<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>双创</title>
    <link rel="stylesheet" href="../css/dtxq.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/headandfooter.css">
</head>
<body>
<div class="main">
<jsp:include page="head.jsp" flush="true"/>
    <div class="center">
        <div class="index">
            <a class="ind1" href="home.html">首页</a>
            <a href="cxzg.html">创响中国</a>
            <a>创响中国详情</a>
        </div>
        <div class="dtxq-article-container">
            <div class="dtxq-title-container">
                <p class="tongji">
                    <label class="label1 gray" id="dtxq-laiyuan">来源:${cxzgxq.aSource }</label>
                    <label class="label2 gray" id="dtxq-date"><fmt:formatDate value="${cxzgxq.aPublishTime}" pattern="yyyy-MM-dd"/></label>
                    <label class="label4 gray" id="dtxq-num">浏览量：<span>${cxzgxq.aPageView+1 }</span></label>
                    <label class="bdsharebuttonbox label3 bdshare-button-style0-16" data-tag="share_1" data-bd-bind="1537171533950">
                        <span>分享到</span>
                        <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                        <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    </label>
                </p>
                <p class="biaoti" id="dtxq-title">${cxzgxq.aTitle }</p>
            </div>
            <div class="dtxq-article-content">
                <!-- <div style="text-align: center;"><img src="images/cxzg_lunbotu1.png" style="display: inline-block;" id="dtxq-img"></div> -->
                <div id="dtxq-content" style="min-height: 200px;position: relative;">${cxzgxq.aContent }</div>
            </div>
            <!-- 			<div class="dtxq-xgdt-container">
                <div class="aboutDT">相关动态</div>
                <ul class="xiangguang" id="xg-list">

                </ul>
            </div> -->
        </div>
    </div>
<jsp:include page="footer.jsp" flush="true"/>
</div>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>

<script>
    $(".fix li").mouseover(function(){
        $(this).children("img").css("display","block")
    })
    $(".fix li").mouseout(function(){
        $(this).children("img").css("display","none")
    })
    $(".headNav a").mouseover(function(){
        $(this).children("i").css("display","block")
    })
    $(".headNav a").mouseout(function(){
        $(this).children("i").css("display","none")
    })
</script>
</html>