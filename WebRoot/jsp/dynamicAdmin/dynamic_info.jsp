<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: left;width:120px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="dyForm" id="dyForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="dyId" id="dyId" value="${dy.dyId }"/>
		<input type="hidden" name="dyContent" id="dyContent">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="dyTitle" id="dyTitle" class="input_txt" value="${dy.dyTitle }"/></td>
		</tr>
		<tr class="info">
			<th>简介:</th>
			<td><input type="text" name="dyAbstract" id="dyAbstract" class="input_txt" value="${dy.dyAbstract }"></td>
		</tr>
		<tr class="info">
			<th>发布单位</th>
			<td><input type="hidden" name="dyIssuer" id="dyIssuer" class="input_txt" value="${dy.dyIssuer }">
				<input type="text" name="institution" id="institution" list="institutions" placeholder="输入包含发布单位的任意字符过滤" autocomplete="off" onchange="getInstitution()">
				<datalist id="institutions" style="display:none;">
				<c:choose>
					<c:when test="${not empty institutionList }">
						<c:forEach items="${institutionList}" var="institution" varStatus="vs">
						<option value1="${institution.inId }" value="${institution.inName }">
						</c:forEach>
					</c:when>			
				</c:choose>
				</datalist>
			</td>
		</tr>
		<tr class="info">
			<th>领导标记:</th>
			<td>
				<select name="dyLeader" >
					<option selected="selected" value="1">不标记</option>
					<option value="0">标记</option>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>所属基地:</th>
			<td>
				<input type="hidden" name="dyBase" id="dyBase" value="${dy.dyBase }">
				<input type="text" name="base" id="base" list="bases" placeholder="输入包含基地名的任意字符过滤" autocomplete="off" onchange="getArea()">
				<datalist id="bases" style="display:none;">
				<c:choose>
					<c:when test="${not empty baseList }">
						<c:forEach items="${baseList}" var="base" varStatus="vs">
						<option value1="${base.bId }" value="${base.bName }" value2="${base.bArea }">
						</c:forEach>
					</c:when>			
				</c:choose>
				</datalist>
			</td>
		</tr>
		<tr class="info">
			<th>所属地区:</th>
			<td>
				<input type="hidden" name="dyArea" id="dyArea" value="${dy.dyArea }">
				<input type="text" name="area" id="area" list="areas" placeholder="输入包含地区名的任意字符过滤" autocomplete="off" onchange="getBaseList()">
				<!-- 使用style="display:none;"将datalist元素设定为不显示 -->
				<datalist id="areas" style="display:none;">
				<c:choose>
					<c:when test="${not empty areaList }">
						<c:forEach items="${areaList}" var="area" varStatus="vs">
						<option value1="${area.aId }" value="${area.aName }">
						</c:forEach>
					</c:when>			
				</c:choose>
				</datalist>
			</td>
		</tr>
		<tr class="info">
			<th>所属社会团体:</th>
			<td>
				<select name="dyCaste" id="dyCaste">
					<option value="">请选择</option>
					<option value="1" <c:if test="${dy.dyCaste==1 }">selected</c:if>>中国科协</option>
					<option value="2" <c:if test="${dy.dyCaste==2 }">selected</c:if>>全国妇联</option>
					<option value="3" <c:if test="${dy.dyCaste==3 }">selected</c:if>>中国残联</option>
					<option value="4" <c:if test="${dy.dyCaste==4 }">selected</c:if>>自然科学基金会</option>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>动态分类:</th>
			<td>
				<select name="dyType">
					<option value=''>请选择</option>
					<option value="0" <c:if test="${dy.dyType==0 }">selected</c:if>>动态资讯</option>
					<option value="1" <c:if test="${dy.dyType==1 }">selected</c:if>>政策动态</option>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>来源:</th>
			<td>
				<input type="text" name="dySource" id="dySource" value="${dy.dySource }">
			</td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="dyPublishTime" id="dyPublishTime" value="<fmt:formatDate value="${dy.dyPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>	
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="dyOrder" id="dyOrder" class="input_txt" value="${dy.dyOrder }"/></td>
		</tr>
		<tr class="info">
		   <th valign="top">正文:</th>
		   <td><script id="editor" type="text/plain" style="width:70%;height:200px;">${dy.dyContent}</script></td>
		</tr>
		<c:if test="${dy.dyImg!=null and dy.dyImg!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${dy.dyImg }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传动态封面图片:</th>
			<td><input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp,image/jpeg">
				<input type="hidden" name="dyImg" id="dyImg" value="${dy.dyImg }">
			</td>
		</tr>
		<tr class="info">
			<th>预览效果:</th>
			<td id="preview"><img class="img" width="100px"></td>
		</tr>
		<tr class="info">
			<th>自动发布时间</th>
			<td>
				<input type="text" name="dyAutoPublishTime" id="dyAutoPublishTime" value="<fmt:formatDate value="${dy.dyAutoPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.js"></script>
	<!-- 上传控件 -->
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				var ue = UE.getEditor('editor');
				document.getElementById("dyContent").value=UE.getEditor('editor').getContent();
				$("#dyForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#dyTitle").val()==""){
				alert("请输入标题!");
				$("#dyTitle").focus();
				return false;
			}
			if($("#dyOrder").val()==""){
				alert("请输入排序!");
				$("#dyOrder").focus();
				return false;
			}
			return true;
		}
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
		function getInstitution(){
			console.log("Institution");
			//获取区域对应的id
			var input_select=$("#institution").val();
			var option_length=$("#institutions option").length;
			var option_id='';
			for(var i=0;i<option_length;i++){
				var option_value=$("#institutions option").eq(i).val();
				if(input_select==option_value){
					option_id=$("#institutions option").eq(i).attr('value1');
					break;
				}	
			}
			$("#dyIssuer").val(option_id);
		}
		function getBaseList() {
			console.log("change");
			//获取区域对应的id
			var input_select=$("#area").val();
			var option_length=$("#areas option").length;
			var option_id='';
			for(var i=0;i<option_length;i++){
				var option_value=$("#areas option").eq(i).val();
				if(input_select==option_value){
					option_id=$("#areas option").eq(i).attr('value1');
					break;
				}	
			}
			console.log(option_id);
			$("#dyArea").val(option_id);
			$.ajax({
				url:'http://localhost:8080/ssm/dynamic/ajax.html',
				type:'post',
				data:{dyArea:option_id},
				success:function(data){
					if(data!=null){
						console.log('/ajax')
						$("#bases").empty();
						for(var i = 0; i < data.length; i++){
							$("#bases").append("<option value1="+data[i].bId+" value="+data[i].bName+" value2="+data[i].bArea+">");
						}
					}
				}
			})
	
		}
		function getArea(){
			var input_select=$("#base").val();
			console.log(input_select);
			var option_length=$("#bases option").length;
			var baseId=''; 
			var baseArea='';
			for(var i=0;i<option_length;i++){
				var option_value=$("#bases option").eq(i).val();
				if(input_select==option_value){
					baseid=$("#bases option").eq(i).attr('value1');
					baseArea=$("#bases option").eq(i).attr('value2');
					break;
				}	
			}
			console.log(baseid);
			$("#dyBase").val(baseid);
			//根据基地option的属性value2 将区域栏自动填充
			if(baseArea!=''){
				$("#dyArea").val(baseArea);
				var option_length=$("#areas option").length;
				for(var i=0;i<option_length;i++){
					//获取区域对应代码 和基地所属区域代码对比
					var areaId=$("#areas option").eq(i).attr("value1")
					if(baseArea==areaId){
						$("#area").val($("#areas option").eq(i).val())
						break;
					}	
				}
			}
		}
		function failed(){
			alert("该标题已存在！");
			$("#dyTitle").select();
			$("#dyTitle").focus();
		}
		$(function(){
			$('#file').change(function () {
				console.log("preview")
				$('#preview').html("");
	            var imgArr = []; //获取的图片地址
	            var fileList = $(this)[0].files;   //或获取的图片文件
	            console.log(fileList);
	            var Length = fileList.length;
	            for ( var i = 0; i < Length; i++ ) {
	                var imgUrl = window.URL.createObjectURL(fileList[i]); //获取图片地址
	                imgArr.push(imgUrl);
	                console.log(imgArr);
	                var $img = $("<img class='img' width='100px'>");
	                $('#preview').append($img);
	                $img.attr('src', imgArr[i]);
	            }
	        });
		})
	</script>
</body>
</html>