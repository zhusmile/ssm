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
	<form action="save.html" name="egForm" id="egForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="egId" id="egId" value="${eg.egId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>创业群体名称:</th>
			<td><input type="text" name="egName" id="egName" class="input_txt" value="${eg.egName }"/></td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="egOrder" id="egOrder" class="input_txt" value="${eg.egOrder }"/></td>
		</tr>
		<tr class="info" style="height: 100px">
			<th><font color="red">*</font>上传图片</th>
			<td>
				<input type="file" name="file" id="file" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
				<input type="hidden" name="egSrc" id="egSrc" value="${eg.egSrc }">
			</td>
			<th>预览效果</th>
			<td id="preview"><img alt="" src="${eg.egSrc }" width="100px"></td>
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
				$("#egForm").submit();
			});
		});
		
		function checkInfo(){
			if($("#file").val==""){
				alert("请上传图片文件!");
				return false;
			}
			if($("#egName").val()==""){
				alert("请输入名称!");
				$("#egName").focus();
				return false;
			}
			if($("#egOrder").val()==""){
				alert("请输入排序!");
				$("#egOrder").focus();
				return false;
			}
			if($("#egSrc").val()==""){
				console.log("egsrc")
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
			alert("新增失败，该创业群体名称已存在！");
			$("#egName").select();
			$("#egName").focus();
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