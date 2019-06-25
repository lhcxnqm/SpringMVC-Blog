<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录界面</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

	<style>
		body{ 
			background-color:#F0ECD6; 
			background-image:Url(Images/water.png); 
			background-position:top; 
			background-repeat:repeat-x; 
		}
	</style>

  </head>

  <body style="background-image:url('images/background.jpg')">

    <div class="container" style="height:300px;width:400px;margin:10% auto;">
      <form class="form-signin" action="Login" method="post">
        <h2 class="form-signin-heading">欢迎来到登录界面</h2>
        <label for="login-name" class="sr-only">username</label>
        <input type="text" name="username" class="form-control" placeholder="Login-name" required autofocus>
        <label for="inputPassword" class="sr-only">password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required style="margin-top:1%">
        <div class="checkbox">
          <label>
            <input type="radio" value="administrators" name="choice"> 管理员
            <input type="radio" value="user" name="choice"> 用户
          </label>
        </div>
        
        <% String error = (String)request.getAttribute("error");
			if (error != null && !"".equals(error)){ %>
		<p style="color:red;text-align:center;"><%=error %></p>
		<% } %>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>
      	<br>
      	还没账号？<a href="/MyBlog/Register.jsp">点我注册</a>    	

    </div>

  </body>
</html>

    