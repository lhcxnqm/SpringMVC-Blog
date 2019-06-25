package blog.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.UserDao;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String choice = request.getParameter("choice");
		UserDao userDao = new UserDao();
		boolean valid = userDao.isValid(username, password);
		
		if (valid) {
			//如果是管理员登录的话
			if(choice.equals("administrators"))
				if(username.equals("lhc") && password.equals("123")) {
					response.sendRedirect("admin/Home");
					return ;
				} else {
					request.setAttribute("error", "管理员账号或密码错误");
					doGet(request,response);
				}
			//如果是用户登录的话
			else if(choice.equals("user")) {
				if(username.equals("lhc") && password.equals("123")) {
					request.setAttribute("error", "用户名或密码错误");
					doGet(request,response);
				}
				Cookie user = new Cookie("user", URLEncoder.encode(username, "UTF-8"));
				response.addCookie(user);
				response.sendRedirect("user/Index?page=1");
				return ;
			}
		} else {
			request.setAttribute("error", "用户名或密码错误");
			doGet(request, response);
		}		
	}

}
