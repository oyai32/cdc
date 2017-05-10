package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Count;

import dao.CountDao;
/**
 * 统计
 * @author Administrator
 *
 */
public class CountServlet extends HttpServlet {
	CountDao cd=new CountDao();
	public CountServlet() {
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
		String b=request.getParameter("b");//标记按条件查询类型
		Count count=new Count();
		if("cun".equals(b)){
			String cun = new String(request.getParameter("cun").getBytes("iso8859-1"), "utf-8");
			System.out.println(cun+"=============");
			count=cd.cCount(cun);
		}else if("quan".equals(b)){
			count=cd.qCount();
		}
		request.setAttribute("count", count);

		request.getRequestDispatcher("/html/mcount.jsp").forward(request,
				response);
	}

	public void init() throws ServletException {
	}

}
