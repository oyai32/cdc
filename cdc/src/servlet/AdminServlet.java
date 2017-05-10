package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Empty;

import model.Post;
import model.ShuJu;
import model.User;

import dao.AdminDao;
import dao.UserDao;

public class AdminServlet extends HttpServlet {
	AdminDao ad = new AdminDao();
	
	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String scontent = null;
		Object uu = session.getAttribute("u_id");
		int u_id = 0;
		if (uu!=null) {
			u_id = Integer.parseInt(uu.toString());
		} else {
			request.getRequestDispatcher("/html/loginError.jsp").forward(request,
					response);
			return;
		}
		
		String b = request.getParameter("b");
		if("fb".equals(b)){
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int a=ad.fb(title, content);
			if(a>0){
				scontent="添加主题为："+title+"的公告";
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(request,
						response);
			}else{
				request.getRequestDispatcher("/html/error.jsp").forward(request,
						response);
			}
		}else if("lie".equals(b)){//公告列表展示
			List<Post> plist=ad.selPost();
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/html/gonggao.jsp").forward(request,
					response);
		}else if("del".equals(b)){
			int post_id=Integer.parseInt(request.getParameter("id"));
			int a=ad.delPost(post_id);
			if(a>0){
				scontent="删除id为："+post_id+"的公告";
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(request,
						response);
			}else{
				request.getRequestDispatcher("/html/error.jsp").forward(request,
						response);
			}
		}else if("shu".equals(b)){//数据维护查询
			List<ShuJu> slist=new ArrayList<ShuJu>();
			String sql=null;
			String type=request.getParameter("type");
			if("time".equals(type)){
				String start=request.getParameter("start");
				String end=request.getParameter("end");
				slist=ad.timeSelShuJu(start, end);
			}else if("name".equals(type)){
				String name=request.getParameter("name");

				sql="select a.*,b.userName from maintenance a,user b where a.u_id=b.u_id and b.userName=? order by a.create_time desc";
				slist=ad.cSelShuJu(sql, name);
			}else if("content".equals(type)){
				String content = new String(request.getParameter("content").getBytes(
						"iso8859-1"), "utf-8");
				System.out.println(content);
				sql="select a.*,b.userName from maintenance a,user b where a.u_id=b.u_id and a.content like ? order by a.create_time desc";
				slist=ad.cSelShuJu(sql, "%"+content+"%");
			}
			request.setAttribute("slist", slist);
			request.getRequestDispatcher("/html/mshuju.jsp").forward(request,
					response);
		}else if("zhuye".equals(b)){
			List<Post> plist=ad.selPost();
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/html/zhuye.jsp").forward(request,
					response);
		}
	
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
