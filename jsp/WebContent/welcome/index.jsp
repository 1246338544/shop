<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
欢迎光临,五秒后自动跳转到购物页面,立即跳转请点击<a href="../shop">跳转</a>
<script>
 setTimeout(()=>{window.location.href = "../shop"},5000)
</script>
</body>
</html>