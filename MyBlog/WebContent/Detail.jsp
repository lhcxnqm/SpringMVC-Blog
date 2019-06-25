<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,blog.bean.*" %>
  
<% String base = request.getContextPath() + "/"; %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>文章详情页</title>
	<link href="<%=base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=base %>font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=base %>css/style.css" rel="stylesheet">
    <link href="<%=base %>css/owl.carousel.css" rel="stylesheet">
    
	</head>
<body>

	<!-- 这是导航窗格的控制 -->
	<div class="navbar-default" role="navigation" style="background-color: #563b42">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: #f18e26">Sites</a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar-collapse" class="collapse navbar-collapse" >
                <ul class="nav navbar-nav">
                    <li class=""><a href="<%=base %>user/Index?page=1" style="color: #f18e26;">首页</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li><a class="fa fa-power-off" style="color: #f18e26">欢迎你，<%=request.getAttribute("user") %></a></li>
                    <li><a href="<%=base %>Login" class="fa fa-sign-out" style="color: #f18e26">退出</a></li>
                </ul>
            </div>
        </div>
    </div>

	<!-- 这是中间内容的设置 -->
	<div >
        <br>
        <div class="container">
            <img src="<%=base %>images/barback.jpg" style="width: 1200px;height: 120px;">
        </div>
        <br>

		<% Post post = (Post)request.getAttribute("post"); %>
	
		<div class="col-md-8 col-md-offset-2">
	        <div class="panel panel-default">
	            <div class="panel panel-heading" style="text-align: center">《<%=post.getTitle() %>》</div>
	            <div class="panel panel-body" style="text-align:center;">	
		                    类型：<%=post.getCategory_title() %>&nbsp;&nbsp;
		                    发表日期：<%=post.getCreated_at() %>&nbsp;&nbsp;
		                    阅读数：<%=post.getView_count() %>
	                <hr>
	                <span class="text-center"><%=post.getContent() %></span>
	            </div>
	        </div>

	        <div class="row">
	            <div class="col-xs-10 col-xs-offset-1">
	                <div class="comment-area">
	                        <form id="comment_form" action="<%=base %>user/Detail?id=<%=post.getId() %>" method="post">
	                        	<input name="user" value="<%=request.getAttribute("user") %>" type="hidden">
	                        	<input name="title" value="<%=post.getTitle() %>" type="hidden">
	                            <div class="form-group">
	                                <label for="comment-text"><%=request.getAttribute("user") %>，欢迎评论~</label>	
	                                <% String error = (String)request.getAttribute("error");
										if (error != null && !"".equals(error)){ %>
									<p style="color:red;text-align:center;"><%=error %></p>
									<% } %>								
	                            </div>
	                            <textarea name="content"></textarea>
	                            <span id="comment_error" class="text-danger"></span>
	                            <input type="submit" value="评论" class="btn btn-primary" style="float: right">
	                        </form>

	                </div>
	                <div class="comment-area">	                		                
	                    <h3 class="comment-area-title">评论列表</h3>
	                    <div id="comment_list">
	                    	<% List<Reply> replys = (List<Reply>)request.getAttribute("replys");
	                    		if(replys.isEmpty()) { %> 暂无评论 <% } 
	                    	   else 
	                    		  for(Reply reply:replys){ %>
	                    		  	<br><br>
	                    		  	<%=reply.getUsername() %>&nbsp;
	                    	   		<%=reply.getCreated_at() %>
	                    	   		<br><%=reply.getContent() %>
	                    	   <% } %>
                        </div>
                    </div>
                    <hr>
                    <center><a href="<%=base %>user/Index?page=1"">回到首页</a></center>
	                </div>
	            </div>
        	</div>

    	</div>

    </div>

	<!-- 这是底部的设置 -->
	
	<script type="text/javascript" src="<%=base %>js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=base %>js/scripts.js"></script>
    <script type="text/javascript" src="<%=base %>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=base %>js/owl.carousel.min.js"></script>

</body>
</html>