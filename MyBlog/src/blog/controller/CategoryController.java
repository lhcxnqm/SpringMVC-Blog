package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Category;
import blog.dao.CategoryDao;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/admin/Category")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryDao categoryDao = new CategoryDao();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		
		request.getRequestDispatcher("/adminCategory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String title = request.getParameter("title");
		if(title == null || "".equals(title)) {
			request.setAttribute("error", "分类名称不能为空");
			doGet(request,response);
			return ;
		}
		CategoryDao categoryDao = new CategoryDao();
		
		boolean isExists = categoryDao.exists(title);
		if (isExists) {
			request.setAttribute("error", "分类名称已经存在");
			doGet(request, response);
			return ;
		}
		
		categoryDao.addCategory(title);
				
		doGet(request, response);
	}

}
