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
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.6.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.6.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.6.4/demo/demo.css">
<script type="text/javascript">  
    window.UEDITOR_HOME_URL = "/ueditor/";  
</script> 
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: left;width:140px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left}
</style>
</head>
<body>
	<form action="save.html" name="policyForm" id="policyForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="pId" id="pId" value="${policy.pId }"/>
		<input type="hidden" name="pContent" id="pContent">
		<input type="hidden" name="pIssuer" id="pIssuer" value="${policy.pIssuer }">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>标题:</th>
			<td><input type="text" name="pTitle" id="pTitle" class="input_txt" value="${policy.pTitle }"/></td>
		
			<th>发文字号:</th>
			<td><input type="text" name="pIndex" id="pIndex" class="input_txt" value="${policy.pIndex }"></td>
		</tr>
		<tr class="info">
			<th>发布单位(可多选):</th>
			<td>
			<input class="easyui-combobox" 
					name="pIssueOrg"
					id="pIssueOrg"
					editable="false"
					value="${policy.pIssueOrg }"
					data-options="
 					url:'issueOrg.html',
 		 			method:'get', 
					valueField:'inName', 
 					textField:'inName', 
 					multiple:true, 
					panelHeight:'100px' 
 			"> 
			</td>
		</tr>
		<tr class="info">
			<th>发布时间:</th>
			<td>
				<input type="text" name="pIssueTime" id="pIssueTime" value="<fmt:formatDate value="${policy.pIssueTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
			<th>主题分类:</th>
			<td>
			<input class="easyui-combobox" 
					name="pTheClassfication"
					id="pTheClassfication"
					editable="false"
					value="${policy.pTheClassfication }"
					data-options="
 					url:'theClassfication.html',
 		 			method:'get', 
					valueField:'sName', 
 					textField:'sName', 
 					multiple:false, 
					panelHeight:'150px' 
 			"> 
			</td>
		</tr>
		<tr class="info">
			<th>生态圈(可多选)</th>
			<td>
			<input class="easyui-combobox" 
					name="pEcosphere"
					id="pEcosphere"
					editable="false"
					value="${policy.pEcosphere }"
					data-options="
 					url:'ecosphere.html',
 		 			method:'get', 
					valueField:'eName', 
 					textField:'eName', 
 					multiple:true, 
					panelHeight:'auto' 
 			"> 
			</td>
			<th>时间轴:</th>
			<td>
			<input class="easyui-combobox" 
					name="pTimeAxis"
					id="pTimeAxis"
					editable="false"
					value="${policy.pTimeAxis }"
					data-options="
 					url:'timeAxis.html',
 		 			method:'get', 
					valueField:'tName', 
 					textField:'tName', 
 					multiple:false, 
					panelHeight:'auto' 
 			"> 
			</td>
		</tr>
		<tr class="info">
			<th>政策隶属</th>
			<td><select name="pBelong" id="pBelong">
					<option value="0" <c:if test="${policy.pBelong==0 }">selected</c:if>>全部</option>
					<option value="1" <c:if test="${policy.pBelong==1 }">selected</c:if>>国家政策</option>
					<option value="2" <c:if test="${policy.pBelong==2 }">selected</c:if>>区域政策</option>	
				</select>
			</td>
			<th>区域:</th>
			<td>
			<input class="easyui-combobox" 
					name="pArea"
					id="pArea"
					editable="false"
					value="${policy.pArea }"
					data-options="
 					url:'area.html',
 		 			method:'get', 
					valueField:'aName', 
 					textField:'aName', 
 					multiple:false, 
					panelHeight:'150px' 
 			"> 
			</td>
		</tr>
		<tr class="info">
			<th>政策分类:</th>
			<td>
			<input class="easyui-combobox" 
					name="pClassfication"
					id="pClassfication"
					editable="false"
					value="${policy.pClassfication }"
					data-options="
 					url:'policyClassfication.html',
 		 			method:'get', 
					valueField:'pName', 
 					textField:'pName', 
 					multiple:false, 
					panelHeight:'auto' 
 			"> 
			</td>
			<th>创业人群(可多选)</th>
			<td>
			<input class="easyui-combobox" 
					name="pEntreGroup"
					id="pEntreGroup"
					value="${policy.pEntreGroup }"
					editable="false"
					data-options="
 					url:'entreGroup.html',
 		 			method:'get', 
					valueField:'egName', 
 					textField:'egName', 
 					multiple:true, 
					panelHeight:'auto' 
 			"> 				
			
			</td>
		</tr>
		<tr class="info">
			<th>创业服务(可多选):</th>
			<td>
			<input class="easyui-combobox" 
					name="pService"
					id="pService"
					value="${policy.pService }"
					editable="false"
					data-options="
					valueField:'name', 
 					textField:'name', 
 					multiple:true, 
					panelHeight:'auto',
					data:[{name:'金融服务'},{name:'技术服务'},{name:'场地服务'},{name:'人才服务'}] 
 			"> 
			</td>
			<th>行业(可多选):</th>
			<td>
			<input class="easyui-combobox" 
					name="pIndustry"
					id="pIndustry"
					value="${policy.pIndustry }"
					editable="false"
					data-options="
 					url:'industry.html',
 		 			method:'get', 
					valueField:'iName', 
 					textField:'iName', 
 					multiple:true, 
					panelHeight:'auto' 
 			"> 
			</td>
		</tr>
		<tr class="info">
			<th><font color="red">*</font>政策解读简介:</th>
			<td><textarea name="" id="pAbstract">${policy.pAbstract }</textarea></td>
			<th><font color="red">*</font>政策排序:</th>
			<td><input type="text" name="pOrder" id="pOrder" class="input_txt" value="${policy.pOrder }"/></td>
		</tr>
		<tr class="info">
			<th>访谈视频地址:</th>
			<td><input type="text" name="pInterviewvideoSrc" id="pInterviewvideoSrc" class="input_txt" value="${policy.pInterviewvideoSrc }"/></td>
			<th>访谈时间:</th>
			<td>
				<input type="text" name="pInterviewTime" id="pIssueTime" value="<fmt:formatDate value="${policy.pInterviewTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
			</td>
		</tr>
		<tr class="info">
			<th>访谈嘉宾:</th>
			<td><textarea name="pGuest" id="pGuest">${policy.pGuest }</textarea></td>
			<th>访谈简介:</th>
			<td><textarea name="pInterviewAbstract" id="pInterviewAbstract">${policy.pInterviewAbstract }</textarea></td>	
		</tr>
		<tr class="info">
			<th>上传动态封面图片:</th>
			<td><input type="file" name="file" id="file" accept="image/jpg,image/jpad,image/png,image/bmp,image/jpeg">
				<input type="hidden" name="pInterviewImg" id="pInterviewImg" value="${policy.pInterviewImg }">
			</td>
			<th>预览效果:</th>
			<td id="preview"><img class="img" width="350px"></td>
		</tr>
		<tr class="info">
		   <th valign="top">政策内容:</th>
		   <td colspan="3"><script id="editor" type="text/plain" style="width:70%;height:200px;">${policy.pContent}</script></td>
		</tr>

	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.6.4/jquery.easyui.min.js"></script>
	
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.js"></script>
	<!-- 上传控件 -->
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				var ue = UE.getEditor('editor');
				document.getElementById("pContent").value=UE.getEditor('editor').getContent();
				$("#policyForm").submit();
			});
		});
		//百度富文本
		setTimeout("ueditor()",100);
		function ueditor(){
			UE.getEditor('editor');
		}
		function checkInfo(){
			if($("#pTitle").val()==""){
				alert("请输入标题!");
				$("#pTitle").focus();
				return false;
			}
			if($("#pOrder").val()==""){
				alert("请输入排序!");
				$("#pOrder").focus();
				return false;
			}
			if($("#pAbstract").val()==""){
				alert("请输入简介!");
				$("#pAbstract").focus();
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
			alert("添加失败，该标题已存在！");
			$("#pTitle").select();
			$("#pTitle").focus();
		}
		function failed1(){
			alert("修改失败，该标题已存在！");
			$("#pTitle").select();
			$("#pTitle").focus();
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
	                var $img = $("<img class='img' width='350px'>");
	                $('#preview').append($img);
	                $img.attr('src', imgArr[i]);
	            }
	        });
		})
	</script>
</body>
</html>