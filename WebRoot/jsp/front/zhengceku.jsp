<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策查询</title>
<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/yzhStyle.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/imgHandle.js"></script>
</head>
<body>
<jsp:include page="head.jsp" flush="true"></jsp:include>
<div class="center" style="padding-top: 15px;">
            <!-- <div class="index">
                <a class="ind1" href="index.html">首页</a>
                <a>政策库</a>
            </div> -->
            <!-- 搜索区域开始 -->
            <div class="zck-search-bg">
                <div class="zck-search-container" id="zck-search-container">
                    <div class="search-wrapper">
                        <span id="ph-span">请输入关键词</span>
                        <input type="text" name="" id="zck-search">
                        <div class="img-wrapper" id="search"><img src="../images/front/sbw_icon.png"></div>
                    </div>
                    <div class="search-hot" id="zck-search-hot">
                        <label>热门搜索：</label>
                        <a href="javascript:;" id="hot-kw-1">两会</a>
                        <a href="javascript:;" id="hot-kw-2">创新创业</a>
                        <a href="javascript:;" id="hot-kw-3">示范基地</a>
                    </div>
                </div>
            </div>
            <!-- 搜索区域结束 -->
            <!-- 筛选区域开始 -->
            <input type="hidden" id="hid_areaFlagId" value="">
            <input type="hidden" id="hid_businessPeopleId" value="">
            <input type="hidden" id="hid_areaId" value="">
            <input type="hidden" id="hid_zoneId" value="">
            <input type="hidden" id="hid_industryId" value="">
            <input type="hidden" id="hid_unitId" value="">
            <input type="hidden" id="hid_startDate" value="">
            <input type="hidden" id="hid_endDate" value="">
            <input type="hidden" id="hid_issuedno" value="">
            <div class="zck-sort-container">
                <div class="zck-sort-wrapper">
                    <div class="sort-item on" id="filter-all">
                        <span>全部</span>
                    </div>
                    <div class="sort-item" id="gjzc">
                        <span id="gjzc-text" class="filter-text">国家政策</span>
                        <!-- <img src="../images/front/down_arrow_icon.png">
                        <div class="menu-down-wrapper">
                            <div class="menu-down" id="guojiazhengce">

                            </div>
                        </div>-->
                    </div>
                    <div class="sort-item" id="fbdq">
                        <span id="qyzc-text" class="filter-text">发布地区</span>
                        <img src="../images/front/down_arrow_icon.png">
                        <div class="menu-down-wrapper" style="display: none;">
                            <div class="menu-down">
                                <!-- <div>
                                    <label>热门城市：</label>
                                    <a href="javascript:;">北京</a>
                                    <a href="javascript:;">天津</a>
                                    <a href="javascript:;">深圳</a>
                                    <a href="javascript:;">上海</a>
                                </div> -->
                                <ul id="zck-city-list">
                                    <a href="javascript:;" id="" class="filter-item-a on buxian" style="margin-left: 15px;" data-text="发布地区">不限</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="sort-item">
                        <span id="zcfl-text" class="filter-text">政策分类</span>
                        <img src="../images/front/down_arrow_icon.png">
                        <div class="menu-down-wrapper" style="display: none;">
                            <div class="menu-down little" id="zck-sort-list">
                                <a href="javascript:;" id="" class="filter-item-a on buxian" data-text="政策分类">不限</a>
                            </div>
                        </div>
                    </div>
                    <div class="sort-item">
                        <span id="syrq-text" class="filter-text">使用人群</span>
                        <img src="../images/front/down_arrow_icon.png">
                        <div class="menu-down-wrapper" style="display: none;">
                            <div class="menu-down little" id="zck-people-list">
                                <a href="javascript:;" id="" class="filter-item-a on buxian" data-text="使用人群">不限</a>
                            </div>
                        </div>
                    </div>
                    <div class="advanced-search" id="advanced-search-btn">
                        <img src="../images/front/advanced_search.png">
                        高级搜索
                    </div>
                    <div class="clear"></div>
                </div>
                <div id="advanced-search-container">
                    <form class="layui-form" action="" id="zck-advanced-search" style="width: 900px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label custom">日期</label>
                            <div class="layui-inline dateImg">
                                <input type="text" class="layui-input custom" id="date1" placeholder="选择日期" name="begin" lay-key="1">
                                <div class="date_icon"></div>
                            </div>
                            <div class="layui-inline" id="date-line">—</div>
                            <div class="layui-inline dateImg">
                                <input type="text" class="layui-input custom" id="date2" placeholder="选择日期" name="end" lay-key="2">
                                <div class="date_icon"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label custom">文号</label>
                            <div class="layui-inline fl">
                                <input type="text" placeholder="请输入文号" autocomplete="off" class="layui-input custom" name="wenhao" id="wenhao">
                            </div>
                            <label class="layui-form-label custom">发文单位</label>
                            <div class="layui-inline fl">
                                <input type="text" placeholder="请输入发文单位" autocomplete="off" class="layui-input custom" name="fawendanwei" id="fawendanwei">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label custom">行业</label>
                            <div class="layui-input-block" id="zck-hangye">
                                <a href="javascript:;" id="" class="hangye-label on buxian">不限</a>
                            </div>
                        </div>
                        <div class="layui-form-item" id="zck-sub-wrapper">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-filter="formDemo" id="gjss-btn">确认</button>
                                <button type="reset" class="layui-btn layui-btn-primary" id="reset">清空</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 筛选区域结束 -->
            <!-- 筛选内容区域开始 -->
            <div class="zck-content-container">
                <ul class="yzh-news-list" id="zck-zc-list"></ul>
            </div>
            <!-- 筛选内容区域结束 -->
            <!-- 分页开始 -->
            <div id="zck-fenye">
            </div>
            <!-- 分页结束 -->
        </div>
        <a class="TopBack" href="#"><span>Top</span></a>
        <script type="text/javascript" src="../js/headerFooterIndex.js"></script>
		<script src="../layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript" src="../js/zhengceku.js"></script>
		<jsp:include page="footer.jsp" flush="true"></jsp:include>

</body>
</html>