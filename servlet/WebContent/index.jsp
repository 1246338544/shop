<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add message</title>
</head>
<body>
  <form action="Message" method="post">
    <ul>
      <li>title:</li>
      <li><input type="text" name="title" required="required"/></li>
      <li>author:</li>
      <li><input type="text" name="author" required="required"/></li>
      <li>content:</li>
      <li><textarea name="content" cols="40" rows="10" required="required"></textarea></li>
    </ul>
    <button type="submit">发布</button>
    <a href="message/box">查看留言板</a>
  </form>
</body>
</html>