/**
 * 
 */
$(function(){
//年度最热政策
$.ajax({
 	type: "post",
	data: "",
	url: 'http://localhost:8080/ssm/front/analyzeMapAjax1.html?limit=3&type=0',
	dataType: "json",
	success: function(res) {
	//	console.log(res);
				
			var data = res[1];									
			var year = '';
			if (res[0] == 0) {
				year = '<img class="noData" src="../images/front/no_data_icon2.png" />';
			}else{
				for(var i = 0; i < data.length; i++) {
					var title = CF.ellipsis(data[i].pTitle,10);	
					year+='<li><i></i><p><a href="zhengcekuDetail.html?id='+ data[i].pId +'" target="_blank">'+ title +'</a></p></li>'	
			  	}
			}	
		  	$("#yearHotPolicyList").html(year);			    
	},
	beforeSend:function(){
		//加载中 xhj
	},
	error:function(){
		//加载异常 xhj
	}
});  

//季度最热政策
$.ajax({
 	type: "post",
	data: "",
	url: 'http://localhost:8080/ssm/front/analyzeMapAjax1.html?limit=3&type=1',
	dataType: "json",
	success: function(res) {
	//	console.log(res);
			
			var data = res[1];									
			var quarter = '';
			if (res[0] == 0) {
				quarter = '<img class="noData" src="../images/front/no_data_icon2.png" />';
			}else{
				for(var i = 0; i < data.length; i++) {
					var title = CF.ellipsis(data[i].pTitle,10);	
					quarter+='<li><i></i><p><a href="zhengcekuDetail.html?id='+ data[i].pId +'" target="_blank">'+ title +'</a></p></li>'	
			  	}
			}	
		  	$("#quarterHotPolicyList").html(quarter);			    
		
	},
	beforeSend:function(){
		//加载中 xhj
	},
	error:function(){
		//加载异常 xhj
	}
}); 

//月度最热政策
$.ajax({
 	type: "post",
	data: "",
	url: 'http://localhost:8080/ssm/front/analyzeMapAjax1.html?limit=3&type=2',
	dataType: "json",
	success: function(res) {
	//	console.log(res);		
			var data = res[1];									
			var mon = '';
			if (res[0] == 0) {
				mon = '<img class="noData" src="../images/front/no_data_icon2.png" />';
			}else{
				for(var i = 0; i < data.length; i++) {
					var title = CF.ellipsis(data[i].pTitle,10);	
					mon+='<li><i></i><p><a href="zhengcekuDetail.html?id='+ data[i].pId +'" target="_blank">'+ title +'</a></p></li>'	
			  	}
			}	
		  	$("#monthHotPolicyList").html(mon);			    
	},
	beforeSend:function(){
		//加载中 xhj
	},
	error:function(){
		//加载异常 xhj
	}
}); 

//周度最热政策
$.ajax({
 	type: "post",
	data: "",
	url:'http://localhost:8080/ssm/front/analyzeMapAjax1.html?limit=3&type=3',
	dataType: "json",
	success: function(res) {
		console.log(res);
			var data = res[1];									
			var week = '';
			if (res[0] == 0) {
				week = '<img class="noData" src="../images/front/no_data_icon2.png" />';
			}else{
				for(var i = 0; i < data.length; i++) {
					var title = CF.ellipsis(data[i].pTitle,10);	
					week+='<li><i></i><p><a href="zhengcekuDetail.html?id='+ data[i].pId +'" target="_blank">'+ title +'</a></p></li>'	
			  	}
			}	
		  	$("#weekHotPolicyList").html(week);			    
	},
	beforeSend:function(){
		//加载中 xhj
	},
	error:function(){
		//加载异常 xhj
	}
}); 

});



 