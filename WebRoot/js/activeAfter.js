
function formatDate(number){
	date=new Date(number)
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
$(function(){
	$('.right-nav-container li').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		$('.right-nav-container').removeClass('pa');
		$('.right-nav-container').css({'position':'fixed','top':'30px','margin-left':'1200px'})
	})
	$(window).scroll(function(){
		var wst = $(this).scrollTop();	
		if(wst<479){
			$('.right-nav-container').addClass('pa');
			$('.right-nav-container').css({'position':'absolute','margin-left':'0px','top':'64px'});
		}else{
			$('.right-nav-container').removeClass('pa');
			$('.right-nav-container').css({'position':'fixed','margin-left':'1200px','top':'30px'});
		}
		
	})
	$('.goTop').click(function(){
		$('.right-nav-container li').removeClass('active');
		  timer=setInterval(function(){
           var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
           var ispeed=Math.floor(-scrollTop/20);
           //console.log(ispeed)
           if(scrollTop==0){
               clearInterval(timer);
           }
           document.documentElement.scrollTop=document.body.scrollTop=scrollTop+ispeed;
       },20)
	})
/*//banner图
$.ajax({
 	type: "post",
	data: "",
	url: yuming + '/banner/getBannerByBannerType?bannerType=00',
	dataType: "json",
	success: function(result) {
	//	console.log(result);
		if(result.code == "200") {			
			var list = result.data[0];									
			$("#banner").html('<img src='+yuming+"/"+list.picPath+'>');			    
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
});   */

//主要活动-创想中国  
  $.ajax({
 	type: "post",
	data: "",
	url: 'http://localhost:8080/ssm/front/homeajax12.html?limit=3',
	success: function(list) {
		//console.log(result);\
		ccn=''
		if(list!=null) {			
			for(var i = 0; i < list.length; i++) {
				ccn+='<li><a href="cxzgxq.html?id='+ list[i].aId +'" target="_blank">'+ list[i].aTitle +'</a><p><em style="color:#6a6566">来源：<b>'+ list[i].aSource +'</b></em><i style="color:rgb(140,140,140)">'+ formatDate(list[i].aPublishTime) +'</i></p></li>'	
		  	}
		  	$("#ccn").html(ccn);			    
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

    //主要活动-双创活动周
	$.ajax({
	 	type: "post",
		data: "",
		url: 'http://localhost:8080/ssm/front/homeajax11.html?limit=3',
		success: function(list) {
			//console.log(result);
			scz=''
			if(list!=null) {				
				for(var i = 0; i < list.length; i++) {
					scz+='<li><a href="articleHD.html?id='+ list[i].aId +'" target="_blank">'+ list[i].aTitle +'</a><p><em style="color:#6a6566">来源：<b>'+ list[i].aSource +'</b></em><i style="color:rgb(140,140,140)">'+ formatDate(list[i].aPublishTime) +'</i></p></li>'	
			  	} 			 
			  	$("#scz").html(scz);		     		    	    
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
	function huodonggenzong(cg,pn,obj){
	
		$.ajax({
		 	type: "post",
		 	url: 'http://localhost:8080/ssm/front/activeAfterAjax1.html?category='+ cg +'&pageNum='+ pn +'&pageSize=3',
		 	dataType:'json',
			success: function(result) {
				console.log(result);
				list=result[1]
				counts=result[0]
				if(counts!=0) {				
					var diqu = '';
					for(var i = 0; i < list.length; i++) {
						diqu+='<a href="hdxq.html?id='+ list[i].acId +'" target="_blank"><img src='+list[i].acImg1+'><p>'+list[i].acTitle+'</p><div><em>'+ list[i].acAreaName +'</em><span>'+ list[i].acSource +'</span></div></a>';
					};   			 
				   obj.append(diqu);
				   if (obj.children('a').length<counts) {
				   	obj.siblings('.load-more-wrapper').show();
				   }else{
				   	obj.siblings('.load-more-wrapper').hide();
				   }	    		    	    
				}else{
					//加载异常 xhj
				}
			},
			beforeSend:function(){
				obj.siblings('.load-more-wrapper').append('<img src="../images/front/huanchong.gif" id="huanchong" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
				obj.siblings('.load-more-wrapper').hide();
		        obj.append('<img src="../images/front/huanchong.gif" id="huanchong2" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
			},
			error:function(){
				
			},
			complete:function(){
				$('#huanchong').remove();
				$('#huanchong2').remove();
			}
		});  
	}
	huodonggenzong(0,1,$("#buwei .ConBoxDet"));
	huodonggenzong(1,1,$("#diqu .ConBoxDet"));
	huodonggenzong(2,1,$("#jidi .ConBoxDet"));
	huodonggenzong(3,1,$("#tuanti .ConBoxDet"));
	var buwei_more_num = 1;
    var diqu_more_num = 1;
    var jidi_more_num = 1;
    var tuanti_more_num = 1;
	$('#buwei-more').click(function(){
	 	buwei_more_num++;
	 	huodonggenzong(0,buwei_more_num,$("#buwei .ConBoxDet"));
	});
	$('#difang-more').click(function(){
	 	diqu_more_num++;
	 	huodonggenzong(1,diqu_more_num,$("#diqu .ConBoxDet"));
	});
	$('#jidi-more').click(function(){
	 	jidi_more_num++;
	 	huodonggenzong(2,jidi_more_num,$("#jidi .ConBoxDet"));
	});
	$('#tuanti-more').click(function(){
	 	tuanti_more_num++;
	 	huodonggenzong(3,tuanti_more_num,$("#tuanti .ConBoxDet"));
	});
});
//监听滚动条位置       
	  window.addEventListener("scroll",function(e){
			var window =document.documentElement.scrollTop||document.body.scrollTop;
			var body = $(".actList").height();
			//console.log(body)
			if(window>0&&window<body*0.2){
			$(".right-nav-container").children("li").eq(0).addClass("active").siblings().removeClass("active")
			}
			if(window>body*0.2&&window<body*0.4){
				$(".right-nav-container").children("li").eq(1).addClass("active").siblings().removeClass("active")
			}
			if(window>body*0.4&&window<body*0.6){
				$(".right-nav-container").children("li").eq(2).addClass("active").siblings().removeClass("active")
			}
			if(window>body*0.6&&window<body*0.8){
				$(".right-nav-container").children("li").eq(3).addClass("active").siblings().removeClass("active")
			}
			if(window>body*0.8&&window<body*1){
				$(".right-nav-container").children("li").eq(4).addClass("active").siblings().removeClass("active")
			}
		});
