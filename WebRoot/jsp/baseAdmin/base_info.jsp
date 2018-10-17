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
	<form action="save.html" name="baseForm" id="baseForm" target="result" method="post" onsubmit="return checkInfo();" enctype="multipart/form-data">
		<input type="hidden" name="bId" id="bId" value="${base.bId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th><font color="red">*</font>基地名称:</th>
			<td><input type="text" name="bName" id="bName" class="input_txt" value="${base.bName }"/></td>
		</tr>
		<tr class="info">
			<th>基地种类:</th>
			<td><select name="bType" id="bType">
				<option value="" >请选择</option>
				<option value="0" <c:if test="${base.bType==0}">selected</c:if>>区域示范基地</option>
			    <option value="1" <c:if test="${base.bType==1}">selected</c:if>>高校和科研院所示范基地</option>
			    <option value="2" <c:if test="${base.bType==2}">selected</c:if>>企业示范基地</option>
			   </select></td>
		</tr>
		<tr class="info">
			<th>基地批次</th>
			<td>
			<select name="bBatch" id="bBatch">
				<option value="" >请选择</option>
				<option value="0" <c:if test="${base.bBatch==0}">selected</c:if>>首批</option>
			    <option value="1" <c:if test="${base.bBatch==1}">selected</c:if>>第二批</option>
			</select>
			</td>
		</tr>
        <tr class="info">
            <th>所属区域:</th>
            <td>
                <select name="bArea" id="bArea" style="vertical-align: middle;">
                    <option value="0">请选择</option>
                    <c:forEach items="${areas}" var="area">
                        <option value="${area.aId}" <c:if test="${base.bArea==area.aId }">selected</c:if>>${area.aName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr class="info">
            <th>发布单位:</th>
            <td>
                <select name="bIssuerOrg" id="bIssuerOrg" style="vertical-align: middle;">
                    <option value="0">请选择</option>
                    <c:forEach items="${institutions}" var="institution">
                        <option value="${institution.inId}" <c:if test="${base.bIssuerOrg==institution.inId }">selected</c:if>>${institution.inName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr class="info">
            <th>第一标题:</th>
            <td><input type="text" name="bTitle1" id="bTitle1" class="input_txt" value="${base.bTitle1}"/></td>
        </tr>
        <tr class="info">
            <th>第一内容:</th>
            <td><textarea name="bContent1" id="bContent1" class="input_txt">${base.bContent1}</textarea></td>
        </tr>
        <tr class="info">
            <th>第二标题:</th>
            <td><input type="text" name="bTitle2" id="bTitle2" class="input_txt" value="${base.bTitle2}"/></td>
        </tr>
        <tr class="info">
            <th>第二内容:</th>
            <td><textarea name="bContent2" id="bContent2" class="input_txt">${base.bContent2}</textarea></td>
        </tr>
        <tr class="info">
            <th>第三标题:</th>
            <td><input type="text" name="bTitle3" id="bTitle3" class="input_txt" value="${base.bTitle3}"/></td>
        </tr>
        <tr class="info">
            <th>第三内容:</th>
            <td><textarea name="bContent3" id="bContent3" class="input_txt">${base.bContent3}</textarea></td>
        </tr>

        <tr class="info">
            <th>第四标题:</th>
            <td><input type="text" name="bTitle4" id="bTitle4" class="input_txt" value="${base.bTitle4}"/></td>
        </tr>
        <tr class="info">
            <th>第四内容:</th>
            <td><textarea name="bContent4" id="bContent4" class="input_txt">${base.bContent4}</textarea></td>
        </tr>

        <tr class="info">
            <th>第五标题:</th>
            <td><input type="text" name="bTitle5" id="bTitle5" class="input_txt" value="${base.bTitle5}"/></td>
        </tr>
        <tr class="info">
            <th>第五内容:</th>
            <td><textarea name="bContent5" id="bContent5" class="input_txt">${base.bContent5}</textarea></td>
        </tr>

        <tr class="info">
            <th>第六标题:</th>
            <td><input type="text" name="bTitle6" id="bTitle6" class="input_txt" value="${base.bTitle6}"/></td>
        </tr>
        <tr class="info">
            <th>第六内容:</th>
            <td><textarea name="bContent6" id="bContent6" class="input_txt">${base.bContent6}</textarea></td>
        </tr>
        <tr class="info">
            <th>第七标题:</th>
            <td><input type="text" name="bTitle7" id="bTitle7" class="input_txt" value="${base.bTitle7}"/></td>
        </tr>
        <tr class="info">
            <th>第七内容:</th>
            <td><textarea name="bContent7" id="bContent7" class="input_txt">${base.bContent7}</textarea></td>
        </tr>
        <tr class="info">
            <th>第八标题:</th>
            <td><input type="text" name="bTitle8" id="bTitle8" class="input_txt" value="${base.bTitle8}"/></td>
        </tr>
        <tr class="info">
            <th>第九标题:</th>
            <td><input type="text" name="bTitle9" id="bTitle9" class="input_txt" value="${base.bTitle9}"/></td>
        </tr>
		<tr class="info">
			<th><font color="red">*</font>排序:</th>
			<td><input type="text" name="bOrder" id="bOrder" class="input_txt" value="${base.bOrder }"/></td>
		</tr>
		<c:if test="${base.bFileSrc!=null and base.bFileSrc!='' }">
		<tr class="info">
			<th>原图:</th>
			<td><img src="${base.bFileSrc }" width="100px"></td>
		</tr>
		</c:if>
		<tr class="info">
			<th>上传基地图片:</th>
			<td><input type="file" name="file" id="file" accept="image/*">
				<input type="hidden" name="bFileSrc" id="bFileSrc" value="${base.bFileSrc }">
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
				$("#baseForm").submit();
			});
		});
		function checkInfo(){
			if($("#bName").val()==""){
				alert("请输入名称!");
				$("#bName").focus();
				return false;
			}
			if($("#bOrder").val()==""){
				alert("请输入排序!");
				$("#bOrder").focus();
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
			alert("该基地已存在！");
			$("#bName").select();
			$("#bName").focus();
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