<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>My Test</title>
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
    <link type="text/css" rel="stylesheet" href="css/main.css"/>
</head>
<body>
<form action="note.html" method="post" id="NoteForm" name="NoteForm">
    <div style="margin-top: 10px">编辑之前，请先选择一条记录。</div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
        <tr class="main_head">
            <th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllNote()"/></th>
            <th style="text-align:left" width="50px">序号</th>
            <th style="text-align:left">留言须知</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
        </tr>
        <tr class="main_info">
              <td><input type="checkbox" name="noteIds" id="noteIds${note.nId }" value="${note.nId }"/></td>
              <td>1</td>
              <td colspan="7" style="text-align:left;white-space: nowrap;overflow: hidden">${note.nContent }</td>
         </tr>

    </table>
    <div class="page_and_btn">
        <div>
            <a href="javascript:updateNote();" class="myBtn"><em>编辑</em></a>
        </div>
    </div>
</form>
<script>
    $(document).ready(function(){
        $(".main_info:even").addClass("main_table_even");
    });
    function sltAllNote(){
        if($("#sltAll").attr("checked")){
            $("input[name='noteIds']").attr("checked",true);
        }else{
            $("input[name='noteIds']").attr("checked",false);
        }
    }

    function updateNote() {
        var chk_value = [];//定义一个数组
        $("input[name='noteIds']:checked").each(function () {
            //将选中额数据存到数组里
            chk_value.push($(this).val());
        });
        if(chk_value.length==1){
            var dg = new $.dialog({
                title:'修改',
                id:'note_edit',
                width:450,
                height:490,
                iconTitle:false,
                cover:true,
                maxBtn:false,
                resize:false,
                page:'note/toUpdateNote.html'
            });
            dg.ShowDialog();
        }else {
            alert("请选择一条记录!")
        }
    }
    $('.main_info td').css({"white-space": "nowrap","text-overflow": "ellipsis","overflow": "hidden"});
</script>

</body>
</html>
