<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/baseDetail.css">
<link rel="stylesheet" href="../css/dongTaiList.css">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/headandfooter.css">
</head>
<body>
<div class="main">
<jsp:include page="head.jsp"></jsp:include>
<div class="indexWrap">
	<div class="index">
		<a class="ind1" href="home.html">首页</a>
		<a>动态列表</a>
    </div>
</div>
<div class="actList">
	<div class="listAll posR">
		<div>
			<div class="tabs">
				<ul class="dt-tab-ul">
						<li id="leixing-all"><a class="current tabFir">全部</a></li>
						<li class="buwei " id="buwei-dt" data-type="0"><a><em>部委动态</em></a></li>
						<li class="city" id="difang-dt">
							<a>
								<em id="dfdt-text">地方动态</em>
								<img style="display:inline-block;padding-left:5px;" src="../images/front/down_arrow_icon.png">
								<div id="city-list" style="text-align: left;width:310px;">
									<span id="" class="filter-itm-a on buxian" style="margin-left: 15px;">不限</span>
								</div>
							</a>
						</li>
						<li id="jidi-dt" data-type="2"><a>基地动态</a></li>
						<li class="team" id="shtt-dt"><a style="width:200px;"><em id="shtt-text">社会团体</em>
							<img style="display:inline-block;padding-left:5px;" src="../images/front/down_arrow_icon.png">
							<div style="width:200px;" id="shtt-list">
								<b data-value="" class="group-item on buxian">不限</b><br>
								<b data-value="1" class="group-item">中国科协</b><br>
								<b data-value="2" class="group-item">全国妇联</b><br>
								<b data-value="3" class="group-item">中国残联</b><br>
								<b data-value="4" class="group-item">自然科学基金会</b><br>
							</div>
						</a></li>
					</ul>
			</div>
			<div class="lisitConAll">
				
				<div id="dtlist" style="min-height: 200px;position: relative;margin-left: 36px;"></div>
				<div id="page" class="page_and_btn" style="margin-left: 36px;">
				
				</div>
			</div>
			<div class="rightMenu">
			
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/headerFooterIndex.js"></script>
<script type="text/javascript" src="../js/PinYin.js"></script>
<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
//正则分析处理url参数
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
}
$(function(){
	//获取url里的type参数  在加载页面时自动点击相应按钮 
	var type=getQueryString("type")
	console.log(getQueryString("type"))
	if(type==0){
		console.log("trigger")
		$("#buwei-dt a").trigger("click")
	}
	if(type==2){
		console.log("trigger")
		$("#jidi-dt a").trigger("click")
	}
})

$(".tabs a").mouseover(function(){  
	/* console.log("1111") */
    $(this).children("div").css("display","block")
})
$(".tabs a").mouseout(function(){
    $(this).children("div").css("display","none")
})
function formatDate(number){
	date=new Date(number)
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}

$.ajax({
	type:"post",
	url:"http://localhost:8080/ssm/front/dtlarea.html",
	dataType:"json",
	success:function(data){
		chineseLetter(data, 'aName')
		console.log(data)
		var letter=''
		for(var i=0;i<data.length;i++){
			if(data[i].letter!==''){
				console.log(data[i].letter)
				$("#city-list").append('<li style="position:relative;padding-left:10px;text-align:left;"><label style="position:absolute;left:0;top:7px;font-weight:bold;color:#2d6393;font-size:14px;">'+data[i].letter+'</label></li>')
			}
			$("#city-list").children("li:last-child").append('<span id="'+data[i].aId+'" class="filter-item-a">'+data[i].aName+'</span>')
		}
	},
	error:function(){
		console.log("777")
	}
})
var buwei=0,
	difang=0,
	jidi=0,
	shtt=0
function addDt(data){
	layui.use(['laypage', 'layer'], function(){
			var laypage = layui.laypage
					,layer = layui.layer;
		  	laypage.render({
		    elem: 'page'
		    ,theme: '#1E9FFF'
		    ,count: data.length
		    ,jump: function(obj){
		      //模拟渲染
		      document.getElementById('dtlist').innerHTML = function(){
		        var arr = []
		        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
		        layui.each(thisData, function(index, item){
		          arr.push('<div class="listBox"><a href="dtxq.html?id='+item.dyId+'" target="_blank">'+item.dyTitle+'</a><div class="detailAll"><div class="listDetail"><p>'+CF.ellipsis(item.dyAbstract,50)+'</p><em>发布时间：'+formatDate(item.dyPublishTime)+'</em><span>来源：<i>'+item.dySource+'</i></span></div></div></div>');
		        });
		        return arr.join('');
		      }();
		    }
		  });
	})
}
function allDt() {
	$("#dtlist").empty()
	$.ajax({
		url:"http://localhost:8080/ssm/front/dtlajax1.html",
		type:'post',
		success:function(data){
			console.log("success")
			if(data!=null){
				addDt(data);
			}	
		}
	})	
}
function getDifferentDt() {
 	$("#dtlist").empty()
	$.ajax({
		url:"http://localhost:8080/ssm/front/dtlajax2.html",
		type:'post',
		data:{issuer:buwei,area:difang,base:jidi,caste:shtt},
		success:function(data){
			console.log("success")
			if(data!=null){
				addDt(data);
			}	
		}
	})	
}
function backAll(){
	if($(".current").length==0){
		allDt()
		$("#leixing-all a").addClass("current")
	}else{
		getDifferentDt()
	}
}
allDt()
//全部按钮点击后 a添加class current 触发ajax方法 allDt() 其余的四个按钮均删除class current 
$("#leixing-all a").click(
	function() {
		$(this).addClass("current")
		$(".tabs a").each(
			function(index,item){
				if(index!=0){
					$(this).removeClass("current")
				}
			}
		)
		$("#dfdt-text").text("地方动态");
		$("#shtt-text").text("社会团体")
		allDt();
	}
)
/**部委按钮点击前 没有添加属性current 的添加属性并触发获取部委的ajax 有current属性的删除current 属性并
 * 查找当前有current属性的标签数 标签数为0则转到点击全部按钮的情况 
 * 基地按钮点击事件同理
 */
$("#buwei-dt a").click(
	function(){
		if($(this).is(".current")){
			$(this).removeClass("current")
			buwei=0
			backAll()
		}else{
			$(this).addClass("current")
			buwei=1
			$("#leixing-all a").removeClass("current")
			getDifferentDt()
		}
	}		
)
$("#jidi-dt a").click(
	function(){
		if($(this).is(".current")){
			$(this).removeClass("current")
			jidi=0
			backAll()
		}else{
			$(this).addClass("current")
			jidi=1
			$("#leixing-all a").removeClass("current")
			getDifferentDt()
		}

	}		
)
//同上 多出修改按钮内容以及对不限这个选项的处理
$("#city-list").on('click','span',function (){ 
/* 	console.log("span") 
	console.log($(this).text())
	console.log($(this).attr("id")) */
	$('#city-list span').each(
		function() {
			$(this).removeClass("on")
		}
	)
	$(this).addClass("on")
	if($(this).is(".buxian")){
		difang=0
		$("#dfdt-text").text("地方动态")
		$("#difang-dt a").removeClass("current")
		backAll()
	}else{
		$("#leixing-all a").removeClass("current")
		difang=$(this).attr("id")
		$("#dfdt-text").text($(this).text())
		console.log("difang:"+difang)
		$("#difang-dt a").addClass("current")
		getDifferentDt()
	}
})
$("#shtt-dt b").click(
	function(){
		$("#shtt-dt b").each(
			function() {
				$(this).removeClass("on")
			}	
		)
		$(this).addClass("on")
		if($(this).is(".buxian")){
			shtt=0
			$("#shtt-text").text("社会团体")
			$("#shtt-dt a").removeClass("current")
			backAll()
		}else{
			$("#leixing-all a").removeClass("current")
			shtt=$(this).attr("data-value")
			$("#shtt-text").text($(this).text())
			console.log("difang:"+difang)
			$("#shtt-dt a").addClass("current")
			getDifferentDt()
		}
		
	}		
)
</script>
</html>