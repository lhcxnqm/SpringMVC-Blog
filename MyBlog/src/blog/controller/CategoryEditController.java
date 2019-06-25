package blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Category;
import blog.dao.CategoryDao;

/**
 * Servlet implementation class CategoryEditController
 */
@WebServlet("/admin/CategoryEdit")
public class CategoryEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryEditController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.getCategory(id);
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("/adminCategoryEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");		
		String title = request.getParameter("title");
		int id = Integer.parseInt(request.getParameter("id"));
		
		CategoryDao categoryDao = new CategoryDao();
		//判断是编辑还是删除操作
		if("edit".equals(action)) {
			if(title == null || "".equals(title)) {
				request.setAttribute("error", "分类名称不能为空");
				doGet(request,response);
				return ;
			}		
			categoryDao.editCategory(id, title);		
		} else if("delete".equals(action)) {
			categoryDao.deleteCategory(id);
		}
				
		response.sendRedirect(request.getContextPath() + "/admin/Category");
	}

}
