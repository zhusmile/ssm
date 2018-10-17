document.write('<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>');
document.write('<script type="text/javascript" src="js/common.js?v=20180927"></script>');
// document.write('<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TG5igxDLimQMGNmXgSfEl5KbtnP7VUk3"></script>');
var ua;
var cip;
var cname;
var sb_type;
var searchCriteria;
$(function(){

 //    $.ajax({
 //        async:true,
 //        type: "POST",       
 //        data: "",
 //        url: yuming + '/accessReport/getIP',
 //        dataType: "json",
 //        beforeSend: function(xhr) {

 //        },
 //        success: function(res) {
 // 			cip = res.ip;
 //        },
 //        error: function(xhr) {

            
 //        },
 //        complete: function (xhr) {

            
 //        }
 //    });

	// function myFun(result){
	// 	var cityName = result.name;
	// 	cname = cityName;
	// }
	// var myCity = new BMap.LocalCity();
	// myCity.get(myFun);
  

	ua = navigator.userAgent;
	// alert(navigator.platform)
    cip = returnCitySN['cip'];
    cname = returnCitySN['cname'];
   
	if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
	    sb_type = '01';
	}else {
	    sb_type = '02';
	}


//----头部----------------------------
var header = '<div class="headAll"><div class="header">'
	+'<a class="iBlock" href="index.html"><img src="images/logo.png"></a>'
	+'<div class="searchBox fr">'
		+'<form class="search" action="" method="post">'
			+'<input class="sWord" type="text" placeholder="站内搜索" id="search-input"/>'
			+'<input class="sBtn" name="Submit" value="" id="search-btn"/>' 
		+'</form>'
		+'<ul class="fix">'
			+'<li class="mobile"><img src="images/mobileMa.png"></li>'
			+'<li class="weixin"></li>'
			+'<li class="sina"></li>'
		+'</ul>'
	+'</div>'
+'</div>'
+'</div>'
+'<div class="headNav">'
	+'<div>'
		+'<a href="'+yuming+'/staticHtml/index.html">首页</a>'
		+'<a href="policyKu.html">政策库<i id="gozcdt">政策动态</i><i class="navindex2" id="gozck">政策查询</i></a>'
		+'<a href="analyzeMap.html">政策分析</a>'
		+'<a href="baseExp.html">示范基地<i id="gojddt">基地动态</i><i class="navindex2" id="jdk">基地库</i></a>'
		+'<a href="activeAfter.html">活动跟踪</a>'
		+'<a href="serviceOver.html">服务拓展</a>'
		+'<a class="navLineNo" href="word.html">建言献策</a>'		
	+'</div>'
+'</div>';
$('body').prepend(header);
$('#gozcdt').click(function(e){
	e = e || window.event;
    if(e.preventDefault) {
      e.preventDefault();
    }else{
      e.returnValue = false;
    }
	window.location.href = 'policyKu.html';
});
$('#gozck').click(function(e){
	e = e || window.event;
    if(e.preventDefault) {
      e.preventDefault();
    }else{
      e.returnValue = false;
    }
	window.location.href = 'zhengceku.html';
});
$('#gojddt').click(function(e){
	e = e || window.event;
    if(e.preventDefault) {
      e.preventDefault();
    }else{
      e.returnValue = false;
    }
	window.location.href = 'baseExp.html';
});
$('#jdk').click(function(e){
	e = e || window.event;
    if(e.preventDefault) {
      e.preventDefault();
    }else{
      e.returnValue = false;
    }
	window.location.href = 'jidiku.html';
});
//---底部---------------------------------------
var  foot='<div class="footAbout">'
	+'<div align="center" class="foot">'
		+'<img src="images/party.png" style="left: 0;top:30px;">'
		+'<ul >'
		    +'<li><a href="aboutUs.html" style="border-left:0;">关于本网</a><a href="websiteState.html">网站声明</a><a href="zddt.html">网站地图</a><a href="aboutWebsite.html">联系我们</a></li>'
			+'<li>主办单位：中华人民共和国国家发展和改革委员会 京ICP备05052393号</li>'
			+'<li>技术支持：国家信息中心 国信优易数据有限公司</li>'
			+'<li>国家发展和改革委员会 版权所有，如需转载，请注明来源</li>'
		+'</ul>'
		+'<img src="images/mobileMa.png" style="position: absolute;right: 0;top:15px;width:95px;">'
		 
	+'</div>'
+'</div>';
$('body').append(foot); 

	
//页头ajax   begin   
  $.ajax({
 	type: "post",
    data: "",
    url: yuming + '/homePage/getQRCode',
    dataType: "json",
 	success: function(result) {
 		if(result.code == "200") {			
 			var list = result.data;
 			var weixin = '<img src="'+list.wechatPath+'">';					 
 		    $(".weixin").append(weixin);
 		    
 		    var weibo = '<img src="'+list.weiboPath+'">';					 
 		    $(".sina").append(weibo);
 		}else{
 			//加载异常 xhj
 		}
 	},
 	beforeSend:function(){
 		//加载中 xhj
 	},
 	error:function(){
 		//加载异常 xhj
 	}
 });
//页头ajax   end
  function getValue(){
  	var value = $.trim($('#search-input').val());
  	searchCriteria = value;
    if (value=='') {
    	alert("请输入搜索内容");
    	return;
    }
 //    _encode = encodeURI('search.html?keyword='+ value +'');
 //    _encode = encodeURI(_encode);
	// window.location.href = _encode;
	
  }
  $('#search-btn').click(function(e){
  		e = e || window.event;
	    if(e.preventDefault) {
	      e.preventDefault();
	    }else{
	      e.returnValue = false;
	    };
	    getValue();
	    $.ajax({
	        async:true,
	        type: "POST",
	        contentType:'application/json;charset=utf-8',
	        data: JSON.stringify({
	        	'userLocation': cname,
	        	'ip': cip,
	        	'userSystem': ua,
	        	'searchContent': '00',
	        	'searchMethod': '00',
	        	'searchCriteria': searchCriteria,
	        	'searchType': '',
	        	'customerType': sb_type
	        }),
	        url: yuming + '/accessReport/saveSearchReport',
	        dataType: "json",
	        beforeSend: function(xhr) {

	        },
	        success: function(res) {
	 			window.location.href = 'search.html?keyword='+ searchCriteria +'';
	        },
	        error: function(xhr) {

	            
	        },
	        complete: function (xhr) {

	            
	        }
	    });
	    
  })
  //回车事件
  $('#search-input').keyup(function(e){
  	  e = e || window.event;  	  
	  if(e.keyCode ==13){
	    getValue();
	    $.ajax({
	        async:true,
	        type: "POST",
	        contentType:'application/json;charset=utf-8',
	        data: JSON.stringify({
	        	'userLocation': cname,
	        	'ip': cip,
	        	'userSystem': ua,
	        	'searchContent': '00',
	        	'searchMethod': '00',
	        	'searchCriteria': searchCriteria,
	        	'searchType': '',
	        	'customerType': sb_type
	        }),
	        url: yuming + '/accessReport/saveSearchReport',
	        dataType: "json",
	        beforeSend: function(xhr) {

	        },
	        success: function(res) {
	 			window.location.href = 'search.html?keyword='+ searchCriteria +'';
	        },
	        error: function(xhr) {

	            
	        },
	        complete: function (xhr) {

	            
	        }
	    });	   
	  }
	});
   
	function getQueryVariable(variable){
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
       return('');
	};
	var keyword = decodeURI(getQueryVariable('keyword'));
	$('#search-input').val(keyword);
});
function getUserMessage(sc,sm,st){
 	$.ajax({
        async:true,
        type: "POST",
        contentType:'application/json;charset=utf-8',
        data: JSON.stringify({
        	'userLocation': cname,
        	'ip': cip,
        	'userSystem': ua,
        	'searchContent': sc,
        	'searchMethod': sm,
        	'searchCriteria': searchCriteria,
        	'searchType': st,
        	'customerType': sb_type
        }),
        url: yuming + '/accessReport/saveSearchReport',
        dataType: "json",
        beforeSend: function(xhr) {

        },
        success: function(res) {
 			
        },
        error: function(xhr) {

            
        },
        complete: function (xhr) {

            
        }
    });
 }  