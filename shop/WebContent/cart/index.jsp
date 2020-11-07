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
		  out.print(deleteItem);
		  cart.delete();
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
					
					<table>
						<tr>
							<td>商品名</td>
							<td><%=rs.getString("name")%><input type="hidden" name="name"
								value="<%=rs.getString("name")%>"></td>
						</tr>
						<tr>
							<td>商品价格</td>
							<td><%=rs.getFloat("price")%><input type="hidden"
								name="price" value="<%=rs.getFloat("price")%>"></td>
						</tr>
						<tr>
							<td>数量</td>
							<td><input type="number" min="1" max="200"
								value="<%=rs.getInt("number") %>"></td>
						</tr>
						<tr>
						     <td><button type="submit" form="deleteItem" value="<%=rs.getInt("product_id") %>" name="deleteItem">删除商品</button></td>
						     <td><button>修改商品数量</button></td>
						</tr>
					</table>

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