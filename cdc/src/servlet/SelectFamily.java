package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.FamilyDao;

import util.Empty;

import model.Family;
import model.Person;

public class SelectFamily extends HttpServlet {
AdminDao ad=new AdminDao();
	FamilyDao fd=new FamilyDao();
	/**
	 * Constructor of the object.
	 */
	public SelectFamily() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Family> flist=new ArrayList<Family>();
		int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
		String scontent=null;
		
			String b=request.getParameter("b");//标记按条件查询类型
			System.out.println(b);
			if("time".equals(b)){
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				flist=fd.timeSelFamily(start, end);
				System.out.println(start);
			}else if("cun".equals(b)){
				String cun = new String(request.getParameter("cun").getBytes("iso8859-1"), "utf-8");
				System.out.println(cun+"000000");
				flist=fd.czSelFamily(cun);
			}else if("toupdate".equals(b)){
				String c=request.getParameter("c");
				int f_id=Integer.parseInt(request.getParameter("id"));
				System.out.println(f_id);
				Family f=fd.idSelFamily(f_id);
				request.setAttribute("family", f);
				if("up".equals(c)){

					request.getRequestDispatcher("/html/updatefamily.jsp").forward(request, response);
				}else if("xiang".equals(c)){
					request.getRequestDispatcher("/html/xiangfamily.jsp").forward(request, response);

				}
				return;
				
			}else if("del".equals(b)){
				int f_id=Integer.parseInt(request.getParameter("id"));
				int a=fd.delFamliy(f_id);
				if(a>0){
					scontent="删除id为："+f_id+"的家庭档案";
					ad.weihu(u_id, scontent);
					request.getRequestDispatcher("/html/success.jsp").forward(request, response);
					return;
				}else{
					request.getRequestDispatcher("/html/error.jsp").forward(request, response);
					return;
				}
			}
		
		
		request.setAttribute("flist", flist);
		request.getRequestDispatcher("/html/mfamily.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
		String scontent=null;
		int f_id=Integer.parseInt(request.getParameter("id"));
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
		int a=fd.updateFamily(f_id, hzxm, sfzh, tel, birth, num, shouru, cz, address, db);
		if(a>0){
			scontent="更新户主姓名为："+hzxm+"的家庭档案";
			ad.weihu(u_id, scontent);
			request.getRequestDispatcher("/html/success.jsp").forward(request, response);
			return;
		}else{
			request.getRequestDispatcher("/html/error.jsp").forward(request, response);
			return;
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
