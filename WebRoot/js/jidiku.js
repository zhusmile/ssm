function formatDate(data){
	if(data==null){
		return '';
	}else{
		date=new Date(data.time)
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	
}
$(function(){
	layui.use('laypage', function(){
		var laypage = layui.laypage;
		var batch_change = "";
		var type_change = "";
		window.jidikuRequest = function(){
			var area=$("#baseArea").val();
			var name=$("#baseName").val();
			console.log("area:"+area)
			console.log("name:"+name)
			$.ajax({
			    type: "post",
			    data:"",
			    url: 'http://localhost:8080/ssm/front/jidikuAjax1.html?pageNum=1&pageSize=10&type='+ type_change +'&batch='+ batch_change +'&area='+area+'&name='+name+'',
			    dataType: "json",
			    beforeSend: function(xhr) {
			    	$('#jidiku-news-list-ul').empty();
			    	$('#jidiku-news-list-ul').append('<img src="../images/front/huanchong.gif" id="huanchong" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
			    	$('#jidiku-fenye').show();
			    },
			    success: function(res) {
						//console.log(res)														
							var html1 = "";
							var html2 = "";
							var data = res[1];
							if(data.length==0){
		                      $('#jidiku-news-list-ul').append('<div style="text-align:center;margin-top:30px;padding-bottom:30px;"><img src="../images/front/no_data_icon.png" style="display:inline-block;"></div>');
		                      $('#jidiku-fenye').hide();
		                      return;
		                    }
							var pici;
							var leixing;
							for (var i = 0; i < data.length; i++) {
								console.log(data[i].base)
								var shortContent = CF.ellipsis(data[i].base.bContent1,65);
								
								if(data[i].base.bBatch == '0'){
									pici = "首批";
								}else{
									pici = "第二批";
								};
								if(data[i].base.bType == '0'){
									leixing = "区域示范基地";
								}else if(data[i].base.bType == '1'){
									leixing = "高校和科研院所示范基地";
								}else{
									leixing = "企业示范基地";
								};
								html1 = '<li>'+
											'<div class="left">'+
												'<a href="baseCon.html?id='+ data[i].base.bId +'" target="_blank">'+
													'<div class="img-wrapper"><img src="'+data[i].base.bFileSrc +'" onload="imgCenter(this)"></div>'+
													'<div class="article">'+
														'<p class="p1">'+ data[i].base.bName +'</p>'+
														'<p class="p2">'+ shortContent +'</p>'+
														'<p class="p3"><span class="org">'+ pici +'</span><span class="b-blue">'+ leixing +'</span></p>'+
													'</div>'+
												'</a>'+
											'</div>'+
											'<div class="right">'+
												'<p class="title">最新动态</p>'+
												'<ul class="jidiku-list-zuixin">'+				
												'</ul>'+
											'</div>'+
										'</li>';
								$('#jidiku-news-list-ul').append(html1);
								var dynamicList = data[i].dynamicList;								
								for (var j = 0; j < dynamicList.length; j++) {
									var title = CF.ellipsis(dynamicList[j].dyTitle,35);
							 		html2 = '<li>'+
									'<a href="dtxq.html?id='+ dynamicList[j].dyId +'" target="_blank"><label style="color:#29d659;">【动态】</label>'+ title +'</a>'+
									'<span>'+ formatDate(dynamicList[j].dyPublishTime) +'</span>'+
								'</li>';
								 	/*if(dynamicList[j].basesActivityFlag == 'Y'){
								 		html2 = '<li>'+
													'<a href="dtxq.html?id='+ dynamicList[j].dyId +'" target="_blank"><label style="color:#00ccff;">【活动】</label>'+ title +'</a>'+
													'<span>'+ formatDate(dynamicList[j].dyPublishTime) +'</span>'+
												'</li>';
								 	}else{
								 		html2 = '<li>'+
													'<a href="dtxq.html?id='+ dynamicList[j].id +'" target="_blank"><label style="color:#29d659;">【动态】</label>'+ title +'</a>'+
													'<span>'+ dynamicList[j].pubtime +'</span>'+
												'</li>';
								 	}*/
									$('.jidiku-list-zuixin').eq(i).append(html2);
								} 
							};
							var pc = res[0];
							//执行一个laypage实例
							laypage.render({
							    elem: 'jidiku-fenye', //注意，这里的 test1 是 ID，不用加 # 号
							    count: pc, //数据总数，从服务端得到
							    limit: 10,
							    theme: '#2d6393',
							    jump: function(obj, first){
								    //obj包含了当前分页的所有参数，比如：
								    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
								    //console.log(obj.limit); //得到每页显示的条数
								    
								    //首次不执行
								    if(!first){
								        $.ajax({
									        type: "post",
									        data: "",
									        url: 'http://localhost:8080/ssm/front/jidikuAjax1.html?pageNum='+ obj.curr +'&pageSize='+ obj.limit +'&type='+ type_change +'&batch='+ batch_change +''+'&area='+area+'&name='+name+'',
									        dataType: "json",
									        timeout: 10000,
									        beforeSend: function(xhr) {
									            $('#jidiku-news-list-ul').empty();    
									            $('#jidiku-news-list-ul').append('<img src="../images/front/huanchong.gif" id="huanchong" style="width: 30px;height: 30px;position: absolute;top: 50%;margin-top: -15px;left: 50%;margin-left: -15px;">');
									        },
									        success: function(res) {
												//console.log(res)														
												var html1 = "";
												var html2 = "";
												var data = res[1];
												if(data.length==0){
							                      $('#jidiku-news-list-ul').append('<div style="text-align:center;margin-top:30px;padding-bottom:30px;"><img src="../images/front/no_data_icon.png" style="display:inline-block;"></div>');
							                      $('#jidiku-fenye').hide();
							                      return;
							                    }
												var pici;
												var leixing;
												for (var i = 0; i < data.length; i++) {
													console.log(data[i].base)
													var shortContent = CF.ellipsis(data[i].base.bContent1,65);
													
													if(data[i].base.bBatch == '1'){
														pici = "首批";
													}else{
														pici = "第二批";
													};
													if(data[i].base.bType == '0'){
														leixing = "区域示范基地";
													}else if(data[i].base.bType == '1'){
														leixing = "高校和科研院所示范基地";
													}else{
														leixing = "企业示范基地";
													};
													html1 = '<li>'+
																'<div class="left">'+
																	'<a href="baseCon.html?id='+ data[i].base.bId +'" target="_blank">'+
																		'<div class="img-wrapper"><img src="'+data[i].base.bFileSrc +'" onload="imgCenter(this)"></div>'+
																		'<div class="article">'+
																			'<p class="p1">'+ data[i].base.bName +'</p>'+
																			'<p class="p2">'+ shortContent +'</p>'+
																			'<p class="p3"><span class="org">'+ pici +'</span><span class="b-blue">'+ leixing +'</span></p>'+
																		'</div>'+
																	'</a>'+
																'</div>'+
																'<div class="right">'+
																	'<p class="title">最新动态</p>'+
																	'<ul class="jidiku-list-zuixin">'+				
																	'</ul>'+
																'</div>'+
															'</li>';
													$('#jidiku-news-list-ul').append(html1);
													var dynamicList = data[i].dynamicList;								
													for (var j = 0; j < dynamicList.length; j++) {
														var title = CF.ellipsis(dynamicList[j].dyTitle,35);
												 		html2 = '<li>'+
														'<a href="dtxq.html?id='+ dynamicList[j].id +'" target="_blank"><label style="color:#29d659;">【动态】</label>'+ title +'</a>'+
														'<span>'+ formatDate(dynamicList[j].dyPublishTime)+'</span>'+
													'</li>';
													 	/*if(dynamicList[j].basesActivityFlag == 'Y'){
													 		html2 = '<li>'+
																		'<a href="dtxq.html?id='+ dynamicList[j].dyId +'" target="_blank"><label style="color:#00ccff;">【活动】</label>'+ title +'</a>'+
																		'<span>'+ formatDate(dynamicList[j].dyPublishTime) +'</span>'+
																	'</li>';
													 	}else{
													 		html2 = '<li>'+
																		'<a href="dtxq.html?id='+ dynamicList[j].id +'" target="_blank"><label style="color:#29d659;">【动态】</label>'+ title +'</a>'+
																		'<span>'+ dynamicList[j].pubtime +'</span>'+
																	'</li>';
													 	}*/
														$('.jidiku-list-zuixin').eq(i).append(html2);
														} 
													};
									    
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
																	
						
			    },
			    error: function(xhr) {

			        
			    },
			    complete: function (xhr) {
			    	$('#huanchong').remove();
			        
			    }
			});
		}
		//页面加载时ajax请求
		jidikuRequest();
		//点击全部
		$('#quanbu').on('click',function(){
			batch_change = "";
			type_change = "";
			jidikuRequest();
			searchCriteria = '全部';
			//getUserMessage('02','01','03');
		});
        //点击批次
        $('#quanbu-pici').on('click',function(){
			batch_change = "";
			jidikuRequest();
			searchCriteria = '批次';
			//getUserMessage('02','01','03');
		});
        //点击首批
        $('#shoupi').on('click',function(){
			batch_change = "0";
			jidikuRequest();
			searchCriteria = '首批';
			//getUserMessage('02','01','03');
		});
        //点击第二批
        $('#dierpi').on('click',function(){
			batch_change = "1";
			jidikuRequest();
			searchCriteria = '第二批';
			//getUserMessage('02','01','03');
		});
        //点击类型
		$('#quanbu-leixing').on('click',function(){
			type_change = "";
			jidikuRequest();
			searchCriteria = '类型';
			//getUserMessage('02','01','03');
		});
		//区域示范基地
		$('#type00').on('click',function(){
			type_change = "0";
			jidikuRequest();
			searchCriteria = '区域示范基地';
			//getUserMessage('02','01','03');
		});
        //高校和科研院所示范基地
		$('#type01').on('click',function(){
			type_change = "1";
			jidikuRequest();
			searchCriteria = '高校和科研院所示范基地';
			//getUserMessage('02','01','03');
		});
        //企业示范基地
		$('#type02').on('click',function(){
			type_change = "2";
			jidikuRequest();
			searchCriteria = '企业示范基地';
			//getUserMessage('02','01','03');
		});
	});
    //右侧动效
    $('#quanbu').on('click',function(){
    	$(this).addClass('active').siblings().removeClass('active');
    	$('.hangbiao').eq(0).addClass('active').siblings('.hangbiao').removeClass('active');
    })
    $('.jidiku-pici').each(function(){
    	$(this).on('click',function(){
    		$(this).addClass('active').siblings('.jidiku-pici').removeClass('active');
    		$('#quanbu').removeClass('active');
    		$('.hangbiao').eq(0).removeClass('active');
    		$('.hangbiao').eq(1).addClass('active');
    	})
    })
    $('.jidiku-leixing').each(function(){
    	$(this).on('click',function(){
    		$(this).addClass('active').siblings('.jidiku-leixing').removeClass('active');
    		$('#quanbu').removeClass('active');
    		$('.hangbiao').eq(0).removeClass('active');
    		$('.hangbiao').eq(2).addClass('active');
    	})
    })
})