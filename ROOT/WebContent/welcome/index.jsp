<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="../css/body.css">
</head>
<body>
	<%
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    
     
    %>
	<jsp:useBean id="login" class="controller.Login" />
	<% 
    try{
	        if(login.isLogin(userName, password.toCharArray()))
	        { 
	        	session.setAttribute("userName", userName); 
	    	}
	        else
	        {
    %>
	<script>
        alert("请检查你的的用户名和密码")
        window.location.href = "../index.jsp"
    </script>
	<% 
        	} 
        }catch (Exception e){
        	%>
        	<script>
        	alert('<%=e.getMessage()%>')
        	window.location.href = "../index.jsp"
        	</script>
        	<% 
        }
    
    %>
	欢迎光临,五秒后自动跳转到购物页面,立即跳转请点击
	<a href="../shop">跳转</a>
	<script>
 setTimeout(()=>{window.location.href = "../shop"},5000)
</script>
</body>
</html>