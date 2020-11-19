<%@page import="controller.Cart"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结账</title>
<link rel="stylesheet" type="text/css" href="../css/body.css">
</head>
<body>
	<header><%@include file="/header.jsp" %></header>
	<jsp:useBean id="cart" class='controller.Cart' scope="session">
		<jsp:setProperty property="userName" name="cart"
			value='<%=(String) session.getAttribute(\"userName\")%>' />
	</jsp:useBean>
	<%
		ResultSet rs = cart.selectAllUnchecked();
	%>
	<ul class='product-list'>
		<%
		Float sum = 0.f;
			while (rs.next()) {
				sum+=rs.getFloat("price")*rs.getInt("number");
		%>
		<li>
			<table>
				<tr>
					<td>商品名</td>
					<td><%=rs.getString("name")%></td>
				</tr>
				<tr>
					<td>商品价格</td>
					<td><%=rs.getFloat("price")%></td>
				</tr>
				<tr>
					<td>数量</td>
					<td><input name="number" type="number" min="1" max="200"
						value="<%=rs.getInt("number")%>" readonly="readonly"></td>
				</tr>
			</table>
		</li>
		<%
			}
		%>
		<li>商品总价:<%=sum%></li>
	</ul>
	<a><button>点击付款</button></a>
</body>
</html>