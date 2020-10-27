<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.header {
   margin-top:0;
   margin-bottom:20px;
   background: gray;
   padding-top:5px;
   padding-bottom: 5px;
}
.header li{
   list-style:none;
   display:inline;
   margin-right:50px;
}
</style>
</head>
<body>
<% 
    String username = (String)session.getAttribute("username");
	if(username == null) {	
		response.setHeader("refresh", "0;URL=../index.jsp");
	}
	if ("true".equals(request.getParameter("logout"))){
		session.invalidate();
	}
%>
<ul class="header">
	<li><%=username %></li>
	<li><a href="../cart">购物车</a></li>
	<li><a href="../shop">商城</a></li>
	<li style="margin-left:75%;"><a href="/shop?logout=true"><button>退出</button></a></li>
</ul>
</body>
</html>