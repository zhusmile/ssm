<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="headAll">
        <div class="header">
            <a class="iBlock" href="home.html"><img src="../images/front/logo.png"></a>
            <div class="searchBox fr">
                <form class="search" action="" method="post">
                    <input class="sWord" type="text" placeholder="站内搜索" id="search-input">
                    <input class="sBtn" name="Submit" value="" id="search-btn">
                </form>
                <ul class="fix">
                    <li class="mobile"><img src="../images/front/mobileMa.png"></li>
                    <li class="weixin">
                        <img src="${weixin.codeSrc}" width="120px">
                    </li>
                    <li class="sina">
                        <img src="${weibo.codeSrc }" width="120px">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="headNav">
        <div>
            <a href="home.html">首页</a>
            <a href="policyKu.html">政策库<i id="gozcdt">政策动态</i><i class="navindex2" id="gozck">政策查询</i></a>
            <a href="analyzeMap.html">政策分析</a>
            <a href="baseExp.html">示范基地<i id="gojddt">基地动态</i><i class="navindex2" id="jdk">基地库</i></a>
            <a href="activeAfter.html">活动跟踪</a><a href="serviceOver.html">服务拓展</a>
            <a class="navLineNo" href="word.html">建言献策</a>
        </div>
    </div>