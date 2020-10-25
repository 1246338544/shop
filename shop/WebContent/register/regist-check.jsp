<%@page import="entity.Result"%>
<%@page import="service.Register"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册验证</title>
<style>
  div {
    text-align:center;
  }
</style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	Result result = Register.check(
			request.getParameter("username"), 
			request.getParameter("password").toCharArray(), 
			request.getParameter("repeatPassword").toCharArray());
	if (result.isResult()){
		%>
		<%=result.getMessage() %>
		<a href="../index.jsp">点击此处回到登录界面</a>
		<% 
		response.setHeader("refresh", "3;URL=../index.jsp;");
	}else{
		%>
		
		<%=result.getMessage()%>
		<a href="../register">点击回到注册页面</a>
		<% 
	}
%>
<div>

</div>
</body>
</html>