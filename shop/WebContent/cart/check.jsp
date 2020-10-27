<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结账</title>
</head>
<body>
  <%
    String name[]=request.getParameterValues("name");
  	String number[] = request.getParameterValues("number");
  	String price[] = request.getParameterValues("price");
  	Float sum = Float.valueOf(0);
  	for(Integer i =0;i<name.length;i++){
  		%>
  		<div>商品名<%=name[i]%></div>
  		<div>商品数量<%=number[i] %></div>
  		<div>商品价格<%=price[i] %></div>
  		<div>实际价格<%=Float.valueOf(price[i])*Integer.valueOf(number[i]) %></div>
  		<% 
  		sum+=Float.valueOf(price[i])*Integer.valueOf(number[i]);
  	}
  %>
  <button type="submit">提交</button>
</body>
</html>