<%@page import="java.util.Date"%>
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
    <form action="/Login" method="post">
    <div>${checkLogin}</div>
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
                	<button type="submit" value="login">登录</button>
                	<a href="register">注册</a>
                </div>
            </div>
        </div>
    </form>
  
    
</body>
</html>