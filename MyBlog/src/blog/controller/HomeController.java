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
 * Servlet implementation class HomeController
 */
@WebServlet("/admin/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> categories = categoryDao.getAll();
		for (Category category : categories) {
			//用来存放统计类型数量，各类型总浏览量和该类型浏览最多的文章的字符串数组
			String[] statisticsCount = new String[3];
			statisticsCount = categoryDao.getCount(category.getTitle());
			category.setCategory_count(statisticsCount[0]);
			category.setView_count(statisticsCount[1]);
			category.setPopularPost(statisticsCount[2]);
		}
		request.setAttribute("categories", categories);
		
		request.getRequestDispatcher("/adminHome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
