<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Button"%>
<%@page import="controller.Cart"%>
<%@page import="controller.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物</title>
<link rel="stylesheet" type="text/css" href="../css/body.css">
</head>
<body>
	<header>
		<jsp:include page="/header.jsp"><jsp:param value="flase"
				name='logout' /></jsp:include>
	</header>

	<%
		ArrayList<Product> products = Product.cast(request.getAttribute("products"));
	%>
	<script>
		alert("插入成功")
	</script>
	<%
		
	%>

	<form>
		<input name="search_query" type="search" />
		<button type='submit'>搜索</button>
	</form>
	<div>
		<h5>商品列表</h5>
		<ul class="product-list">
			<%
				for (Product p : products) {
			%>
			<li>
				<form method="post" Action="/Shop">
					<table>
						<tr>
							<td>商品名</td>
							<td>${product.name}<input type="hidden" name="name"
								value="${product.name}"></td>
						</tr>
						<tr>
							<td>商品价格</td>
							<td>￥${p.price }<input type="hidden" name="price"
								value="${p.price }"></td>
						</tr>
						<tr>
							<td><button name="id" type="submit" value="${p.id }">添加</button></td>
						</tr>
					</table>
				</form>
			</li>

			<%
				}
			%>

		</ul>
	</div>

</body>
</html>