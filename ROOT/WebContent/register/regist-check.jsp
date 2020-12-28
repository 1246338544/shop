<%@page import="java.net.PasswordAuthentication"%>
<%@page import="exception.UserException"%>
<%@page import="dao.Result"%>
<%@page import="dao.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册验证</title>
<style>
div {
	text-align: center;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	try {
		boolean result = User.regist(new PasswordAuthentication(request.getParameter("username"),
		request.getParameter("password").toCharArray()));
		if (result) {
				%>
				<div>注册成功</div>
				<a href="../index.jsp">点击此处回到登录界面</a>
				<%
				  response.setHeader("refresh", "3;URL=../index.jsp;");
		} else {
				%>
				<a href="../register">点击回到注册页面</a>
				<%
		}
	} catch (UserException e) {
		out.print(e.getMessage());
	}
	%>
	<div></div>
</body>
</html>