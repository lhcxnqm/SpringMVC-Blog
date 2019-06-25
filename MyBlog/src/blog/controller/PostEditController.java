package blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Category;
import blog.bean.Post;
import blog.dao.CategoryDao;
import blog.dao.PostDao;

/**
 * Servlet implementation class PostEditController
 */
@WebServlet("/admin/PostEdit")
public class PostEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostEditController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		PostDao postDao = new PostDao();
		Post post = postDao.getPost(id);
		request.setAttribute("post", post);
		
		//进入到编辑界面则浏览加1  
		postDao.addViewCount(id);
		
		request.getRequestDispatcher("/adminPostEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		
		PostDao postDao = new PostDao();
		//判断是编辑还是删除操作
		if("edit".equals(action)) {			
			if(content == null || "".equals(content)) {
				request.setAttribute("error", "文章内容不能为空");
				doGet(request,response);
				return ;
			}
			postDao.editPost(id, title, content);
		} else if("delete".equals(action)) {
			postDao.deletePost(id);
		}

		response.sendRedirect(request.getContextPath() + "/admin/Post?page=" + page);				
	}

}
