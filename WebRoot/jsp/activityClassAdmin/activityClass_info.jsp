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
	<form action="save.html" name="activityClassForm" id="activityClassForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="acId" id="acId" value="${activityClass.acId }"/>
		<input type="hidden" name="acAbstract" id="acAbstract" value="${activityClass.acAbstract }">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>活动标题:</th>
			<td><input type="text" name="acTitle" id="acTitle" class="input_txt" value="${activityClass.acTitle }"/></td>
		</tr>
		<tr class="info">
			<th>活动种类:</th>
			<td>
				<select name="acType" id="acType">
			    	<option value="0" <c:if test="${acType==0 }">selected</c:if>>部委活动</option>
			    	<option value="1" <c:if test="${acType==1 }">selected</c:if>>地方活动</option>
			  		<option value="2" <c:if test="${acType==2 }">selected</c:if>>基地活动</option>
			  		<option value="3" <c:if test="${acType==3 }">selected</c:if>>社会团体活动</option>
			    </select>
			</td>
		</tr>
		<tr class="info">
			<th>所属区域:</th>
			<td>
				<select id="acAreaId" name="acAreaId">
					<c:if test="${not empty areaList  }">
						<c:forEach items="${areaList }" var="area">
							<option value="${area.aId }" <c:if test="${area.aId==activityClass.acAreaId }">selected</c:if>>${area.aName }</option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>来源:</th>
			<td>
				<input type="text" name="acSource" value="${activityClass.acSource }">
			</td>
		</tr>
		<tr class="info">
		   <th valign="top">活动简介:</th>
		   <td><script id="editor" type="text/plain" style="width:70%;height:200px;">${activityClass.acAbstract}</script></td>
		</tr>
		<c:if test="${activityClass.acImg1!=null and activityClass.acImg1!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${activityClass.acImg1 }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传活动预览图片:</th>
			<td><input type="file" name="file1" id="file1" accept="image/*" onchange="preview(this)">
				<input type="hidden" name="acImg1" id="acImg1" value="${activityClass.acImg1 }">
			</td>
		</tr>
		<tr class="info">
			<th>预览效果:</th>
			<td class="file1 preview"><img class="img" width="100px"></td>
		</tr>
		<c:if test="${activityClass.acImg2!=null and activityClass.acImg2!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${activityClass.acImg2 }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传banner图片:</th>
			<td><input type="file" name="file2" id="file2" accept="image/*" onchange="preview(this)">
				<input type="hidden" name="acImg2" id="acImg2" value="${activityClass.acImg2 }">
			</td>
		</tr>
		<tr class="info">
			<th>预览效果:</th>
			<td class="file2 preview"><img class="img" width="100px"></td>
		</tr>
		<tr class="info">
			<th>参与方式跳转链接:</th>
			<td><input type="text" name="acLink" value="${activityClass.acLink }"></td>
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
				document.getElementById("acAbstract").value=UE.getEditor('editor').getContent();
				$("#activityClassForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#acTitle").val()==""){
				alert("请输入标题!");
				$("#acTitle").focus();
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
			$("#acTitle").select();
			$("#acTitle").focus();
		}
		function preview(file){
			//console.log("preview")
			//console.log(file.id);
			var secondclass=file.id;
			$('#preview').html("");
	        var imgArr = []; //获取的图片地址
	        var fileList = $(file)[0].files;   //或获取的图片文件
	        console.log(fileList);
	        var Length = fileList.length;
	        for ( var i = 0; i < Length; i++ ) {
                var imgUrl = window.URL.createObjectURL(fileList[i]); //获取图片地址
                imgArr.push(imgUrl);
                //console.log(imgArr);
                var $img = $("<img class='img' width='100px'>");
                $('.preview.'+secondclass).append($img);
                $img.attr('src', imgArr[i]);
            }
		}
	</script>
</body>
</html>