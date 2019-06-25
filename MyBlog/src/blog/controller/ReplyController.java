package blog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Reply;
import blog.dao.ReplyDao;

/**
 * Servlet implementation class ReplyController
 */
@WebServlet("/admin/Reply")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDao replyDao = new ReplyDao();
		List<Reply> replys = replyDao.getReply(request.getParameter("title"));
		request.setAttribute("replys", replys);
		
		request.getRequestDispatcher("/adminReply.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDao replyDao = new ReplyDao();		
		String action = request.getParameter("action");
		
		if(action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			replyDao.deleteReply(id);
		}
		if(action.equals("search")) {
			String title = request.getParameter("title");
			request.setAttribute("title", title);
		}
		
		doGet(request, response);
	}

}
