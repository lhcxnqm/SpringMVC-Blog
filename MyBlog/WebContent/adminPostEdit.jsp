<%@page import="java.util.Date,java.util.*,blog.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String base = request.getContextPath() + "/";%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章编辑界面</title>
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
                            	<% Post post = (Post)request.getAttribute("post"); %>
                            	<h2>文章名称：《<%=post.getTitle() %>》</h2>
                            </div>                                                    
                            
                            <div class="text-center p-lg">                                                                                 
								<div class="form-group">
                                    <div class="col-sm-20">                                       
                                        <form action="<%=base %>admin/PostEdit" method="post">
                                        	<div>
	                                        	<input name="id" value="<%=post.getId() %>" type="hidden">
	                                        	<input name="action" value="edit" type="hidden">
	                                        	<input name="title" value="<%=post.getTitle() %>" type="hidden">
	                                        	<input name="page" value="<%=request.getParameter("page") %>" type="hidden">
	                                        	<div class="row">
		                                        	<div>
		                                        		<button title="Create new cluster" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> <span class="bold">修改文章</span></button>
	                                        		</div>	                                     		 
                                        		</div>
                                        		<br>
                                        		<% String error = (String)request.getAttribute("error"); 
	                                        	if (error != null && !"".equals(error)){ %>
	                                        	<div style="color:red"><%=error %></div>
	                                        	<% } %> 	                                            		                                          	  		                                      	                                	                                      		
                                   			 	<textarea name="content" placeholder="文章内容" style="height:400px;width:600px;margin-top:3%"><%=post.getContent() %></textarea>
                                        	</div>	                                        	                                        	
                                        </form> 
                                        <br>
                                        <a href="<%=base %>admin/Post?page=<%=request.getParameter("page") %>"><input class="btn btn-primary btn-sm" value="返回"></a>             						                                       
                                    </div>                                       	
                                </div>                                
                            </div>
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
