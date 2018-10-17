<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.info th{text-align: left;width:100px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="mediaForm" id="mediaForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="mId" id="mId" value="${media.mId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>媒体名称:</th>
			<td><input type="text" name="mName" id="mName" class="input_txt" value="${media.mName }"/></td>
		</tr>
		<tr class="info">
			<th>业务类型:</th>
			<td><select id="mType1" name="mType1">
					<option value="0" <c:if test="${media.mType1==0 }">selected</c:if>>创响中国</option>
					<option value="1" <c:if test="${media.mType1==1 }">selected</c:if>>双创活动周</option>
			</select></td>
		</tr>
		<tr class="info">
			<th>媒体类型:</th>
			<td><select id="mType2" name="mType2">
					<option value="0" <c:if test="${media.mType2==0 }">selected</c:if>>图片</option>
					<option value="1" <c:if test="${media.mType2==1 }">selected</c:if>>视频</option>
			</select></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="mOrder" id="mOrder" class="input_txt" value="${media.mOrder }"/></td>
		</tr>
		<tr class="info">
			<th>链接:</th>
			<td><input type="text" name="mLink" id="mLink" class="input_txt" value="${media.mLink }"/></td>
		</tr>
		<c:if test="${media.mImg!=null }">
		<tr class="info">
			<th>原图预览</th>
			<td><img src="${media.mImg }"/></td>
		</tr>
		</c:if>
		<tr class="info" style="height: 100px">
			<th><font color="red">*</font>上传预览图片</th>
			<td>
				<input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp"/>
				<input type="hidden" name="mImg" id="mImg" value="${media.mImg }">			
			</td>
		</tr>
		<tr>
			<td id="preview"></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#mediaForm").submit();
			});
		});
		
		function checkInfo(){
			if($("#file").val==""){
				alert("请上传图片文件!");
				return false;
			}
			if($("#mLink").val().length==0){
				alert("请输入链接!");
				return false;
			}
			if($("#mName").val()==""){
				alert("请输入名称!");
				$("#mName").focus();
				return false;
			}
			if($("#mOrder").val()==""){
				alert("请输入排序!");
				$("#mOrder").focus();
				return false;
			}
			if($("#mImg").val()==""){
				if($("#file")[0].files.length==0){
					alert("请选择一张图片上传");
					return false;
				}
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
			alert("新增失败，该名称已存在！");
			$("#mName").select();
			$("#mName").focus();
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