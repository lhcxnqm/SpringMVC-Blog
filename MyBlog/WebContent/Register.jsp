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

    <div class="container" style="height:700px;width:400px;margin:10% auto;">
      <form class="form-signin" action="Register" method="post">
        <h2 class="form-signin-heading">欢迎来到注册界面</h2>
        <input style="margin-top:2%" type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <input style="margin-top:2%" type="password" name="password" id="password" class="form-control" placeholder="Password" required>
        <input style="margin-top:2%" type="password" name="passwordconfirm" id="passwordconfirm" class="form-control" placeholder="ConfirmPassword" required>
        <br>
        <% String error = (String)request.getAttribute("error");
			if (error != null && !"".equals(error)){ %>
		<p style="color:red;text-align:center;"><%=error %></p>
		<% } %>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">点我注册</button>
      </form> 	
    </div>

  </body>
</html>

    