<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务拓展</title>
<link rel="stylesheet" href="../css/serviceOver.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/base.css">
</head>
<body>
	<div class="main">
		<jsp:include page="head.jsp" flush="true"/>
		<div class="center" style="padding-top: 29px;">
            <!-- <div class="index">
                <a class="ind1" href="index.html">首页</a>
                <a>服务拓展</a>
            </div>	 -->
            <div class="list-all">
                <a class="list over">创业者服务</a>
                <a class="list1">孵化器及众创空间服务</a>
            </div>
            <div class="user">
                <h2 class="sertit"><b>创业者服务</b></h2>
                <h3 class="sertit2 sertit2L" style="display: block;">双创时间轴</h3>
                <div class="main-container" style="margin-top:15px;">
                    <div class="soBanner" id="soBanner" style="display: block;">

                    <a href="zhengceku.html?timeStageId=4028d2c354e5ca750154e5cb0b6e0000" class="soBanner1">启动阶段</a><a href="zhengceku.html?timeStageId=4028d2c354e5ca750154e5cb3c2e0001" class="soBanner2">成长阶段</a><a href="zhengceku.html?timeStageId=4028d2c354e5ca750154e5cb678c0002" class="soBanner3">成熟阶段</a><a href="zhengceku.html?timeStageId=4028d2c354e592760154e596410a0000" class="soBanner4">准备阶段</a></div>
                    <h3 class="sertit2">政策服务</h3>
                    <div class="zcservice"><a href="yhzccx.html" class="banner1"><img src="../images/front/shuishou.png"></a><a href="javascript:;" id="xiaoweiqiye"  class="banner1"><img src="../images/front/xwqy.png"></a><a href="serviceExp.html"  class="banner1"><img src="../images/front/jijin.png"></a><a href="serviceAppr.html" style="display:none"  class="banner2"><img src="../images/front/fuhuaqi.png"></a></div>
                    <!-- 办事指南开始 -->
                    <h3 class="sertit2">办事指南</h3>
                    <div class="cxzg-hddt-wrapper pointerS">
                    <ul class="news-list" id="cyzfw" style="padding-left: 15px; display: block;">
                    </ul>
                    <ul class="news-list" id="fhq" style="padding-left: 15px; display: none;"></ul>
                    <div class="load-more-wrapper" id="loading-1" style="display: none;">
                        <div class="load-more-btn">
                            <img src="images/hdgz_more_arrow.png">
                            <span>点击查看更多</span>
                        </div>
                    </div>
                    <div class="load-more-wrapper" id="loading-2" style="display: none;">
                        <div class="load-more-btn">
                            <img src="images/hdgz_more_arrow.png">
                            <span>点击查看更多</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 办事指南结束 -->
        <!-- 		<div class="server" style = "display:none">
            <h2 class="sertit"><b>孵化器及众创空间服务</b></h2>
            <h3 class="sertit2">政策服务</h3>
            <div class="zcservice">
                <a href="serviceAppr.html">
                <img src="images/temp/fuhuaqi.png">
                </a>
            </div>
        </div> -->
    </div>
    <a class="TopBack"><span>Top</span></a>
	<jsp:include page="footer.jsp" flush="true"/>
	
	</div>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/headerFooterIndex.js"></script>
<script>
function formatDate(number){
	date=new Date(number)
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
$(".list").click(function(){
	$(this).addClass("over")
	$(".list1").removeClass("over")
	$(".sertit b").html($(this).html())
	$("#soBanner").css("display","block")
	$(".sertit2L").css("display","block")
	$(".banner1").css("display","block")
	$(".banner2").css("display","none")
	$("#cyzfw").css("display","block")
	$("#fhq").css("display","none")
})
$(".list1").click(function(){
	$(this).addClass("over")
	$(".list").removeClass("over")
	$(".sertit b").html($(this).html())
	$("#soBanner").css("display","none")
	$(".sertit2L").css("display","none")
	$(".banner1").css("display","none")
	$(".banner2").css("display","block")
	$("#cyzfw").css("display","none")
	$("#fhq").css("display","block")
	
})
//获取办事指南
getBSZN(1)
getBSZN(2)
function getBSZN(type){
	$.ajax({
		url:"http://localhost:8080/ssm/front/serviceoverajax1.html",
		type:"post",
		data:{type:type},
		success:function(data){
			html=''
			if(data!=null){
				for(var i=0;i<data.length;i++){
					html='<li class="listCon"><div class="listBox"><a href="bsznxq.html?id='+data[i].aId+'" target="_blank"><span>'+(i+1)+'.</span>'+data[i].aTitle+'</a><div class="detailAll"><div class="listDetail"><p>'+CF.ellipsis(data[i].aAbstract,300)+'</p><em>发布时间：'+formatDate(data[i].aPublishTime)+'</em><span>来源：<i>'+data[i].aSource+'</i></span></div></div></div> </li>'
					if(type==1){
						$("#cyzfw").append(html)
					}else{
						$("#fhq").append(html)
					}		
				}
			}
		}
	})
}
</script>
</html>