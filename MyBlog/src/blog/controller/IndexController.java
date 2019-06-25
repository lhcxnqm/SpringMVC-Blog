package blog.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Category;
import blog.bean.Page;
import blog.bean.Post;
import blog.dao.CategoryDao;
import blog.dao.PostDao;

/**
 * Servlet implementation class IndexController
 */
@WebServlet("/user/Index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置用户cookie
		Cookie cookies[] = request.getCookies();
		Cookie cookie = null;
		for(int i = 0; i < cookies.length-1;i++) {
			cookie = cookies[i];
			if(cookie != null) {
				if(cookie.getName().equals("user"))
					request.setAttribute("user", URLDecoder.decode(cookie.getValue(), "UTF-8"));
			}
		}
		
		//获得文章分类
		CategoryDao categoryDao = new CategoryDao();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		
		//获得文章
		PostDao postDao = new PostDao();
		List<Post> posts = postDao.getAll();
		for(Post post:posts) {
			post.setReplycount(postDao.getReplyCount(post.getTitle()));
		}
		request.setAttribute("posts", posts);	
		
		//分页控制
		int eachShow = 6;
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int countPost = Integer.parseInt(postDao.getPostCount());
		int allPage = (int) Math.ceil(Double.valueOf(countPost)/eachShow);
		if(currentPage > allPage) 
			currentPage = allPage;
		Page page = new Page(currentPage,allPage,countPost,eachShow);		
		request.setAttribute("page", page);
		
		List<Post> posts_descend = postDao.getAll();	//按照浏览次数降序排列的文章
		Collections.sort(posts_descend, new Comparator<Post>() {
			@Override
			public int compare(Post post1,Post post2) {
				if(post1.getView_count() > post2.getView_count())
					return -1;
				if(post1.getView_count() == post2.getView_count())
					return 0;
				return 1;
			}
		});		
		request.setAttribute("posts_descend", posts_descend);
		
		request.getRequestDispatcher("/Index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
