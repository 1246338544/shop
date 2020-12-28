<%@page import="dao.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单历史</title>
</head>
<body>
	<jsp:useBean id="cart" class='dao.Cart'></jsp:useBean>
	<jsp:setProperty property="userName" name="cart" value='${userName}' />
	<%
	   ArrayList<Cart> rs = cart.selectAllOrderById();
	%>
	<div>
	<%
		for(Cart p:rs){
	%>
			<table>
				<tr>
					<td>商品名</td>
					<td>${p.productName}</td>
				</tr>
				<tr>
					<td>商品价格</td>
					<td>￥${p.price }</td>
				</tr>
				<tr>
					<td>商品数量</td>
					<td>${p.number}</td>
				</tr>
				<tr>
				    <td>日期</td>
				    <td>${p.date }</td>
				</tr>
			</table>
	<%
					} 
	%>
		</div>
</body>
</html>