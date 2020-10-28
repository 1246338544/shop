<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册账户</title>
</head>
<body>
  <form action="regist-check.jsp" method="post">
    <table border="1">
      <tr>
        <td>用户名：</td>
        <td><input name="username" type="text" required="required"></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input name="password" type="password" required="required"></td>
      </tr>
      <tr>
        <td>确认密码</td>
        <td><input name="repeatPassword" type="password" required="required"></td>
      <tr>
      <tr>
      <td><button type="submit">提交</button></td>
      <td><button type="reset">重置</button></td>
      </tr>
    </table>
  </form>
</body>
</html>