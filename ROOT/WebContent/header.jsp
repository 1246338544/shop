<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.header {
	margin-top: 0;
	margin-bottom: 20px;
	background: gray;
	padding-top: 5px;
	padding-bottom: 5px;
}

.header li {
	list-style: none;
	display: inline;
	margin-right: 50px;
}
</style>
</head>
<body>
	<ul class="header">
		<li><a href="../shop">商城</a></li>
		<li><a href="../cart">购物车</a></li>
		<li style="margin-left: 75%;">
		<a href="/logout"><button>退出</button></a></li>
	</ul>
</body>
</html>