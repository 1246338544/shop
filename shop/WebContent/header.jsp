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
    String user = (String)session.getAttribute("user");
	if(user == null) {
		user = "未登录";	
	}
%>
<ul class="header">
	<li><%= user %></li>
	<li><a href="../cart">购物车</a></li>
	<li><a href="../shop">商城</a></li>
	<li style="margin-left:75%;"><button type="submit" name="quit" value="yes">退出</button></li>
</ul>
</body>
</html>