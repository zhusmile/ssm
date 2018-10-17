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
.info th{text-align: right;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="bannerForm" id="bannerForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="bannerId" id="bannerId" value="${banner.bannerId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>类型:</th>
			<td><select name="bannerType" id="bannerType">
				<option value="">请选择</option>
				<option value="活动跟踪">活动跟踪</option>
				<option value="全面创新改革实验">全面创新改革实验</option>
				<option value="战略性新兴产业">战略性新兴产业</option>
				<option value="创响中国">创响中国</option>
				<option value="双创活动周">双创活动周</option>
				<option value="服务拓展-双创税收优惠政策查询">服务拓展-双创税收优惠政策查询</option>
				<option value="服务拓展-政府性基金和行政事业性收费查询">服务拓展-政府性基金和行政事业性收费查询</option>
				<option value="服务拓展-取消下放的行政审批事项查询">服务拓展-取消下放的行政审批事项查询</option>	
				<option value="首页-创响中国跳转">首页-创响中国跳转</option>			
			</select></td>
		</tr>
		<tr class="info">
			<th>名称:</th>
			<td><input type="text" name="bannerName" id="bannerName" class="input_txt" value="${banner.bannerName }"/></td>
		</tr>
		<tr class="info">
			<th>链接:</th>
			<td><input type="text" name="bannerLink" id="bannerLink" class="input_txt" value="${banner.bannerLink }"/></td>
		</tr>
		<tr class="info">
			<th>排序</th>
			<td><input type="text" name="bannerOrder" id="bannerOrder" class="input_txt" value="${banner.bannerOrder }"/></td>
		</tr>
		<tr class="info" style="height: 100px">
			<th>上传图片</th>
			<td>
				<input type="file" name="file" id="file" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
				<input type="hidden" name="bannerSrc" id="bannerSrc" value="${banner.bannerSrc }">
			</td>
			<th>预览效果</th>
			<td id="preview"><img alt="" src="${banner.bannerSrc }" width="100px"></td>
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
				$("#bannerForm").submit();
			});
		});
		
		function checkInfo(){
			if($("#file").val==""){
				alert("请上传图片文件!");
				return false;
			}
			if($("#bannerType").val()==""){
				alert("请选择类型!");
				$("#bannerType").focus();
				return false;
			}
			if($("#bannerName").val()==""){
				alert("请输入名称!");
				$("#bannerName").focus();
				return false;
			}
			if($("#bannerOrder").val()==""){
				alert("请输入排序!");
				$("#bannerOrder").focus();
				return false;
			}
			if($("#bannerSrc").val()==""){
				console.log("bannersrc")
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
			alert("新增失败，该用户名已存在！");
			$("#loginname").select();
			$("#loginname").focus();
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