<%@page import="java.util.*,blog.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String base = request.getContextPath() + "/";%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章内容管理界面</title>
    <link href="<%=base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=base %>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=base %>css/animate.css" rel="stylesheet">
    <link href="<%=base %>css/style.css" rel="stylesheet">

</head>

<body>
    <div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="<%=base %>images/kunkun.jpg" width="60px" height="60px"/>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="dashboard_2.html#">
                            <span class="clear"> 
                            	<span class="block m-t-xs"> <strong class="font-bold">&nbsp;&nbsp;管理员</strong></span>  
                            </span>
                        </a>
                        
                    </div>
                    <div class="logo-element">
                        Admin
                    </div>
                </li>
               
                <li>
                    <a href="<%=base%>admin/Home"><i class="fa fa-diamond"></i> <span class="nav-label">首页</span></a>
                </li>                             
                <li>
                    <a href="<%=base%>admin/Category"><i class="fa fa-pie-chart"></i> <span class="nav-label">分类管理</span></a>
                </li>
                <li>
                    <a href="<%=base%>admin/Post?page=1"><i class="fa fa-flask"></i> <span class="nav-label">内容管理</span></a>
                </li>
                <li>
                    <a href="<%=base %>admin/Search?page=1"><i class="fa fa-spinner"></i> <span class="nav-label">查询管理</span></a>
                </li>    
                <li>
                    <a href="<%=base %>admin/Reply?page=1"><i class="fa fa-comment"></i> <span class="nav-label">评论管理</span></a>
                </li>  
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="←拉伸" class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">欢迎来到博客管理后台</span>
                </li>
                               
                <li>
                    <a href="/MyBlog/Login.jsp">
                        <i class="fa fa-sign-out"></i> 登出
                    </a>
                </li>

            </ul>

        </nav>
        </div>
            <div class="wrapper wrapper-content">
        <div class="row">
                         
              <div class="col-lg-12">
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="text-center p-lg">
								<div class="form-group">
                                    <div class="col-sm-10">
                                        <div class="row">
	                                        <form action="<%=base %>admin/Post" method="post">
	                                            <div class="col-md-2"><input type="text" placeholder="文章名称" class="form-control" name="title"></div>
	                                            <div class="col-md-6"><input type="text" placeholder="文章主体内容" class="form-control" name="content"></div>
	                                            <input type="hidden" name="page" value="<%=request.getParameter("page") %>">
	                                            <div class="col-md-2">
	                                            	<select name="category_title">
	                                            		<option>请选择类型</option>
	                                            	<% List<Category> categories = (List<Category>)request.getAttribute("categories");
	                                            	  for(Category category : categories){ %>
	                                            		<option value="<%=category.getTitle() %>"><%=category.getTitle() %></option>
	                                            	<% } %>
	                                            	</select>
	                                            </div>
	                                            	                                            
	                                           	<div class="col-md-2"><button title="Create new cluster" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <span class="bold">添加文章</span></button></div>  
	                                        	<% String error = (String)request.getAttribute("error"); 
	                                        	if (error != null && !"".equals(error)){ %>
	                                        	<div class="col-md-4" style="color:red"><%=error %></div>
	                                        	<% } %>
	                                        </form>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>

				<!-- 用来显示文章的 ，分页算法优化-->
                        <% List<Post> posts = (List<Post>)request.getAttribute("posts");
                           Page mypage = (Page)request.getAttribute("page");
                           int nowPost = 0;
                           int frontPost = (mypage.getCurrentPage()-1)*mypage.getEachShow();
                           int behindPost = mypage.getCurrentPage()*mypage.getEachShow();
                        for (Post post : posts){
                        	if(++nowPost <= frontPost) continue;
                        	if(nowPost > behindPost) break;
                        %> 
                        <div class="faq-item"> 
                            <div class="row">
                                <div class="col-md-8">
                                    <a class="faq-question" href="">《<%=post.getTitle() %>》</a>
                                    <small></strong> <i class="fa fa-clock-o"></i>&nbsp;<%=post.getCreated_at() %></small>
                                    &nbsp;分类：<%=post.getCategory_title() %>
                                    &nbsp;浏览次数：<%=post.getView_count() %>                                    	
                                </div>                               
                                
                                <div class="col-md-2">
                                	<a href="<%=base %>admin/PostEdit?page=<%=request.getParameter("page") %>&action=edit&id=<%=post.getId() %>">
                                	<button type="button" class="btn btn-w-m btn-primary">编辑</button></a>                                   	 
                                </div>
                                <div class="col-md-2">
                                	<form action="<%=base %>admin/PostEdit" method="post">
                                		<input name="id" value="<%=post.getId() %>" type="hidden">
                                		<input name="action" value="delete" type="hidden">
                                    	<button type="submit" class="btn btn-w-m btn-danger">删除</button>
                                    </form>
                                </div>
                            </div>                          
                            
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq1" class="panel-collapse collapse in" aria-expanded="true" style="">                                    
                                    	<!-- 如果内容过长，则管理页面上只显示大概内容 -->
                                        <div class="faq-answer">
                                        	<% if(post.getContent().length() > 25) { %>
                                            	<p>内容：<%=post.getContent().substring(0,25) + "..." %></p>
                                            <% } else { %>
                                            	<p>内容：<%=post.getContent() %></p>
                                            <% } %>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>                                                       
                        </div>
                        <% } %>
                        
                   <!-- 用来控制分页的 算法优化-->
                        <div style="margin-left:42%;">
                        <% if(mypage.getCurrentPage() > 1) { %>
                        	<a href="<%=base %>admin/Post?page=<%=mypage.getCurrentPage()-1 %>">上一页</a>&nbsp;
                        <% } %>
	                                           第<%=mypage.getCurrentPage() %> /
	                       	<%=mypage.getTotalPage() %>页
	                                           共<%=mypage.getCountPost() %>篇
                        <% if(mypage.getCurrentPage() < mypage.getTotalPage()) { %>
	                        &nbsp;<a href="<%=base %>admin/Post?page=<%=mypage.getCurrentPage()+1 %>">下一页</a>
	                    <% } %>	                    
	                   	 <form action="<%=base %>admin/Post" method="get">
	                   	 	<br>
	                   	 	跳转到第<input name="page" style="width:30px;margin-left:1%;margin-right:1%">页&nbsp;
	                   	 	<input type="submit" value="Go">
	                   	 </form>
                        </div>
                        
                    </div>
                </div>
                                  
        </div>
       </div>
        <div class="footer">
            <div class="pull-right">
               <%=new Date() %>
            </div>
            <div>
                <strong>Author</strong> The·Ocean &copy; 2019/6/8
            </div>
        </div>
        </div>
        
    </div>

    <!-- Mainly scripts -->
    <script src="<%=base %>js/jquery-2.1.1.js"></script>
    <script src="<%=base %>js/bootstrap.min.js"></script>
    <script src="<%=base %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=base %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="<%=base %>js/plugins/flot/jquery.flot.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="<%=base %>js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Peity -->
    <script src="<%=base %>js/plugins/peity/jquery.peity.min.js"></script>
    <script src="<%=base %>js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=base %>js/inspinia.js"></script>
    <script src="<%=base %>js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="<%=base %>js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="<%=base %>js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="<%=base %>js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="<%=base %>js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="<%=base %>js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="<%=base %>js/demo/sparkline-demo.js"></script>

</body>
</html>
