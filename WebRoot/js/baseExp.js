function formatDate(data){
	if(data==null){
		return '';
	}else{
		date=new Date(data.time)
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
}

//轮播图

$(function(){
	function slider(m,y,tt){
        // 滑动特效
		var startX = 0, startY = 0; //触摸开始时手势横纵坐标 
        var temPos; //滚动元素当前位置
        var iCurr = 0; //当前滚动屏幕数
        var oPosition = {}; //触点位置
        var num = 2;
        var clone=m.children('li').first().clone();
        var ww =  parseInt(m.children('li').css('width')); 
        m.append(clone);
        var size =  m.children('li').size();
        //左滑
        function move_left(){
			iCurr++;
	        if(iCurr==size){
	           m.css({left:0});
	            iCurr=1;
	        }
	        m.stop().animate({left:-iCurr*ww},820);
	        if(iCurr==size-1){
	            y.eq(0).addClass("on").siblings().removeClass("on");
	            tt.eq(0).addClass("active").siblings().removeClass("active");			        
	        }
	        else{
	            y.eq(iCurr).addClass("on").siblings().removeClass("on");
	            tt.eq(iCurr).addClass("active").siblings().removeClass("active");			        
	        }
		}
		// 右滑
		function move_right(){
			iCurr--;
	        if(iCurr==-1){
	            m.css({left:-(size-1)*ww});
	            iCurr=size-2;
	        }
	        m.stop().animate({left:-iCurr*ww},820);
	        y.eq(iCurr).addClass("on").siblings().removeClass("on");
	        tt.eq(iCurr).addClass("active").siblings().removeClass("active");			   
		}
		var t = setInterval(move_left,3800);
		if (m.selector == '.erweima-wrap .list-wrap') {
			clearInterval(t);
		}
		m.hover(function(){
			clearInterval(t);
		},function(){
			t = setInterval(move_left,3800);
			if (m.selector == '.erweima-wrap .list-wrap') {
				clearInterval(t);
			}
		})
		// 划入小圆点
		y.hover(function(){
			m.stop().animate({left:-($(this).index())*ww},820);
			$(this).addClass('on').siblings().removeClass('on');
			tt.eq($(this).index()).addClass("active").siblings().removeClass("active");
			clearInterval(t);
		},function(){
			t = setInterval(move_left,3800);
			if (m.selector == '.erweima-wrap .list-wrap') {
				clearInterval(t);
			}
		})
		// 划入按钮
		$('#cxzg-prev').hover(function(){
			clearInterval(t);
		},function(){
			t = setInterval(move_left,3800);
		})
		$('#cxzg-next').hover(function(){
			clearInterval(t);
		},function(){
			t = setInterval(move_left,3800);
		})
		//按钮点击
		$('#cxzg-prev').on('click',function(){			
			move_right();			
		})
		$('#cxzg-next').on('click',function(){
			move_left();	
		})
    }

    //ajax 轮播
    $.support.cors = true;
	$.ajax({
	    type: "post",
	    data: "",
	    url: 'http://localhost:8080/ssm/front/baseExpAjax1.html?limit=3',
	    dataType: "json",
	    beforeSend: function(xhr) {

	    },
	    success: function(data) {
				//console.log(res,'轮播')
				if(data!=null){
					var html1 = '';
					var html2 = '';
					console.log(data.length)
					for (var i = 0; i < data.length; i++) {
						var title = CF.ellipsis(data[i].dyTitle,36);
						var sc = CF.ellipsis(data[i].dyAbstract,80);
						html1 += '<li><a href="dtxq.html?id='+ data[i].dyId +'" target="_blank"><img src='+data[i].dyImg+' class="lunbotu" onload="imgCenter(this)"></a></li>';
						html2 += '<li style="height:100%;"><b>'+ title +'</b><p class="sc">'+ sc +'</p><a href="dtxq.html?id='+ data[i].dyId +'" target="_blank">查看详情>></a></li>';					
					}
					$('#cxzg-slider-body').append(html1);
					$('#cxzg-title-ul').append(html2);
					$('#cxzg-title-ul li').eq(0).addClass('active');	            
					slider($('#cxzg-slider-body'),$('#cxzg-focus span'),$('#cxzg-title-ul li'));
					
				}
	    },
	    error: function(xhr) {

	        
	    },
	    complete: function (xhr) {

	        
	    }
	});
	//分页 基地库基地列表 
	layui.use('laypage', function(){
	    var laypage = layui.laypage;
	    var pageCounts;
	    var batch = "";
	    var type = "";
	    var activity = "";
	    window.jidikuRequest = function(){
	    	$.ajax({
			    type: "post",
			    data: "",
			    url: 'http://localhost:8080/ssm/front/baseExpAjax2.html?pageNum=1&pageSize=10&batch='+ batch +'&type='+ type,
			    dataType: "json",
			    beforeSend: function(xhr) {
			    	$('#dtlist').empty();
			    	$('#dtlist').append('<img src="../images/front/huanchong.gif" id="huanchong" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
			    	$('#page').show();
			    },
			    success: function(res) {
						//console.log(res)
						if(res[0]!=0){
							var html = "";
							var data = res[1];
							if(data.length==0){
		                      $('#dtlist').append('<div style="text-align:center;margin-top:30px;padding-bottom:30px;"><img src="images/no_data_icon.png" style="display:inline-block;"></div>');
		                      $('#page').hide();
		                      return;
		                    }
							var flag;
							for (var i = 0; i < data.length; i++) {
								var shortContent = CF.ellipsis(data[i].dyAbstract,220);
								if(data[i].dyImg==""){
									flag = "";
								}else{
									flag = '<a href="dtxq.html?id='+ data[i].dyId +'" target="_blank"><img src="'+data[i].dyImg +'"></a>';
								}
								html += '<div class="listBox">'+
											'<a href="dtxq.html?id='+ data[i].dyId +'" target="_blank">'+ data[i].dyTitle +'</a>'+
											'<div class="detailAll">'+
												''+ flag +''+
												'<div class="listDetail">'+
													'<p class="shortContent">'+ shortContent +'</p>'+
													'<em>发布时间：'+formatDate(data[i].dyPublishTime) +'</em><span>来源：<i>'+ data[i].dySource +'</i></span>'+
												'</div>'+
											'</div>'+
										'</div>';
							}							
							$('#dtlist').append(html);
							pageCounts = res[0];	
							//执行一个laypage实例
							laypage.render({
							    elem: 'page', //注意，这里的 test1 是 ID，不用加 # 号
							    count: pageCounts, //数据总数，从服务端得到
							    limit: 10,
							    theme: '#2d6393',
							    jump: function(obj, first){
								    //obj包含了当前分页的所有参数，比如：
								    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
								   // console.log(obj.limit); //得到每页显示的条数							   
								    //首次不执行
								    if(!first){
								        $.ajax({
										    type: "post",
										    data: "",
										    url: 'http://localhost:8080/ssm/front/baseExpAjax2.html?pageNum='+ obj.curr +'&pageSize='+ obj.limit +'&batch='+ batch +'&type='+ type,
										    dataType: "json",
										    beforeSend: function(xhr) {
										    	$('#dtlist').empty();
										    	$('#dtlist').append('<img src="../images/front/huanchong.gif" id="huanchong" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
										    },
										    success: function(res) {
													//console.log(res)
													if(res[0]!=0){											
														var html = "";
														var data = res[1]
														for (var i = 0; i < data.length; i++) {
															var shortContent = CF.ellipsis(data[i].dyAbstract,220);
															if(data[i].dyImg==""){
																flag = "";
															}else{
																flag = '<a href="dtxq.html?id='+ data[i].dyId +'" target="_blank"><img src="'+data[i].dyImg +'"></a>';
															}
															html += '<div class="listBox">'+
																		'<a href="dtxq.html?id='+ data[i].dyId +'" target="_blank">'+ data[i].dyTitle +'</a>'+
																		'<div class="detailAll">'+
																			''+ flag +''+
																			'<div class="listDetail">'+
																				'<p class="shortContent">'+ shortContent +'</p>'+
																				'<em>发布时间：'+ formatDate(data[i].dyPublishTime) +'</em><span>来源：<i>'+ data[i].dySource +'</i></span>'+
																			'</div>'+
																		'</div>'+
																	'</div>';
														}														
														$('#dtlist').append(html);											
													}
										    },
										    error: function(xhr) {
										    		
										        
										    },
										    complete: function (xhr) {
										    	$('#huanchong').remove();
										        
										    }
										});
								    }
								}
							});
							
						}
			    },
			    error: function(xhr) {

			        
			    },
			    complete: function (xhr) {
			    	$('#huanchong').remove();
			    }
			});
	    }
	    //页面加载时显示全部
	    jidikuRequest();
        //全部
        $('#quanbu').on('click',function(){
        	$('#pici-text').text('批次');
        	$('#leixing-text').text('类型');
        	$(this).addClass('current');
        	$('#pici-quanbu,#leixing-quanbu').removeClass('current');
        	batch = "";
	        type = "";
        	jidikuRequest();
        	searchCriteria = '全部';
        	getUserMessage('02','01','02');
        });
  //       //批次全部
		// $('#pici-quanbu').on('click',function(){
		// 	batch = "";
		// 	$(this).addClass('current');
		// 	$('#quanbu').removeClass('current');
		// 	jidikuRequest();
		// });
		//批次item
		$('#shoupi,#dierpi,#buxian').on('click',function(e){
			if(e && e.stopPropagation) { //非IE 
	          e.stopPropagation(); 
	        } else { //IE 
	          window.event.cancelBubble = true; 
	        };
	        $('#quanbu').removeClass('current');
	        $(this).parents('#pici-quanbu').addClass('current');
	        $(this).addClass('on').siblings().removeClass('on');
			batch = $(this).attr('data-value');
			jidikuRequest();
			searchCriteria = '批次-' + $(this).text();
			getUserMessage('02','01','02');
		});
		$('#buxian').click(function(){
			$(this).parents('#pici-quanbu').removeClass('current');
		})
		// //类型全部
		// $('#leixing-quanbu').on('click',function(){
		// 	type = "";
		// 	$(this).addClass('current');
		// 	$('#quanbu').removeClass('current');
		// 	jidikuRequest();
		// });
		//示范基地item
		$('#type00,#type02,#type01,#typebuxian').on('click',function(e){
			if(e && e.stopPropagation) { //非IE 
	          e.stopPropagation(); 
	        } else { //IE 
	          window.event.cancelBubble = true; 
	        };
	        $('#quanbu').removeClass('current');
	        $(this).parents('#leixing-quanbu').addClass('current');
	        $(this).addClass('on').siblings().removeClass('on');
			type = $(this).attr('data-value');
			jidikuRequest();
			searchCriteria = '类型-' + $(this).text();	
			getUserMessage('02','01','02');
		});
		$('#typebuxian').click(function(){
			$(this).parents('#leixing-quanbu').removeClass('current');
		})
	});
	
});




//动态切换
$(function(){
  
    //tab下拉菜单  
    $(".tabs li div b").on('click',function(){	   
	   $(this).parents(".pici").children().children('em').text($(this).text());	
	   $(this).parents(".leixing").children().children('em').text($(this).text());	
	});

	$('#typebuxian').click(function(){
		$('#leixing-text').text('类型');
	});
	$('#buxian').click(function(){
		$('#pici-text').text('批次');
	})
	
})


//右侧分类
$(function(){
	$('.rightMenu2 a:eq(0)').on('click',function(){
		$(this).addClass('condCur');
		$('.rightMenu2 a:eq(1)').removeClass("condCur");
		$('.rightMenu2 a:eq(2)').removeClass("condCur");
	});
	$('.rightMenu2 a:eq(1)').on('click',function(){
		$(this).addClass('condCur');
		$('.rightMenu2 a:eq(0)').removeClass("condCur");
		$('.rightMenu2 a:eq(2)').removeClass("condCur");
	});
	$('.rightMenu2 a:eq(2)').on('click',function(){
		$(this).addClass('condCur');
		$('.rightMenu2 a:eq(0)').removeClass("condCur");
		$('.rightMenu2 a:eq(1)').removeClass("condCur");
	});
});