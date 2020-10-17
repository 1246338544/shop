<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>桃饱网</title>
<style type="text/css">
    form {
        margin:auto;
        text-align:center;
        position: absolute;
        top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    width: 350px;
	    height: 350px;
	    border:1px solid gray;
    }
    table div div{
        margin:auto;
        border:1px solid gray;
    }
    header {
        text-align: center;
        background: gray;
        padding-top:5px;
        padding-bottom: 5px;
        font-size:20px;
    }
    .loginbox div div{
     text-align:right;
     margin-right:45px;
     margin-top:50px;
    }
    .loginbox div input{
      height: 30px;
    }
</style>
</head>
<body>
<header> 让每个人都吃的起桃子 </header>
    <form action="index.jsp" method="post">
        <div class="loginbox">
            <div>
                <div>用户名：
                <input name="username"/></div>
            </div>
            <div>
                <div>密码：
                <input name="password" type="password"/></div>
            </div>
            <div>
                <div>
                	<button type="submit" name="submit" value="login">登录</button>
                	<button type="submit" name="submit" value="register">注册</button>
                </div>
            </div>
        </div>
    </form>
    <%
    String submit = request.getParameter("submit");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if ( submit == null);
    else if (submit.equals("register")){response.sendRedirect("register");}
    else {
    %>
    <jsp:useBean id="login" class="jsp.Login" />
    <% 
        if(login.isLogin(username, password.toCharArray()))
        { 
        	login.close();
    	    response.sendRedirect("welcome"); 
    	}
        else
        {
    %>
    <script>
        alert("请检查你的的用户名和密码")
    </script>
    <% 
        login.close();
    }
    }
    %>
    
</body>
</html>