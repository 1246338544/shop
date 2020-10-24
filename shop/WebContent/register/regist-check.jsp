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
	String Message = Register.check(
			request.getParameter("username"), 
			request.getParameter("password").toCharArray(), 
			request.getParameter("repeatPassword").toCharArray()).getMessage();
%>
<div><%=Message%>

</div>
</body>
</html>