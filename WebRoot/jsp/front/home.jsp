<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>双创</title>
<link rel="stylesheet" href="../css/home.css">
<link rel="stylesheet" href="../css/common.css">
</head>
<body>
<div class="main">
    <div class="headAll">
        <div class="header">
            <a class="iBlock" href="home.html"><img src="../images/front/logo.png"></a>
            <div class="searchBox fr">
                <form class="search" action="" method="post">
                    <input class="sWord" type="text" placeholder="站内搜索" id="search-input">
                    <input class="sBtn" name="Submit" value="" id="search-btn">
                </form>
                <ul class="fix">
                    <li class="mobile"><img src="../images/front/mobileMa.png"></li>
                    <li class="weixin" >
                        <img src="${weixin.codeSrc }" width="120px">
                    </li>
                    <li class="sina">
                        <img src="${weibo.codeSrc }" width="120px">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="headNav">
        <div>
            <a href="home.html">首页</a>
            <a href="policyKu.html">政策库<i id="gozcdt">政策动态</i><i class="navindex2" id="gozck">政策查询</i></a>
            <a href="analyzeMap.html">政策分析</a>
            <a href="baseExp.html">示范基地<i id="gojddt">基地动态</i><i class="navindex2" id="jdk">基地库</i></a>
            <a href="activeAfter.html">活动跟踪</a><a href="serviceOver.html">服务拓展</a>
            <a class="navLineNo" href="word.html">建言献策</a>
        </div>
    </div>
    <div id="slide-container" class="slide-container">
    <input type="hidden" name="dynamicCount" value="10" id="dynamicCount">
        <div class="banner" id="banner">
			
        </div>
        <a href="javascript:void (0)" class="button" id="prev"></a>
        <a href="javascript:void (0)" class="button" id="next"></a>
        <div class="dots" id="dots">
            <span class="dots-active"></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="center">
        <div class="main-container">
            <!-- 双创动态开始 -->
            <div class="scdt-container">
                <!-- <div class="index-public-title">
                    <a href="dongTaiList.html">最新动态</a>
                </div> -->
                <div class="top">
                    <div class="buwei">
                        <div class="dt-title">
                            <div class="label">
                                <div class="img-wrapper"><img src="../images/front/buwei.png"></div>
                                <label>部委</label>
                            </div>
                            <a href="dongTaiList.html?type=0" class="more-link">更多<div class="img-wrapper"><img src="../images/front/more_icon.png"></div></a>
                        </div>
                        <ul class="buwei-list" id="buwei-list">

                        </ul>
                    </div>
                    <div class="shoulu">
                        <div class="title">
                            <div class="img-wrapper"><img src="../images/front/shoulu_icon.png"></div>
                            <label>热门</label>
                        </div>
                        <div class="shoulu-container" style="height: 311px;">
                            <!-- <div class="shoulu-item" id="shoulu-item1">
                                <div class="img-wrapper"><img src="images/zhengce_icon.png"></div>
                            </div>
                            <div class="shoulu-item" id="shoulu-item2">
                                <div class="img-wrapper"><img src="images/dongtai_icon.png"></div>
                            </div>
                            <div class="shoulu-item" id="shoulu-item3">
                                <div class="img-wrapper"><img src="images/jidi_icon.png"></div>
                            </div> -->
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <ul class="container">
                        <li class="dongtai-bottom-item">
                            <div class="dt-title">
                                <div class="label">
                                    <div class="img-wrapper"><img src="../images/front/difang.png"></div>
                                    <label>地方</label>
                                </div>
                                <a href="dongTaiList.html?type=1" class="more-link">更多<div class="img-wrapper"><img src="../images/front/more_icon.png"></div></a>
                            </div>
                            <ul class="dongtai-bottom-item-list" id="difang-list">

                            </ul>
                        </li>
                        <li class="dongtai-bottom-item">
                            <div class="dt-title">
                                <div class="label">
                                    <div class="img-wrapper"><img src="../images/front/tuanti.png"></div>
                                    <label>社会团体</label>
                                </div>
                                <a href="dongTaiList.html?type=3" class="more-link">更多<div class="img-wrapper"><img src="../images/front/more_icon.png"></div></a>
                            </div>
                            <ul class="dongtai-bottom-item-list" id="shtt-list">

                            </ul>
                        </li>
                        <li class="dongtai-bottom-item">
                            <div class="dt-title">
                                <div class="label">
                                    <div class="img-wrapper"><img src="../images/front/jidi.png"></div>
                                    <label>基地</label>
                                </div>
                                <a href="dongTaiList.html?type=2" class="more-link">更多<div class="img-wrapper"><img src="../images/front/more_icon.png"></div></a>
                            </div>
                            <ul class="dongtai-bottom-item-list" id="jidi-list">

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 双创动态结束 -->
            <!-- 双创专题开始 -->
            <div class="sczt-container">
                <div class="index-public-title">
                    <a href="javascript:;">专题专栏</a>
                </div>
                <div class="content">
                    <div class="left">
                        <div class="img-wrapper"><a href=""><img src="../images/front/zhuanti1.png"></a></div>
                        <ul class="zhuanti1-list" id="qcg-index">

                        </ul>
                    </div>
                    <div class="right">
                        <div class="img-wrapper"><a href=""><img src="../images/front/zhuanti2.png"></a></div>
                        <ul class="zhuanti1-list" id="zxx-index">
								
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 双创专题结束 -->
            <div class="zc-fx-container">
                <!-- 最新政策开始 -->
                <div class="zc-container">
                    <div class="index-public-title">
                        <a href="zhengceku.html">最新政策</a>
                    </div>
                    <div class="title">
                        <div class="tab-btn-wrapper">
                            <div class="tab-btn active" id="xinzheng-buwei">部委
                            </div><div class="tab-btn" id="xinzheng-difang">地方</div>
                        </div>
                        <a href="javascript:;" class="more-link" id="zxzc-more-link">更多<div class="img-wrapper"><img src="../images/front/more_icon.png"></div></a>
                    </div>
                    <ul class="xinzheng-list" id="xinzheng-list">

                    </ul>
                </div>
                <!-- 最新政策结束 -->
                <!-- 政策分析开始 -->
                <div class="fx-container">
                    <div class="index-public-title">
                        <a href="analyzeMap.html">政策分析</a>
                    </div>
                    <div class="title-wrapper">
                        <div class="title">月度政策热点</div>
                    </div>
                    <ul class="zhengce-hot-list" id="zhengce-hot-list">

                    </ul>
                </div>
                <!-- 政策分析结束 -->
            </div>
            <!-- 双创活动开始 -->
            <div class="schd-container">
                <div class="index-public-title">
                    <a href="activeAfter.html">活动跟踪</a>
                </div>
                <div class="title">
                    <div class="tab-btn-wrapper" id="schd-tab">
                        <div class="tab-btn active" id="schd-scz">双创周
                        </div><div class="tab-btn" id="schd-cxzg">创响中国</div><!-- <div class="tab-btn">创客中国</div><div class="tab-btn">创新创业大赛</div> -->
                    </div>
                </div>
                <!-- <ul class="schd-tab-btn-list">
                    <li class="active">双创周</li>
                    <li>创响中国</li>
                    <li>创客中国</li>
                    <li>创新创业大赛</li>
                </ul> -->
                <div class="schd-tab-content-list">
                    <div>
                        <ul id="schd-list">

                        </ul>
                    </div>
                </div>
            </div>
            <!-- 双创活动结束 -->
            <!-- 双创服务开始 -->
            <div class="scfw-container">
                <div class="index-public-title">
                    <a href="serviceOver.html">服务拓展</a>
                </div>
                <div class="title">
                    <div class="tab-btn-wrapper" id="fuwu-tab">
                        <div class="tab-btn active">创业者
                        </div><div class="tab-btn">孵化器及众创空间</div>
                    </div>
                </div>
                <div class="fuwu-content" id="fuwu-content">
                    <div class="active">
                        <ul class="fuwu-list">
                            <li>
                                <a href="yhzccx.html">
                                    <div class="img-wrapper"><img src="../images/front/shuishou.png"></div>
                                </a>
                            </li>
                            <li>
                                <a href="zhengceku.html">
                                    <div class="img-wrapper"><img src="../images/front/xwqy.png"></div>
                                </a>
                            </li>
                            <li>
                                <a href="serviceExp.html">
                                    <div class="img-wrapper"><img src="../images/front/jijin.png"></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <ul class="fuwu-list">
                            <li>
                                <a href="serviceAppr.html">
                                    <div class="img-wrapper"><img src="../images/front/fuhuaqi.png"></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 双创服务结束 -->
        </div>
    </div>
    <a class="TopBack"><span>Top</span></a>
    <div></div>
    <div class="footAbout">
        <div align="center" class="foot">
            <img src="../images/front/party.png" style="left: 0;top:30px;">
            <ul>
                <li><a href="" style="border-left:0;">关于本网</a><a href="">网站声明</a><a href="">网站地图</a><a href="">联系我们</a></li>
                <li>主办单位：中华人民共和国国家发展和改革委员会 京ICP备05052393号</li>
                <li>技术支持：国家信息中心 国信优易数据有限公司</li>
                <li>国家发展和改革委员会 版权所有，如需转载，请注明来源</li>
            </ul>
            <img src="../images/front/mobileMa.png" style="position: absolute;right: 0;top:15px;width:95px;">
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>

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
$("#fuwu-tab .tab-btn").click(
	function() {
		console.log("change");
		$("#fuwu-content div").each(
				function() {
					if($(this).is(".active")){
						$(this).removeClass("active")
					}else{
						$(this).addClass("active")
					}
				}
		)
	}
)
/* function ellipsis(str, length) {
        return str.length <= length ? str : (str.substr(0, length) + '...');
} */
function formatDate(number){
	date=new Date(number)
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
 function getDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					if(i<4){
						if(i==0){
							$("#banner").append("<a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"+"<h5 class='title-slide slide-active'>"+data[i].dyTitle+"</h5>"+
							"<div class='banner-slide  slide-active' ><img src='"+data[i].dyImg+"'/></div></a>")
						}else{
							$("#banner").append("<a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"+"<h5 class='title-slide'>"+data[i].dyTitle+"</h5>"+
							"<div class='banner-slide'><img src='"+data[i].dyImg+"'/></div></a>")
						}
					}
				}
			}
		}
	})
} 
function getBuweiDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax1.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					date=new Date(data[i].dyPublishTime)
					$("#buwei-list").append("<li><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
			        +"<div class='left'><img src='"+data[i].dyImg+"'></div>"
			        +"<div class='right'><p class='p1'>"+data[i].dyTitle+"</p>"
			        +"<p class='p2'>"+CF.ellipsis(data[i].dyAbstract,80)+"</p>"
			        +"<p class='p3'><label class='label1'>来源:"+data[i].dySource+"</label>"
			        +"<label class='label2'>"+formatDate(data[i].dyPublishTime)+"</label></p></div></a></li>")
				}
			}
		}
	})
}
function getShouluDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax2.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				$(".shoulu-container").append("<a href='"+data.bannerLink+"'><img id='cover' alt='封面图' src='"+data.bannerSrc+"' style='width: 100%;height: 100%;'></a>")
			}
		}
	})
}
function getDifangDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax3.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					if(i==0){
						$("#difang-list").append("<div class='detail'><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
				        +"<div class='left'><img src='"+data[i].dyImg+"'></div>"
				        +"<div class='right'><p class='p1'>"+CF.ellipsis(data[i].dyTitle,30)+"</p>"
				        +"<p class='p2'><span>"+formatDate(data[i].dyPublishTime)+"</span></p></div></a></div>")
					}else{
						$("#difang-list").append("<li><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
						+"<div class='img-wrapper'><img src='../images/front/list_arrow_icon.png'></div>"
				        +"<p class='content'>"+CF.ellipsis(data[i].dyTitle,20)+"</p><span class='date'>"+formatDate(data[i].dyPublishTime)+"</span></a></li>")
					}
				}
			}
		}
	})
}
function getShttDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax4.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					if(i==0){
						$("#shtt-list").append("<div class='detail'><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
				        +"<div class='left'><img src='"+data[i].dyImg+"'></div>"
				        +"<div class='right'><p class='p1'>"+CF.ellipsis(data[i].dyTitle,30)+"</p>"
				        +"<p class='p2'><span>"+formatDate(data[i].dyPublishTime)+"</span></p></div></a></div>")
					}else{
						$("#shtt-list").append("<li><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
						+"<div class='img-wrapper'><img src='../images/front/list_arrow_icon.png'></div>"
				        +"<p class='content'>"+CF.ellipsis(data[i].dyTitle,20)+"</p><span class='date'>"+formatDate(data[i].dyPublishTime)+"</span></a></li>")
					}
				}
			}
		}
	})
}
function getJidiDt(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax5.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					if(i==0){
						$("#jidi-list").append("<div class='detail'><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
				        +"<div class='left'><img src='"+data[i].dyImg+"'></div>"
				        +"<div class='right'><p class='p1'>"+CF.ellipsis(data[i].dyTitle,30)+"</p>"
				        +"<p class='p2'><span>"+formatDate(data[i].dyPublishTime)+"</span></p></div></a></div>")
					}else{
						$("#jidi-list").append("<li><a href='dtxq.html?id="+data[i].dyId+"' target='_blank'>"
						+"<div class='img-wrapper'><img src='../images/front/list_arrow_icon.png'></div>"
				        +"<p class='content'>"+CF.ellipsis(data[i].dyTitle,20)+"</p><span class='date'>"+formatDate(data[i].dyPublishTime)+"</span></a></li>")
					}
				}
			}
		}
	})
}
function getQCG(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax6.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#qcg-index").append("<li><a href='qcgxq.html?id="+data[i].nId+"' target='_blank'><span>●</span>"+data[i].nTitle+"</a></li>")
				}
			}
		}
	})
}
function getZXX(){
	$.ajax({
		url:"http://localhost:8080/ssm/front/homeajax7.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#zxx-index").append("<li><a href='zxxxq.html?id="+data[i].nId+"' target='_blank'><span>●</span>"+data[i].nTitle+"</a></li>")
				}
			}
		}
	})
}
function getBuweiZc() {
	$("#xinzheng-list").empty()
	console.log("ajax8")
	$.ajax({
			url:"http://localhost:8080/ssm/front/homeajax8.html",
			type:'post',
			success:function(data){
				console.log("success")
				console.log(data)
				if(data!=null){
					for(var i=0;i<data.length;i++){
						$("#xinzheng-list").append("<li><a href='zhengcekuDetail.html?id="+data[i].pId+"' target='_blank'><div class='right'><p class='p1'>"+data[i].pTitle+"</p><p class='p2'>"+CF.ellipsis(data[i].pAbstract,50)+"</p><p class='p3'><label class='label1'>发布单位:"+data[i].pIssueOrg+"</label><label class='label2'>"+formatDate(data[i].pIssueTime)+"</label></p></div></a></li>")
					}
				}
			}
	})
}
$("#xinzheng-buwei").click(
		function () {
			getBuweiZc()
		}
)
$("#xinzheng-difang").click(
	function() {
		$("#xinzheng-list").empty()
		$.ajax({
				url:"http://localhost:8080/ssm/front/homeajax9.html",
				type:'post',
				success:function(data){
					console.log("success")
					if(data!=null){
						console.log(data)
					for(var i=0;i<data.length;i++){
						$("#xinzheng-list").append("<li><a href='zhengcekuDetail.html?id="+data[i].pId+"' target='_blank'><div class='right'><p class='p1'>"+data[i].pTitle+"</p><p class='p2'>"+CF.ellipsis(data[i].pAbstract,50)+"</p><p class='p3'><label class='label1'>发布单位:"+data[i].pIssueOrg+"</label><label class='label2'>"+formatDate(data[i].pIssueTime)+"</label></p></div></a></li>")
					}
				}
			}
		})		
	}
)
function getHotZc(){
		$.ajax({
				url:"http://localhost:8080/ssm/front/homeajax10.html",
				type:'post',
				success:function(data){
					console.log("success")
					if(data!=null){
					for(var i=0;i<data.length;i++){
						html=''
						if(i<3){
							html+='<li><a href="zhengcekuDetail.html?id='+data[i].pId+'" target="_blank"><div class="img-wrapper">';
							html+='<img src="../images/front/hot'+(i+1)+'.png">'
						}else{
							html+='<li><a href="zhengcekuDetail.html?id='+data[i].pId+'" target="_blank"><div class="img-wrapper nohot">';
							html+=(i+1)+'';
						}
            			html+='</div><p class="content">'+data[i].pTitle+'</p></a></li>'
            			$("#zhengce-hot-list").append(html);
					}
				}
			}
		})		
}
function getSCZ() {
	$.ajax({
			url:"http://localhost:8080/ssm/front/homeajax11.html?limit=5",
			type:'post',
			success:function(data){
				console.log("success")
				if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#schd-list").append('<li><a href="javascript:;"></a><div class="img-wrapper"><a href="javascript:;"></a><a href="sczxq.html?id='+data[i].aId+'" class="detail" target="_blank"><img src="'+data[i].aImg+'"></a></div><a href="sczxq.html?id='+data[i].aId+'" class="detail" target="_blank"><p class="content">'+CF.ellipsis(data[i].aTitle,30)+'</p></a></li>')
				}
			}
		}
	})		
}
$("#schd-scz").click(
		function() {
			$("#schd-list").empty();
			getSCZ()
		}
)
function getCXZG() {
	$.ajax({
			url:"http://localhost:8080/ssm/front/homeajax12.html?limit=5",
			type:'post',
			success:function(data){
				console.log("success")
				if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#schd-list").append('<li><a href="javascript:;"></a><div class="img-wrapper"><a href="javascript:;"></a><a href="cxzgxq.html?id='+data[i].aId+'" class="detail" target="_blank"><img src="'+data[i].aImg+'"></a></div><a href="cxzgxq.html?id='+data[i].aId+'" class="detail" target="_blank"><p class="content">'+CF.ellipsis(data[i].aTitle,30)+'</p></a></li>')
				}
			}
		}
	})		
}
$("#schd-cxzg").click(
		function() {
			$("#schd-list").empty();
			getCXZG()
		}
)
$(document).ready(function(){
	console.log("start")
	getDt();
	getBuweiDt();
	getShouluDt();
	getDifangDt();
	getShttDt();
	getJidiDt();
	getQCG();
	getZXX();
	getSCZ();
	getBuweiZc();
	getHotZc();
})

</script>
<script src="../js/sc.js"></script>


</html>