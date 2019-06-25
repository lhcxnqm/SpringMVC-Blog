package blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.UserDao;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordconfirm = request.getParameter("passwordconfirm");
		UserDao userDao = new UserDao();
		
		if(password.equals(passwordconfirm) == false) {
			request.setAttribute("error", "两次密码输入不一致");
			doGet(request,response);
		}
		else if(userDao.isExists(username)) {
			request.setAttribute("error", "该用户已经存在");
			doGet(request,response);
		} else {
			//如果注册成功则存入用户信息并跳转到登录界面
			userDao.addUser(username, password);			
			response.sendRedirect("Login");
		}				
	}

}
