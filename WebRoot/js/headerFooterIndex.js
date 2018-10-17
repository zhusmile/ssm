$(".fix li").mouseover(function(){
	console.log("img")
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
$(".TopBack").click(function(){
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
