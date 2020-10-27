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
	String deleteItem = request.getParameter("delete");
	
	if (session.getAttribute("shopList") == null)
		session.setAttribute("shopList", shopList);
	
	for (Object obj : (LinkedList<?>) session.getAttribute("shopList")) {
		if (obj instanceof Product){
			if(deleteItem!=null && ((Product)obj).getId().equals(Integer.valueOf(deleteItem)));
			else shopList.add((Product) obj);
		}
		else throw new Exception("未知错误，购物车页面出错");
	}
	%>
	<header><%@ include file="../header.jsp" %></header>
	
	<div>
		<h5>商品列表</h5>
		<form action="" method="post">
			<ul class="product-list">
				<%
					for (Product product : shopList) {
				%>
				<li>

					<table>
						<tr>
							<td>商品名</td>
							<td><%=product.getName()%><input type="hidden" name="name"
								value="<%=product.getName()%>"></td>
						</tr>
						<tr>
							<td>商品价格</td>
							<td><%=product.getPrice()%><input type="hidden"
								name="price" value="<%=product.getPrice()%>"></td>
						</tr>
						<tr>
							<td>数量</td>
							<td><input type="number" min="1" max="200"
								value=<%=product.getNumberOfProduct()%>></td>
						</tr>
						<tr>
						     <td><button type="submit" form="deleteItem" value="<%=product.getId() %>" name="deleteItem">删除商品</button></td>
						</tr>
					</table>

				</li>

				<%
					}
				%>
			</ul>

			<button type="submit">购买</button>
		</form>
		<form action="post" id="deleteItem"></form>
		
	</div>
</body>
</html>