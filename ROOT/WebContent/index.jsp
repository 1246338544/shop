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
    /*dfds*/
    #login-message {
      color:red;
    }
    body {
    	background-color: #FCFCE8;
    }
</style>
</head>
<body>
<header> 让每个人都吃的起桃子 </header>
    <form action="/Login" method="post">
    <div id='login-message'>${checkLogin}</div>
    <font face=""></font>
        <div class="loginbox">
            
            <div>
            
                <div>用户名：
                <input name="username" placeholder="请输入用户名"/></div>
            </div>
            <div>
                <div>密码：
                <input name="password" type="password" placeholder='请输入登录密码'/></div>
            </div>
            <div>
                <div>
                	<button type="submit" value="login">登录</button>
                	<a href="register"><button type='button'>注册</button></a>
                	<a href='change/password'>修改密码</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>