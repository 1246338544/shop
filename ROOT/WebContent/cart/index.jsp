<%@page import="dao.Product"%>
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
	Integer limit = 10;
	%>
	<%
	LinkedList<Product> shopList = new LinkedList<>();
	String deleteItem = request.getParameter("deleteItem");
	%>
	<header><%@ include file="../header.jsp"%></header>
	<jsp:useBean id="cart" class="dao.Cart"></jsp:useBean>
	<%
	cart.setUserName((String) session.getAttribute("userName"));
	if (deleteItem != null && session.getAttribute("userName") != null) {
		cart.setProductId(Integer.valueOf(deleteItem));
		cart.delete();
	}
	String number = request.getParameter("number");
	if (number != null) {
		cart.update(Integer.valueOf(number), Integer.valueOf(request.getParameter("product_id")));
		System.out.print(number);
	}
	%>
	<div>
		<h5>商品列表</h5>

		<ul class="product-list">
			<%
			ResultSet rs = cart.selectAllUnchecked();
			request.setAttribute("isEmply", !rs.next());
			rs.beforeFirst();

			while (rs.next()) {
			%>
			<li>

				<form action="./index.jsp" method="get">
					<input type="hidden" name="product_id"
						value="<%=rs.getInt("product_id")%>" />
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
								value="<%=rs.getInt("number")%>"></td>
						</tr>
						<tr>
							<td><button type="submit" form="deleteItem"
									value="<%=rs.getInt("product_id")%>" name="deleteItem">删除商品</button></td>
							<td><button type="submit">修改商品数量</button></td>
						</tr>
					</table>
				</form>
			</li>

			<%
			}
			%>
		</ul>
		<div ${!isEmply?"hidden":null}>
			您的购物车还是空的，赶紧行动吧！您可以：<br> 看看 <a href='history'>已买到的宝贝</a>
		</div>
		<button type="button" id='checkout' ${isEmply?"hidden":null}>购买</button>

		<form action="./index.jsp" id="deleteItem" method="post"></form>

	</div>
	<script type="text/javascript" src="../js/cart.js">
		
	</script>
</body>
</html>