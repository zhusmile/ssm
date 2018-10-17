<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策动态</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/headandfooter.css">
<link rel="stylesheet" href="../css/policyKu.css">
<style>
	.listCon .listBox>a{position: relative;}
	.listCon .listBox>a:before{font-size:16px;width: 20px;height:20px;position: absolute;left: -20px;top:26px;}
	.listCon .listBox:first-child>a:before{content: '1.';}
	.listCon .listBox:nth-child(2)>a:before{content: '2.';}
	.listCon .listBox:nth-child(3)>a:before{content: '3.';}
	.listCon .listBox:nth-child(4)>a:before{content: '4.';}
	.listCon .listBox:nth-child(5)>a:before{content: '5.';}
	.listCon .listBox:nth-child(6)>a:before{content: '6.';}
	.listCon .listBox:nth-child(7)>a:before{content: '7.';}
	.listCon .listBox:nth-child(8)>a:before{content: '8.';}
	.listCon .listBox:nth-child(9)>a:before{content: '9.';}
	.listCon .listBox:nth-child(10)>a:before{content: '10.';left: -26px;}
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/imgHandle.js"></script>
</head>
<body>
<jsp:include page="head.jsp" flush="true"></jsp:include>
<div class="policyDT">
			<div class="policyDTtop">
				<!-- <h2 class="policytit">政策动态</h2> -->
				<div class="polCon">
					<ul class="zctt-list" id="zctt-list">
						
					</ul>
				</div>
			</div>
			<div class="actList">			
			<div class="listAll posR">
				<div class="tabs">
					<ul>
						<li id="leixing-all"><a class="current tabFir">全部</a></li>
						<li id="buwei-dt"><a>国家</a></li>
						<li class="city" id="difang-dt"><a><em id="dfdt-text">地方动态</em><img style="display:inline-block;padding-left:5px;" src="../images/front/down_arrow_icon.png">
							<div id="city-list" style="left: -1px;">
								<b id="0" class="filter-itm-a on buxian" style="margin-left: 15px;">不限</b>
							</div>
						</a></li>
						<li id="jidi-dt"><a>基地</a></li>
					</ul>
				</div>
				<div class="lisitConAll">
					<div class="listCon" id="dtlist" style="min-height: 200px;position: relative;padding: 0 30px;display: block;"></div>
					
				</div>
				<div id="page"></div>
			</div>			
		</div>
		</div>
		<a class="TopBack" href="#"><span>Top</span></a>
		<script type="text/javascript" src="../js/headerFooterIndex.js"></script>
		<script src="../layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		
		<script type="text/javascript" src="../js/policyKu.js"></script>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>

<script type="text/javascript">
	
</script>
</html>