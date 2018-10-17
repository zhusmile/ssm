/**
 * 
 */
//json数据日期  格式化 yyyy-mm-dd
function formatDate(data){
	if(data==null){
		return '';
	}else{
		date=new Date(data.time)
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
}
$(function(){
	var tsi = getQueryVariable('timeStageId');
	var businessPeopleId = getQueryVariable('businessPeopleId');
	var areaFlagId = getQueryVariable('areaFlagId');
	$("#hid_areaFlagId").val(areaFlagId);
	$("#hid_businessPeopleId").val(businessPeopleId);
	if (areaFlagId=='0') {
		$('#filter-all').removeClass('on');
		$('#gjzc').addClass('on');
	}else if(areaFlagId == '1'){
		$('#filter-all').removeClass('on');
		$('#fbdq').addClass('on');
	}
	//console.log(tsi);
	//console.log(businessPeopleId);
	// var businessPeopleId = '';//使用人群
	// var areaId = '';//区域政策
	// var zoneId = '';//政策分类
	// var areaFlagId = '';//国家政策
	// var industryId = '';//发布行业
	// var unitId = '';//发布单位
	// var startDate = '';//开始时间
	// var endDate = '';//结束时间
	layui.use('form', function () {  
        var form = layui.form; 
  //       form.on('submit(formDemo)', function(data,e){
		//     // console.log(JSON.stringify(data.field));
		   
			

		//     return false;
		// }); 
    }); 
	layui.use('laydate', function(){
		var laydate1 = layui.laydate;
		var laydate2 = layui.laydate;
		  
		//执行一个laydate实例
		laydate1.render({
		    elem: '#date1' //指定元素
		});

		laydate2.render({
		    elem: '#date2' //指定元素
		});
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
	layui.use('laypage', function(){
		var laypage = layui.laypage;
		window.fzFilter = function(){
			areaFlagId = $.trim($("#hid_areaFlagId").val());
			businessPeopleId =$.trim($("#hid_businessPeopleId").val());
			var areaId =$.trim($("#hid_areaId").val());
			var zoneId =$.trim($("#hid_zoneId").val());
			var industryId =$.trim($("#hid_industryId").val());
			var unitId =$.trim($("#hid_unitId").val());
			var startDate =$.trim($("#hid_startDate").val());
			var endDate =$.trim($("#hid_endDate").val());
			var issuedno =$.trim($("#hid_issuedno").val());
			$.ajax({
			    type: "post",
			    data: {'pageNum':1,'pageSize':10,'timeStageId':tsi,'areaFlagId':areaFlagId,'area':areaId,'zone':zoneId,'businessPeople':businessPeopleId,'startDate':startDate,'endDate':endDate,'industry':industryId,'unitName':unitId,'issuedno':issuedno},
			    url: 'http://localhost:8080/ssm/front/zhengcekuAjax1.html',
			    dataType: "json",
			    beforeSend: function(xhr) {
			    	$('#zck-zc-list').empty();
			    	$('#zck-zc-list').append('<img src="../images/front/huanchong.gif" id="huanchong">');
			    	$('#zck-fenye').show();
			    },
			    success: function(res) {
						//console.log(res)
						if(res[0]!=0){
							var data = res[1];
							if(data.length==0){
		                      $('#zck-zc-list').append('<div style="text-align:center;margin-top:30px;padding-bottom:30px;"><img src="../images/front/no_data_icon.png" style="display:inline-block;"></div>');
		                      $('#zck-fenye').hide();
		                      return;
		                    }
							for (var i = 0; i < data.length; i++) {
								var shortContent = CF.ellipsis(data[i].pAbstract,200);
								var html =  '<li>'+					
												'<a href="zhengcekuDetail.html?id='+ data[i].pId +'" class="title" target="_blank">'+ data[i].pTitle +'</a>'+
												'<div class="content">'+								
													'<div class="detail">'+
														'<p class="p1">'+ shortContent +'</p>'+
														'<p class="p2"><img src="../images/front/list-time.png"><em>发布时间：'+ formatDate(data[i].pIssueTime) +'</em><span>发布单位：<i>'+ data[i].pIssueOrg +'</i></span><p>'+
													'</div>'+
												'</div>'+					
											'</li>';
								$('#zck-zc-list').append(html);
							}
							var pageCounts = res[0];	
							//执行一个laypage实例
							laypage.render({
							    elem: 'zck-fenye', //注意，这里的 test1 是 ID，不用加 # 号
							    count: pageCounts, //数据总数，从服务端得到
							    limit: 10,
							    theme: '#2d6393',
							    jump: function(obj, first){
								    //obj包含了当前分页的所有参数，比如：
								   // console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
								   // console.log(obj.limit); //得到每页显示的条数							   
								    //首次不执行
								    if(!first){
								        $.ajax({
									        type: "post",
									        data: {'pageNum':obj.curr,'pageSize':obj.limit,'timeStageId':tsi,'areaFlagId':areaFlagId,'area':areaId,'zone':zoneId,'businessPeople':businessPeopleId,'startDate':startDate,'endDate':endDate,'industry':industryId,'unitName':unitId,'issuedno':issuedno},
			                                url: 'http://localhost:8080/ssm/front/zhengcekuAjax1.html',
									        dataType: "json",
									        beforeSend: function(xhr) {
									        	$('#zck-zc-list').empty();
									        	$('#zck-zc-list').append('<img src="../images/front/huanchong.gif" id="huanchong">');
									        },
									        success: function(res) {
									 			//console.log(res)
									 			if(res[0]!=0){
									 				var data = res[1]
													for (var i = 0; i < data.length; i++) {
														var shortContent = CF.ellipsis(data[i].pAbstract,200);
														var html =  '<li>'+					
																		'<a href="zhengcekuDetail.html?id='+ data[i].pId +'" class="title" target="_blank">'+ data[i].pTitle +'</a>'+
																		'<div class="content">'+								
																			'<div class="detail">'+
																				'<p class="p1">'+ shortContent +'</p>'+
																				'<p class="p2"><img src="../images/front/list-time.png"><em>发布时间：'+ formatDate(data[i].pIssueTime) +'</em><span>发布单位：<i>'+ data[i].pIssueOrg +'</i></span><p>'+
																			'</div>'+
																		'</div>'+					
																	'</li>';
														$('#zck-zc-list').append(html);
													}
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
		};
		
		//页面初始化
		fzFilter();
		//点击全部
		$('#filter-all').on('click',function(){
			searchCriteria = '全部';
			$(this).addClass('on').siblings().removeClass('on');
		    $('#reset').click();
		    $(this).addClass('on');
			fzFilter();
			//getUserMessage('01','01','01');
		})
		//搜索关键字
        window.kwSearch = function(kw){        
        	$.ajax({
			    type: "post",
			    data: {'pageNum':1,'pageSize':10,'keyword':kw},
			    url: 'http://localhost:8080/ssm/front/zhengcekuAjax3.html',
			    dataType: "json",
			    beforeSend: function(xhr) {
			    	$('#zck-zc-list').empty();
			    	$('#zck-zc-list').append('<img src="../images/front/huanchong.gif" id="huanchong">');
			    	$('#zck-fenye').show();
			    },
			    success: function(res) {
						//console.log(res)
						if(res[0]!=0){
							var data = res[1];
							if(data.length==0){
		                      $('#zck-zc-list').append('<div style="text-align:center;margin-top:30px;padding-bottom:30px;"><img src="../images/front/no_data_icon.png" style="display:inline-block;"></div>');
		                      $('#zck-fenye').hide();
		                      return;
		                    }
							for (var i = 0; i < data.length; i++) {
								var shortContent = CF.ellipsis(data[i].pAbstract,200);
								var html =  '<li>'+					
												'<a href="zhengcekuDetail.html?id='+ data[i].pId +'" class="title" target="_blank">'+ data[i].pTitle +'</a>'+
												'<div class="content">'+								
													'<div class="detail">'+
														'<p class="p1">'+ shortContent +'</p>'+
														'<p class="p2"><img src="../images/front/list-time.png"><em>发布时间：'+ formatDate(data[i].pIssueTime) +'</em><span>发布单位：<i>'+ data[i].pIssueOrg +'</i></span><p>'+
													'</div>'+
												'</div>'+					
											'</li>';
								$('#zck-zc-list').append(html);
							}
							var pageCounts = res[0];	
							//执行一个laypage实例
							laypage.render({
							    elem: 'zck-fenye', //注意，这里的 test1 是 ID，不用加 # 号
							    count: pageCounts, //数据总数，从服务端得到
							    limit: 10,
							    theme: '#2d6393',
							    jump: function(obj, first){
								    //obj包含了当前分页的所有参数，比如：
								  //  console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
								   // console.log(obj.limit); //得到每页显示的条数							   
								    //首次不执行
								    if(!first){
								        $.ajax({
									        type: "post",
									        data: {'pageNum':obj.curr,'pageSize':obj.limit,'keyword':kw},
			                                url: 'http://localhost:8080/ssm/front/zhengcekuAjax3.html',
									        dataType: "json",
									        beforeSend: function(xhr) {
									        	$('#zck-zc-list').empty();
									        	$('#zck-zc-list').append('<img src="../images/front/huanchong.gif" id="huanchong">');
									        },
									        success: function(res) {
									 			//console.log(res)
									 			if(res[0]!=0){
									 				var data = res[1];
													for (var i = 0; i < data.length; i++) {
														var shortContent = CF.ellipsis(data[i].pAbstract,200);
														var html =  '<li>'+					
																		'<a href="zhengcekuDetail.html?id='+ data[i].pId +'" class="title" target="_blank">'+ data[i].pTitle +'</a>'+
																		'<div class="content">'+								
																			'<div class="detail">'+
																				'<p class="p1">'+ shortContent +'</p>'+
																				'<p class="p2"><img src="../images/front/list-time.png"><em>发布时间：'+ formatDate(data[i].pIssueTime) +'</em><span>发布单位：<i>'+ data[i].pIssueOrg +'</i></span><p>'+
																			'</div>'+
																		'</div>'+					
																	'</li>';
														$('#zck-zc-list').append(html);
													}
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
			
		
	});
	// 高级搜索隐藏显示
	$('#advanced-search-btn').on('click',function(){
		$('#advanced-search-container').toggle();
	});
	$('.zck-sort-wrapper .sort-item').each(function(){
		$(this).hover(function(){
			$(this).children('.menu-down-wrapper').show();
			$(this).siblings().children('.menu-down-wrapper').hide();
		},function(){
			$(this).children('.menu-down-wrapper').hide();
		})
	});
	$('.zck-sort-wrapper .sort-item .menu-down-wrapper').each(function(){
		$(this).hover(function(){
			$(this).show();
		},function(){
			$(this).hide();
		})
	});
	//模拟placeholder效果
	$('#zck-search').on('focus',function(){
        if ($(this).val()=="") {
    		$('#ph-span').show();
    	}else{
    		$('#ph-span').hide();
    	}
    });
    $('#zck-search').on('blur',function(){
    	if ($(this).val()=="") {
    		$('#ph-span').show();
    	}		    	
    });
    $('#zck-search').on('keydown',function(){		    	
    	$('#ph-span').hide();		    		    	
    });
    $('#ph-span').on('click',function(){
    	$('#zck-search').focus();
    })
	
    
});

$(function(){
	//汉语拼音首字母排序的方法
	function pySegSort(arr,empty) {
	    if(!String.prototype.localeCompare)
	        return null;
	     
	     var letters ="*ABCDEFGHJKLMNOPQRSTWXYZ".split('');
         var zh ="阿把苍大峨发噶哈吉喀啦吗那哦爬祁然三他哇西呀咋".split('');
	     
	    var segs = [];
	    var curr;
	    $.each(letters, function(i){
	        curr = {letter: this, data:[],letter_index: i};
	        $.each(arr, function() {

	            if((!zh[i-1] || zh[i-1].localeCompare(this.aName,'zh') <= 0) && this.aName.localeCompare(zh[i],'zh') == -1) {
	                curr.data.push(this);
	                // console.log(this)
	            }else{
	            	if(i==23){
	            		if((!zh[i-1] || zh[i-1].localeCompare(this.aName,'zh') <= 0) && (this.aName.localeCompare(zh[i],'zh') == -1 || this.aName.localeCompare(zh[i],'zh') == 1)) {
			                curr.data.push(this);
			            }
	            	}
	            }
	        });
	        if(empty || curr.data.length) {
	            segs.push(curr);
	            curr.data.sort(function(a,b){ 
	                return a.aName.localeCompare(b.aName,'zh');
	            });
	        }
	    });
	    return segs;

	};
	//查询所有筛选条件的基础数据
	$.ajax({
	    type: "post",
	    data: "",
	    url: 'http://localhost:8080/ssm/front/zhengcekuAjax2.html',
	    dataType: "json",
	    beforeSend: function(xhr) {

	    },
	    success: function(res) {
				//console.log(res)
				if(res[0]!=null){
					//国家政策
					data=res[0];
					var html;
//					for (var i = 0; i < data.length; i++) {					
//						html = '<a href="javascript:;" class="filter-item-a" id="'+ data[i].id +'">'+ data[i].name +'</a>';
//						$('#guojiazhengce').append(html);
//					};
					//国家政策点击
					// $('#guojiazhengce a').click(function(){
					// 	$("#hid_areaFlagId").val($(this).attr('id'));
					// 	fzFilter();
					// });
					//区域政策
				    if(navigator.userAgent.toLowerCase().indexOf('se 2.x')>-1 ? true : false) {
					    for (var i = 0; i < data.length; i++) {
					    	html = '<a href="javascript:;" id="'+ data[i].aId +'" class="filter-item-a" data-text="'+ data[i].aName +'">'+ data[i].aName +'</a>';
					    	$('#zck-city-list').append(html);
					    }
				    }else{
						var areaArray = [];
						for (var i = 0; i < data.length; i++) {
							areaArray.push(data[i]);
						};
						var newAreaArray = pySegSort(areaArray);					
						for (var i = 0; i < newAreaArray.length; i++) {
					    	$('#zck-city-list').append('<li style="position:relative;padding-left:10px;"><label style="position:absolute;left:0;top:13px;font-weight:bold;color:#2d6393;font-size:14px;">'+ newAreaArray[i].letter +'</label></li>');
					    	for (var j = 0; j < newAreaArray[i].data.length; j++) {				
					    		$('#zck-city-list li').eq(i).append('<a href="javascript:;" id="'+ newAreaArray[i].data[j].aId +'" class="filter-item-a" data-text="'+ newAreaArray[i].data[j].aName +'">'+ newAreaArray[i].data[j].aName +'</a>');				    		;
					    	}
					    };
				    }				   
				    //区域政策点击
					$('#zck-city-list a').click(function(){
						$('#zck-city-list a').removeClass('on');
						$("#hid_areaId").val($(this).attr('data-text'));
						console.log($("#hid_areaId").val())
						$("#hid_areaFlagId").val('1');
						$('#gjzc').removeClass('on');
						$(this).addClass('on');
						if (gjzc_switch) {}else{
							gjzc_switch = !gjzc_switch;
						}
						fzFilter();
						searchCriteria = '发布地区-' + $(this).text();					
						//getUserMessage('01','01','01');
					});
				    //政策分类
				    data = res[1];
				    for (var i = 0; i < data.length; i++) {
						html = '<a href="javascript:;" id="'+ data[i].pId +'" class="filter-item-a" data-text="'+ data[i].pName +'">'+ data[i].pName +'</a>';
						$('#zck-sort-list').append(html);
					};
					//政策分类点击
					$('#zck-sort-list a').click(function(){
						$("#hid_zoneId").val($(this).attr('data-text'));
						$('#zck-sort-list a').removeClass('on');
						$(this).addClass('on');
						fzFilter();						
						searchCriteria = '政策分类-' + $(this).text();				
						//getUserMessage('01','01','01');
					});
					//使用人群					
					data = res[2];
				    for (var i = 0; i < data.length; i++) {
						html = '<a href="javascript:;" id="'+ data[i].egId +'" class="filter-item-a" data-text="'+ data[i].egName +'">'+ data[i].egName +'</a>';
						$('#zck-people-list').append(html);
					};
					//使用人群点击
					$('#zck-people-list a').click(function(){
						$("#hid_businessPeopleId").val($(this).attr('data-text'));
						$('#zck-people-list a').removeClass('on');
						$(this).addClass('on');
						fzFilter();						
						searchCriteria = '适用人群-' + $(this).text();
						//getUserMessage('01','01','01');
					});
					//行业					
					data = res[3];
				    for (var i = 0; i < data.length; i++) {
						html = '<a href="javascript:;" id="'+ data[i].iId +'" class="hangye-label">'+ data[i].iName +'</a>';
						$('#zck-hangye').append(html);
					};
					$('.filter-item-a').click(function(){
						$('#filter-all').removeClass('on');
						if ($(this).text()=='不限') {
							$(this).parents('.sort-item').removeClass('on');
						}else{
							$(this).parents('.sort-item').addClass('on');
						}
				    	$(this).parents('.sort-item').children('.filter-text').text($(this).attr('data-text'));
					})
					$('#zck-hangye a').click(function(){
				    	$(this).addClass('on').siblings().removeClass('on');
				    });
				    //发文单位					
					// data = res.data.unitList;
				 //    for (var i = 0; i < data.length; i++) {
					// 	html = '<input type="radio" name="danwei" title="'+ data[i].organizationname +'" lay-skin="primary" value="'+ data[i].organizationid +'">';
					// 	$('#zck-danwei').append(html);
					// };
					// layui.use('form', function () {  
				 //        var form = layui.form;
				 //        form.render('radio');				   
				 //    });
				    // $('#gjss-btn').click(function(){
				    	
				    // }) 
				}
	    },
	    error: function(xhr) {

	        
	    },
	    complete: function (xhr) {

	        
	    }
	});
})

$('#search').click(function(){
	console.log("search")
	var kw = $('#zck-search').val();
	kwSearch(kw);
	searchCriteria = kw;
	//getUserMessage('01','00','01');
});
//$('#search-btn').on('click',function(){
//	console.log("search")
//	var kw = $('#zck-search').val();
//	kwSearch(kw);
//	searchCriteria = kw;
//	//getUserMessage('01','00','01');
//});
$('#hot-kw-1,#hot-kw-2,#hot-kw-3').on('click',function(){
	var kw = $(this).text();
	kwSearch(kw);
	searchCriteria = kw;
	//getUserMessage('01','01','01');
});
//点击国家政策
var gjzc_switch = true;
$('#gjzc').click(function(){
	if (gjzc_switch) {
		$("#hid_areaFlagId").val('0');
	    $(this).addClass('on');
	}else{
		$("#hid_areaFlagId").val('');
	    $(this).removeClass('on');
	};
	gjzc_switch = !gjzc_switch;
	$('#filter-all').removeClass('on');
	$('#fbdq').removeClass('on');
	$("#hid_areaId").val('');
	$('#qyzc-text').text('发布地区');
	$('#zck-city-list a').removeClass('on');
    $('#zck-city-list a.buxian').addClass('on');
	fzFilter();
	searchCriteria = '国家政策';
	//getUserMessage('01','01','01');
});
//清空
$('#reset').click(function(){
	$('.hangye-label').removeClass('on');
	$('.hangye-label.buxian').addClass('on');
	$('#gjzc-text').text('国家政策');
	$('#qyzc-text').text('发布地区');
	$('#zcfl-text').text('政策分类');
	$('#syrq-text').text('使用人群');
    $("#hid_areaFlagId").val('');
	$("#hid_businessPeopleId").val('');
	$("#hid_areaId").val('');
	$("#hid_zoneId").val('');
	$("#hid_industryId").val('');
	$("#hid_unitId").val('');
	$("#hid_startDate").val('');
	$("#hid_endDate").val('');
	$("#hid_issuedno").val('');
    $('#zck-city-list a').removeClass('on');
    $('#zck-city-list a.buxian').addClass('on');
    $('#zck-sort-list a').removeClass('on');
    $('#zck-sort-list a.buxian').addClass('on');
    $('#zck-people-list a').removeClass('on');
    $('#zck-people-list a.buxian').addClass('on');
    $('.sort-item').removeClass('on');
    if (gjzc_switch) {

    }else{
    	gjzc_switch = !gjzc_switch;
    }
});
//确认
$('#gjss-btn').click(function(e){
	e = e || window.event;
    if(e.preventDefault) {
      e.preventDefault();
    }else{
      e.returnValue = false;
    }
    $('#filter-all').removeClass('on');
    $('#hid_startDate').val($('#date1').val());
	$('#hid_endDate').val($('#date2').val());
	$('#hid_industryId').val($('.hangye-label.on').text());
	$('#hid_unitId').val($('#fawendanwei').val());
	$('#hid_issuedno').val($('#wenhao').val());
	fzFilter();
	var industryId =$('.hangye-label.on').text();
	var unitId =$.trim($("#hid_unitId").val());
	var startDate =$.trim($("#hid_startDate").val());
	var endDate =$.trim($("#hid_endDate").val());
	var issuedno =$.trim($("#hid_issuedno").val());
	searchCriteria = '';
	if (industryId == '') {

	}else{
		searchCriteria += '行业-' + industryId + ',';	
	};
	if (unitId == '') {

	}else{
		searchCriteria += unitId + ',';
	};
	if (startDate == '') {

	}else{
		searchCriteria += startDate + ',';
	};
	if (endDate == '') {

	}else{
		searchCriteria += endDate + ',';
	};
	if (issuedno == '') {

	}else{
		searchCriteria += issuedno + ',';
	};
	//getUserMessage('01','02','01');
})