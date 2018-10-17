<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>动态详情</title>
    <link rel="stylesheet" href="../css/yzhStyle.css">
    <link rel="stylesheet" href="../css/baseDetail.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/headandfooter.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/imgHandle.js"></script>
    <style type="text/css">
			p span {
				font-size: 16px;
			}
			
			p img {
				display: inline-block;
				max-width: 80%;
			}
	</style>
	<script>
	</script>
	<link rel="stylesheet" href="http://bdimg.share.baidu.com/static/api/css/share_style0_16.css?v=8105b07e.css">
	<link rel="stylesheet" href="http://bdimg.share.baidu.com/static/api/css/weixin_popup.css?v=43591908.css"> 
</head>
<body>
<div class="main">
<jsp:include page="head.jsp" flush="true"/>
    <div class="center">
        <div class="index">
            <a class="ind1" href="home.html">首页</a>
            <a href="dongTaiList.html">动态列表</a>
            <a>动态详情</a>
        </div>
        <div class="dtxq-article-container">
            <div class="dtxq-title-container">
                <p class="tongji">
                    <label class="label1 gray" id="dtxq-laiyuan">来源:${dtxq.dySource }</label>
                    <label class="label2 gray" id="dtxq-date"><fmt:formatDate value="${dtxq.dyPublishTime}" pattern="yyyy-MM-dd"/></label>
                    <label class="label4 gray" id="dtxq-num">浏览量：<span>${addcount }</span></label>
                    <label class="bdsharebuttonbox label3 bdshare-button-style0-16" data-tag="share_1" data-bd-bind="1537171533950">
                        <span>分享到</span>
                        <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                        <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    </label>
                </p>
                <p class="biaoti" id="dtxq-title">${dtxq.dyTitle }</p>
            </div>
            <div class="dtxq-article-content">
                <!-- <div style="text-align: center;"><img src="images/cxzg_lunbotu1.png" style="display: inline-block;" id="dtxq-img"></div> -->
                <div id="dtxq-content" style="min-height: 200px;position: relative;">${dtxq.dyContent }</div>
            </div>
            <!-- 			<div class="dtxq-xgdt-container">
                <div class="aboutDT">相关动态</div>
                <ul class="xiangguang" id="xg-list">

                </ul>
            </div> -->
        </div>
    </div>
    
<jsp:include page="footer.jsp" flush="true"/>
<iframe id="bdshare_weixin_qrcode_dialog_bg" class="bd_weixin_popup_bg" style="width: 262px; height: 317px; left: 543.5px; top: 437.5px; display: none;"></iframe>
<div id="bdshare_weixin_qrcode_dialog" class="bd_weixin_popup" data-url="http://103.235.234.108:13108/dtxq.html?id=ff8080816615ceb2016618953430006c#10006-weixin-1-52626-6b3bffd01fdde4900130bc5a2751b6d1" style="left: 543.5px; top: 437.5px; width: 240px; height: 295px; display: none;"><div class="bd_weixin_popup_head"><span>分享到微信朋友圈</span><a href="#"  class="bd_weixin_popup_close">×</a></div><div id="bdshare_weixin_qrcode_dialog_qr" class="bd_weixin_popup_main"><table style="direction:ltr;border: 0; width:205px; border-collapse: collapse;background-color:#fff;margin:0 auto;" align="center"><tbody></tbody></table></div><div class="bd_weixin_popup_foot">打开微信，点击底部的“发现”，<br>使用“扫一扫”即可将网页分享至朋友圈。</div></div>
<iframe frameborder="0" class="bdshare_dialog_bg" style="display:none;"></iframe>
<div class="bdshare_dialog_box" style="display:none;"><div class="bdshare_dialog_top"><a class="bdshare_dialog_close" href="#" onclick="return false;" title="关闭"></a>分享到</div><ul class="bdshare_dialog_list"></ul><div class="bdshare_dialog_bottom"><a href="http://share.baidu.com/" target="_blank;">百度分享</a></div></div>
</div>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script>
$(function(){
	var shareTitle=$("#dtxq-title").html()
	window._bd_share_config={
		common:{
			bdText:shareTitle,
			bdDesc:shareTitle
		},
		share:{
			bdSize:16
		}
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
})
	console.log($("#dtxq-title").html())
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
	$(".bd_weixin_popup_close").click(function close(){
    	console.log("close")
    	$("#bdshare_weixin_qrcode_dialog_bg").css("display","none")
    	$("#bdshare_weixin_qrcode_dialog").css("display","none")
    })
</script>
</html>