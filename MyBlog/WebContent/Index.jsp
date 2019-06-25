<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,blog.bean.*,java.net.URLEncoder" %>
  
<% String base = request.getContextPath() + "/"; %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>博客首页</title>
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

        <div id="content" class="site-content">
            <div class="container">
			    <div class="row">
					<div id="primary" class="content-area col-sm-8 col-md-8 col-xs-12 right-s-bar ">
		                <main id="main" class="site-main" role="main">
                            <article id="post-199" class="boxed post-199 post type-post status-publish format-audio has-post-thumbnail hentry category-latest post_format-post-format-audio">
	                            <div class="post-wrapper">	                            
	                            	<% List<Post> posts = (List<Post>)request.getAttribute("posts");
	                            		Page mypage = (Page)request.getAttribute("page");
	                            		int nowPost = 0;
	                            		int frontPost = (mypage.getCurrentPage()-1)*mypage.getEachShow();
	                            		int behindPost = mypage.getCurrentPage()*mypage.getEachShow();
	                            	  for(Post post:posts){	
	                            	   if(++nowPost <= frontPost) continue; 
	                            	   if(nowPost > behindPost) break; %>
	                                    <div class="post-content-wrapper">                                      
	                                        <div class="post-title">
	                                            <h2 class="entry-title">
	                                                <a href="<%=base %>user/Detail?id=<%=post.getId() %>" rel="bookmark">《<%=post.getTitle() %>》</a>
	                                            </h2>
	                                        </div>
	                                        <div class="post-content">
	                                            <p><%=post.getContent() %></p>
	                                        </div>
	                                        <div class="post-footer">
	                                            <div class="post-footer-right">
	                                                <span>
	                                                	<i class="fa fa-comment"></i> <%=post.getReplycount() %>评论&nbsp;
	                                                </span>
	                                                <span>
	                                                	<i class="fa fa-eye"></i> <%=post.getView_count() %>浏览
	                                                </span>
	                                            </div>                                            
	                                        </div>
	                                    </div>
                                    <% } %>                                    
	                            </div>	                            	                            
                            </article>                  

							<!-- 这里进行分页控制 -->
							<div style="margin-left:42%;">
		                        <% if(mypage.getCurrentPage() > 1) { %>
		                        	<a href="<%=base %>user/Index?page=<%=mypage.getCurrentPage()-1 %>">上一页</a>&nbsp;
		                        <% } %>
			                                           第<%=mypage.getCurrentPage() %> /
			                       	<%=mypage.getTotalPage() %>页
			                                           共<%=mypage.getCountPost() %>篇
		                        <% if(mypage.getCurrentPage() < mypage.getTotalPage()) { %>
			                        &nbsp;<a href="<%=base %>user/Index?page=<%=mypage.getCurrentPage()+1 %>">下一页</a>
			                    <% } %>	                    
			                   	 <form action="<%=base %>user/Index" method="get">
			                   	 	<br>
			                   	 	跳转到第<input name="page" style="width:30px;margin-left:1%;margin-right:1%">页&nbsp;
			                   	 	<input type="submit" value="Go">
			                   	 </form>
	                        </div>

		                </main>
	                </div>


                <aside id="secondary" class="col-sm-4 col-md-4 widget-area left-s-bar" role="complementary">

                  <section id="categories-2" class="widget widget_categories">
                      <h2 class="widget-title"><span>博文分类</span></h2>
                      <ul class="nav">
							<% List<Category> categories = (List<Category>)request.getAttribute("categories");
							 for(Category category:categories){ %>
	                            <li class="cat-item cat-item-15" role="presentation">
	                                <a href=""><%=category.getTitle() %></a>
	                            </li>
                            <% } %>
                      </ul>
                  </section>

                  <section id="ezy-featured-post-2" class="widget ezy-featured-post">
                    <h2 class="widget-title"><span>热门文章</span></h2>
						<% List<Post> posts_descend = (List<Post>)request.getAttribute("posts_descend");
							int count = 0;
						 for(Post post:posts_descend){ 
						   	count += 1;
						   	if(count > 6) continue; %>
                            <section class="featured-posts-block">
                            
                                    <div class="featured-post-content">
                                        <div class="featured-post-title">
                                            <a href="<%=base %>user/Detail?id=<%=post.getId() %>">《<%=post.getTitle() %>》</a>
                                        </div>                                       
                                        <span class="entry-date"><i class="fa fa-clock-o"></i><%=post.getCreated_at() %></span>
                                        <br><span class="fa fa-eye"><%=post.getView_count() %>浏览</span>&nbsp;
                                        <br><br>
                                    </div>
                            </section>
						<% } %>
                  </section>
                </aside>

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