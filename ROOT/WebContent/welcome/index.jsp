<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="../css/body.css">
</head>
<body>
	欢迎光临,五秒后自动跳转到购物页面,立即跳转请点击
	<a href="../Shop">跳转</a>
	<script type="text/javascript">
 setTimeout(()=>{window.location.href = "../shop"},5000)
</script>
</body>
</html>