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
	<form action="save.html" name="acForm" id="acForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="aId" id="aId" value="${ac.aId }"/>
		<input type="hidden" name="aContent" id="aContent">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>活动标题:</th>
			<td><input type="text" name="aTitle" id="aTitle" class="input_txt" value="${ac.aTitle }"/></td>
		</tr>
		<tr class="info">
			<th>活动种类</th>
			<td>
				<select name="aType" id="aType">
					<option value="0" <c:if test="${ac.aType==0 }">selected</c:if>>主会场活动</option>
					<option value="1" <c:if test="${ac.aType==1 }">selected</c:if>>分会场活动</option>
					<option value="2" <c:if test="${ac.aType==2 }">selected</c:if>>部委活动</option>
					<option value="3" <c:if test="${ac.aType==3 }">selected</c:if>>创响中国</option>
			  </select>
			</td>
		</tr>
		<tr class="info">
			<th>所属区域:</th>
			<td>
				<select name="aAreaId">
				<option value="">请选择</option>
				<c:choose>
					<c:when test="${not empty areaList }">
						<c:forEach items="${areaList}" var="area" varStatus="vs">
						<option value="${area.aId }" <c:if test="${area.aId==ac.aAreaId }">selected</c:if>>${area.aName }</option>
						</c:forEach>
					</c:when>			
				</c:choose>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>发布单位</th>
			<td>
				<select name="aIssuerOrg">
				<option value="">请选择</option>
				<c:choose>
					<c:when test="${not empty institutionList }">
						<c:forEach items="${institutionList}" var="institution" varStatus="vs">
							<option value="${institution.inId }" <c:if test="${institution.inId==ac.aIssuerOrg }">selected</c:if>>${institution.inName }</option>
						</c:forEach>
					</c:when>			
				</c:choose>
				</select>
			</td>
		</tr>
		<tr class="info">
		   <th valign="top">活动内容:</th>
		   <td><script id="editor" type="text/plain" style="width:70%;height:200px;">${ac.aContent}</script></td>
		</tr>
		<tr class="info">
			<th>活动简介:</th>
			<td><textarea name="aDescript" rows="5" cols="50">${ac.aDescript }</textarea></td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="aPublishTime" id="aPublishTime" value="<fmt:formatDate value="${ac.aPublishTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
		<tr class="info">
			<th>来源:</th>
			<td>
				<input type="text" name="aSource" id="aSource" value="${ac.aSource }">
			</td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="aOrder" id="aOrder" class="input_txt" value="${ac.aOrder }"/></td>
		</tr>
		<c:if test="${ac.aImg!=null and ac.aImg!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${ac.aImg }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传活动预览图片:</th>
			<td><input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp,image/jpeg">
				<input type="hidden" name="aImg" id="aImg" value="${ac.aImg }">
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
				document.getElementById("aContent").value=UE.getEditor('editor').getContent();
				$("#acForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#aTitle").val()==""){
				alert("请输入标题!");
				$("#aTitle").focus();
				return false;
			}
			if($("#aOrder").val()==""){
				alert("请输入排序!");
				$("#aOrder").focus();
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
			$("#aTitle").select();
			$("#aTitle").focus();
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