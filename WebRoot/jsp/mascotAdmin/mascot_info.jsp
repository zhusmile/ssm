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
	<form action="save.html" name="mascotForm" id="mascotForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="mId" id="mId" value="${mascot.mId }"/>
		<input type="hidden" name="mContent" id="mContent">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="mTitle" id="mTitle" class="input_txt" value="${mascot.mTitle }"/></td>
		</tr>
		<tr class="info">
		   <th valign="top">内容:</th>
		   <td><script id="editor" type="text/plain" style="width:70%;height:200px;">${mascot.mContent}</script></td>
		</tr>
		<tr class="info">
			<th>简介:</th>
			<td><textarea name="mAbstract" rows="5" cols="50">${mascot.mAbstract }</textarea></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="mPublishTime" id="mPublishTime" value="<fmt:formatDate value="${mascot.mPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="mOrder" id="mOrder" class="input_txt" value="${mascot.mOrder }"/></td>
		</tr>
		<c:if test="${mascot.mImg!=null and mascot.mImg!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${mascot.mImg }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传活动预览图片:</th>
			<td><input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp">
				<input type="hidden" name="aImg" id="aImg" value="${mascot.mImg }">
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
				document.getElementById("mContent").value=UE.getEditor('editor').getContent();
				$("#mascotForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#mTitle").val()==""){
				alert("请输入标题!");
				$("#mTitle").focus();
				return false;
			}
			if($("#mOrder").val()==""){
				alert("请输入排序!");
				$("#mOrder").focus();
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
			$("#mTitle").select();
			$("#mTitle").focus();
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