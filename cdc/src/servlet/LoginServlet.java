package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

import dao.UserDao;

/**
 * 登录
 * 
 * @author Administrator
 * 
 */
public class LoginServlet extends HttpServlet {

	UserDao ud=new UserDao();
	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		 HttpSession session = request.getSession();
		String zhanghao=request.getParameter("zhanghao");
		String password=request.getParameter("password");
		User u=new User();
		u=ud.login(zhanghao, password);
		if(u!=null){
			session.setAttribute("user", u);
			session.setAttribute("u_id", u.getU_id());
			session.setAttribute("userName", u.getUserName());
			session.setAttribute("password", u.getPassword());
			String[] power=u.getPower().split(",");
			session.setAttribute("power", power);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/html/loginError.jsp").forward(request, response);
		}
		
	}

	public void init() throws ServletException {
	}

}
