<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
</head>
<body>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg=="success" || msg==""){
			parent.success();
		}else if(msg=="failed"){
			parent.failed();
		}else if(msg=="failed1"){
			parent.failed1();
		}
	</script>
</body>
</html>