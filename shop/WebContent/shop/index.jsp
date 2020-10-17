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
<style type="text/css">
  .product-list li {
   list-style:none;
   display:inline;
   float:left;
   width: 230px;
   height: 315px;
  }
  body{
  width:1190px;
  height:400px;
  margin:auto;
  }
</style>

</head>
<body>
	<jsp:useBean id="product" class="controller.Product"></jsp:useBean>
	<%!Integer offset = 0;
	Integer limit = 10;%>
	<%
		ResultSet rs = null;
	String search = request.getParameter("search");
	if (search == null) {
		rs = product.getProduct(offset, limit);
	} else {
		rs = product.getProduct(offset, limit, search);
	}
	%>
	<header><jsp:include page="/header.jsp"></jsp:include></header>
	<form>
		<input name="search" type="search" />
		<button type='submit'>搜索</button>
	</form>
	<div>
	<h5>商品列表</h5>
	<ul class="product-list">
<%
			while (rs.next()) {
%>
		<li>
			<form>
				<table>
					<tr>
						<td>商品名</td>
						<td><%=rs.getString("name")%><input type="hidden" name="name"
							value="<%=rs.getString("name")%>"></td>
					</tr>
					<tr>
						<td>商品价格</td>
						<td><%=rs.getFloat("price")%><input type="hidden"
							name="price" value="<%=rs.getString("price")%>"></td>
					</tr>
					<tr>
						<td><button name="id" type="submit"
								value="<%=rs.getInt("id")%>">添加</button></td>
					</tr>
				</table>
			</form>
		</li>

<%
			}
%>
		
	</ul>
	</div>
	<%
		if (request.getParameter("id") != null) {
		@SuppressWarnings("unchecked")
		LinkedList<Product> list = (LinkedList<Product>) session.getAttribute("shopList");
		if (list == null)
			list = new LinkedList<>();
		Product Product = new Product(Integer.valueOf(request.getParameter("id")), request.getParameter("name"),
		Float.valueOf(request.getParameter("price")));
		list.add(Product);
		session.setAttribute("shopList", list);
	}
	%>



</body>
</html>