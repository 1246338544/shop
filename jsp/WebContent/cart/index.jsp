<%@page import="jsp.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; chaproductvoet=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
</head>
<body>
		<% 
		  
		  
		%>
	<jsp:useBean id="product" class="jsp.Product"></jsp:useBean>
	<%!Integer offset = 0;
	Integer limit = 10;%>
	<%
	LinkedList<Product> shopList = new LinkedList<>();
	String deleteItem = request.getParameter("delete");
	
	if (session.getAttribute("shopList") == null)
		session.setAttribute("shopList", shopList);
	
	for (Object obj : (LinkedList<?>) session.getAttribute("shopList")) {
		if (obj instanceof Product)
			shopList.add((Product) obj);
		else throw new Exception("未知错误，购物车页面出错");
	}
	%>
	<header><jsp:include page="/header.jsp"></jsp:include></header>

	<div>
		<h5>商品列表</h5>
		<form>
			<ul class="product-list">
				<%
					for (Product Product : shopList) {
				%>
				<li>

					<table>
						<tr>
							<td>商品名</td>
							<td><%=Product.getName()%><input type="hidden" name="name"
								value="<%=Product.getName()%>"></td>
						</tr>
						<tr>
							<td>商品价格</td>
							<td><%=Product.getPrice()%><input type="hidden"
								name="price" value="<%=Product.getPrice()%>"></td>
						</tr>
						<tr>
							<td>数量</td>
							<td><input type="number"
								value=<%=Product.getNumberOfProduct()%>></td>
						</tr>
						<tr>
						     <td><button type="submit" form="deleteItem" value="<%=Product.getId() %>" name="deleteItem">删除商品</button></td>
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