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
    <header><%@include file="/header.jsp"%></header>
	<jsp:useBean id="product" class="controller.Product"></jsp:useBean>
	<%
	Integer offset = 0;
	Integer limit = 10;
	%>
	<%
	String search = request.getParameter("search_query");
	ResultSet rs = null;
	if (search == null)
		rs = product.getProduct(offset, limit);
	else
		rs = product.getProduct(offset, limit, search);
	if(request.getParameter("id")!=null){
	Integer productId = Integer.valueOf(request.getParameter("id"));
	Cart cart = new Cart();
	cart.setProductId(productId);
	if (session.getAttribute("userName") instanceof String)
	  {
		cart.setUserName((String)session.getAttribute("userName"));
	  }
		if(Integer.valueOf(1).equals(cart.insert())){
			%>
			<script>
			 alert("插入成功")
			</script>
			<% 
		}
	}
	%>
	
	<form>
		<input name="search_query" type="search" />
		<button type='submit'>搜索</button>
	</form>
	<div>
		<h5>商品列表</h5>
		<ul class="product-list">
			<%
				while (rs.next()) {
			%>
			<li>
				<form method="post">
					<table>
						<tr>
							<td>商品名</td>
							<td><%=rs.getString("name")%><input type="hidden"
								name="name" value="<%=rs.getString("name")%>"></td>
						</tr>
						<tr>
							<td>商品价格</td>
							<td>￥<%=rs.getFloat("price")%><input type="hidden"
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
			rs.close();
			%>

		</ul>
	</div>

</body>
</html>