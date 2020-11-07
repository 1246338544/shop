<%@page import="controller.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	width: 1190px;
	height: 400px;
	margin: auto;
}
</style>
<meta charset="UTF-8">
<title>购物车</title>
</head>
<body>

	<%
	Integer offset = 0;
	Integer limit = 10;%>
	<%
	LinkedList<Product> shopList = new LinkedList<>();
	String deleteItem = request.getParameter("deleteItem");
	%>
	<header><%@ include file="../header.jsp" %></header>
	<jsp:useBean id="cart" class="controller.Cart"></jsp:useBean>
	  <%
	  cart.setUserName((String)session.getAttribute("userName"));
	  if (deleteItem!=null && userName!=null){
		  cart.setProductId(Integer.valueOf(deleteItem));
		  cart.delete();
	  }
	  String number =request.getParameter("number");
	  if (number != null){
		  cart.update(Integer.valueOf(number),Integer.valueOf(request.getParameter("product_id")));
		  System.out.print(number);
	  }
	  %>
	<div>
		<h5>商品列表</h5>
		
			<ul class="product-list">
				<%
					ResultSet rs = cart.selectAll();
					while(rs.next()) {
				%>
				<li>
					<form action="./index.jsp" method="get">
					<input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>"/>
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
								value="<%=rs.getInt("number") %>"></td>
						</tr>
						<tr>
						     <td><button type="submit" form="deleteItem" value="<%=rs.getInt("product_id") %>" name="deleteItem">删除商品</button></td>
						     <td><button type="submit">修改商品数量</button></td>
						</tr>
					</table>
					</form>
				</li>

				<%
					}
					rs.close();
				%>
			</ul>
			<button type="submit">购买</button>
		
		<form action="./index.jsp" id="deleteItem" method="post"></form>
		
	</div>
</body>
</html>