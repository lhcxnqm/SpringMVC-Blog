package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Category;
import blog.bean.Page;
import blog.bean.Post;
import blog.dao.CategoryDao;
import blog.dao.PostDao;

/**
 * Servlet implementation class PostController
 */
@WebServlet("/admin/Post")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得所有的post文章
		PostDao postDao = new PostDao();
		List<Post> posts = postDao.getAll();
		request.setAttribute("posts", posts);
		//获得所有的分类
		CategoryDao categoryDao = new CategoryDao();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		
		/* 这是用来进行分页控制的分页控制的	妈的，逻辑真烦！！！*/
		int eachShow = 4;													//设置每页显示eachShow条
		int currentPage = Integer.parseInt(request.getParameter("page"));		//获得当前页数
		int countPost = Integer.parseInt(postDao.getPostCount());  		//一共有count条文章数量		
		int allPage = (int) Math.ceil(Double.valueOf(countPost)/eachShow);		//共有allPage页
		
		if(currentPage > allPage) 
			currentPage = allPage;		//防止当前页数大于总页数
		
		Page page = new Page(currentPage,allPage,countPost,eachShow);		
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/adminPost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category_title = request.getParameter("category_title");
		
		//对文章添加进行约束
		if(title == null || "".equals(title)) {
			request.setAttribute("error", "文章名称不能为空");
			doGet(request,response);
			return ;
		} else if(content == null || "".equals(content)) {
			request.setAttribute("error", "文章内容不能为空");
			doGet(request,response);
			return ;
		} else if(category_title.equals("请选择类型")) {
			request.setAttribute("error", "请选择文章类型");
			doGet(request,response);
			return ;
		}
		
		PostDao postDao = new PostDao();
		postDao.addPost(title, content, category_title);
				
		doGet(request, response);		
	}

}
