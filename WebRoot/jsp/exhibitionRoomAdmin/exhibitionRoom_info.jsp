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
	<form action="save.html" name="exhibitionRoomForm" id="exhibitionRoomForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="erId" id="erId" value="${exhibitionRoom.erId }"/>
		<input type="hidden" name="erContent" id="erContent">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="erTitle" id="erTitle" class="input_txt" value="${exhibitionRoom.erTitle }"/></td>
		</tr>
		<tr class="info">
		   <th valign="top">内容:</th>
		   <td><script id="editor" type="text/plain" style="width:70%;height:200px;">${exhibitionRoom.erContent}</script></td>
		</tr>
		<tr class="info">
			<th>简介:</th>
			<td><textarea name="mAbstract" rows="5" cols="50">${exhibitionRoom.erAbstract }</textarea></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="erPublishTime" id="erPublishTime" value="<fmt:formatDate value="${exhibitionRoom.erPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="erOrder" id="erOrder" class="input_txt" value="${exhibitionRoom.erOrder }"/></td>
		</tr>
		<c:if test="${exhibitionRoom.erImg!=null and exhibitionRoom.erImg!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${exhibitionRoom.erImg }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传活动预览图片:</th>
			<td><input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp">
				<input type="hidden" name="erImg" id="erImg" value="${exhibitionRoom.erImg }">
			</td>
		</tr>
		<tr class="info">
			<th>预览效果:</th>
			<td id="preview"><img class="img" width="100px"></td>
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
				document.getElementById("erContent").value=UE.getEditor('editor').getContent();
				$("#exhibitionRoomForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#erTitle").val()==""){
				alert("请输入标题!");
				$("#erTitle").focus();
				return false;
			}
			if($("#erOrder").val()==""){
				alert("请输入排序!");
				$("#erOrder").focus();
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
		function failed(){
			alert("该标题已存在！");
			$("#erTitle").select();
			$("#erTitle").focus();
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