package blog.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.bean.Post;
import blog.bean.Reply;
import blog.dao.PostDao;
import blog.dao.ReplyDao;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/user/Detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailController() {
        super();
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		PostDao postDao = new PostDao();
		postDao.addViewCount(id);
		Post post = postDao.getPost(id);
		request.setAttribute("post", post);
		
		ReplyDao replyDao = new ReplyDao();
		List<Reply> replys = replyDao.getReplyById(id);
		request.setAttribute("replys", replys);
		
		request.getRequestDispatcher("/Detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = request.getParameter("content");
		String username = request.getParameter("user");
		String title = request.getParameter("title");
		if(content == null || content.equals("")) {
			request.setAttribute("error", "评论内容不能为空");
			doGet(request,response);
			return ;
		}
		ReplyDao replyDao = new ReplyDao();
		replyDao.addReply(content, username, title);
		
		doGet(request, response);
	}

}
