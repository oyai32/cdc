package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Empty;
import dao.AdminDao;
import dao.FamilyDao;
import dao.PersonDao;
/**
 * 添加家庭档案
 * 
 * @author Administrator
 * 
 */
public class AddFamily extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddFamily() {
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
		//System.out.println("-----------");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String hzxm = request.getParameter("hzxm");
		String sfzh = request.getParameter("sfzh");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
		String num1 = request.getParameter("num");
		int num=0;
		if (Empty.empty(num1)) {
			num = Integer.parseInt(num1);
		}
		String address = request.getParameter("address");
		String shouru = request.getParameter("shouru");
		String cz = request.getParameter("cz");
		String db = request.getParameter("db");
		
		FamilyDao dao = new FamilyDao();
		int a = dao.addFamily(hzxm, sfzh, tel, birth, num, shouru, cz, address, db);
		//System.out.println(a);
		if (a > 0) {
			int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
			String content="添加"+hzxm+"的家庭档案";
			new AdminDao().weihu(u_id, content);
			request.getRequestDispatcher("/html/success.jsp").forward(request,
					response);
		} else {
			request.getRequestDispatcher("/html/error.jsp").forward(request,
					response);
		}
	}

	public void init() throws ServletException {
	}

}
