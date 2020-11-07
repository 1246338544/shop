<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.header {
	margin-top: 0;
	margin-bottom: 20px;
	background: gray;
	padding-top: 5px;
	padding-bottom: 5px;
}

.header li {
	list-style: none;
	display: inline;
	margin-right: 50px;
}
</style>
</head>
<body>
	<%
	String userName = (String)session.getAttribute("userName");
	if ("true".equals(request.getParameter("logout"))||userName == null) {
		session.invalidate();
		response.sendRedirect("/shop");
	}else{
	userName = (String) session.getAttribute("userName");
	%> 
	<ul class="header">
		<li><%=userName%></li>
		<li><a href="../shop">商城</a></li>
		<li><a href="../cart">购物车</a></li>
		<li style="margin-left: 75%;"><a
			href="/shop/header.jsp?logout=true"><button>退出</button></a></li>
	</ul>
	<% }%>
</body>
</html>