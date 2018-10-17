<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form action="toUpdate.html" enctype="multipart/form-data" method="post">
<table align="center" style="border-collapse:separate; border-spacing:0px 10px;">
				<tr>
					<td width="100px">
						<label>请选择文件:</label>
					</td>
					<td>
						<input type="file" id="file" name="file" accept="image/jpg,image/jpeg,image/png,image/bmp">
					</td>
				</tr>
				<tr>
					<td width="100px"><label>二维码类型:</label></td>
					<td>
						<select name="codeId" id="codeId">
							<option value="1">微博</option>
							<option value="2">微信</option>
						</select>
					</td>
				</tr>
				<tr style="height: 100px">
					<td width="100px">图片预览:</td>
					<td id="preview"></td>
				</tr>
				<tr style="height: 100px">
					<td width="100px">微博原图</td>
					<td>
						<c:forEach items="${qrCodeList }" var="qrCode">
							<c:if test="${qrCode.codeId==1 }">
								<img alt="" src="${qrCode.codeSrc }" width="100px">
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr style="height: 100px">
					<td width="100px">微信原图</td>
					<td>
						<c:forEach items="${qrCodeList }" var="qrCode">
							<c:if test="${qrCode.codeId==2 }">
								<img alt="" src="${qrCode.codeSrc }" width="100px">
							</c:if>
	  					</c:forEach>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="提交"></td>
				</tr>
	  </table>
</form>

</div>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script>
		$(function(){
			$('#file').change(function () {
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