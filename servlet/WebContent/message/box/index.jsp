<%@page import="com.joker.bean.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示MessageBox内容</title>
<style type="text/css">
	li>div {
	    border-width: 1px;
	    border-color: black;
	    border-style: solid;
	}
</style>
</head>
<body>
	<%	
		ArrayList<Message> messages = Message.cast(
				(ArrayList<?>)application.getAttribute("messages"));
	%>
	<%if(!messages.isEmpty())
		for(int i = messages.size() - 1 ;i > -1;i--){
			Message message = messages.get(i);
		%>
	<ul>
	  <li>title <div><%=message.getTitle() %></div></li>
	  <li>author <div><%=message.getAuthor() %></div></li>
	  <li>datetile <div><%=message.getDatetime() %></div></li>
	  <li>content <div><%=message.getContent() %></div></li>
	</ul>
	<hr>
	<%}else
	{
		%>
		当前无人发言
		<%  
	}
		%>
	<a href="../../">回到发帖页面</a>
</body>
</html>