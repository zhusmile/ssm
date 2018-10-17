/**
 * Created by Administrator on 2018/7/4.
 */

function byId(id){
    return typeof (id)==="string"?document.getElementById(id):id
}
/*图片轮播*/

/*定义变量*/
var timer = null,
    pics = byId("banner").getElementsByTagName("div"),
    len = pics.length,
    dots = byId("dots").getElementsByTagName("span"),
    next = byId("next"),
    prev = byId("prev"),
    main = byId("slide-container"),
    banner = byId("banner"),
    index = 0;
    titles=byId("banner").getElementsByClassName("title-slide");

function slideImg(){
	console.log("slideImg")
    main.onmouseover = function(){
       /*鼠标移上去*/
        if(timer){
            clearInterval(timer);
        }
//        console.log("onmouseover")
    };
    main.onmouseout = function(){
        /*鼠标移开*/
//    	console.log("onmouseout")
        timer = setInterval(function(){
            index++;
            if(index>=pics.length){
                index = 0;
            }
           changeImg();
        },3000);
    };
    main.onmouseout();
    /*两边的按钮*/
    for(var i = 0;i < dots.length;i++){
        dots[i].id = i;
        dots[i].onclick = function () {
            index = this.id;
            changeImg();
        }
    }
    prev.onclick = function () {
        index--;
        if(index<0){
            index = 3;
        }
        console.log(index);
        changeImg();
    };
    next.onclick = function () {
        index++;
        if(index>=4){
            index = 0;
        }
        console.log(index);
        changeImg();
    }
}
var dynamicCount=$("#dynamicCount").val();
console.log("dynamicCount:"+dynamicCount);
/*切换图片*/
function changeImg(){
    for(var i = 0;i < pics.length;i++){
        titles[i].style.display="none";
        pics[i].style.display = "none";
        dots[i].className = " ";
    }
    titles[index].style.display="block";
    pics[index].style.display = "block";
    dots[index].className = "dots-active";
}
slideImg();
//点击切换标签
$(".tab-btn").click(function(){
		if(!$(this).is(".active")){
            $(this).addClass("active")
            $(this).siblings().removeClass("active")
         }
	}
)
$(".TopBack").mouseover(
    function(){
        $(this).css("background-color","rgba(100,148,191,0.7)")
        $(this).css("color","white")
    }
)
$(".TopBack").mouseout(
    function(){
        $(this).css("background","#fff")
        $(this).css("color","#5c5a5a")
    }
)
$(".TopBack").click(
    function(){
        $('html , body').animate({scrollTop: 0},'slow');
    }
)
