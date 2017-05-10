package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manager;
import model.Person;

import dao.AdminDao;
import dao.BingDao;
import dao.PersonDao;
import dao.UserDao;

public class BingServlet extends HttpServlet {
	PersonDao pd = new PersonDao();
	BingDao bd = new BingDao();
	AdminDao ad = new AdminDao();
	UserDao ud = new UserDao();

	public BingServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		request.setAttribute("type", type);

		List<Person> plist = new ArrayList<Person>();
		String b = request.getParameter("b");// 标记按条件查询类型
		System.out.println(b);
		String sql = null;
		int u_id = Integer.parseInt(request.getSession().getAttribute("u_id")
				.toString());// 获取操作人id
		if ("time".equals(b)) {
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			int r_id = ud.idSel(u_id);// 检查操作人身份
			if (r_id == 1) {// 村用户
				if ("gxy".equals(type)) {// 高血压 收缩压大于140mmHg,舒张压大于90mmHg
						sql="select a.* from person a,manager b,user u where a.ssy>140 and a.szy>90 and b.p_id=a.p_id and u.cz=a.cz and u.u_id="+u_id+" and  b.update_time between ? and ?  group by a.p_id";	
					} else if ("tang".equals(type)) {// 空腹血糖大于5.7~mmol/L或餐后血糖大于7mmol/L
						sql = "select a.* from person a,manager b,user u where a.kfxt>5.7 and a.chxt>7 and a.p_id=b.p_id and u.cz=a.cz and u.u_id="+u_id+" and  b.update_time between ? and ? group by a.p_id ";
					} else if ("qi".equals(type)) {
						sql = "select a.* from person a,manager b,user u where a.p_id=b.p_id and u.cz=a.cz and u.u_id="+u_id+" and b.update_time between ? and ? and b.mb='是' group by a.p_id";
					}
			} else {
				if ("gxy".equals(type)) {// 高血压 收缩压大于140mmHg,舒张压大于90mmHg
					sql = "select a.* from person a,manager b where a.ssy>140 and a.szy>90 and b.p_id=a.p_id and  b.update_time between ? and ? group by a.p_id";
				} else if ("tang".equals(type)) {// 空腹血糖大于5.7~mmol/L或餐后血糖大于7mmol/L
					sql = "select a.* from person a,manager b where a.kfxt>5.7 and a.chxt>7 and a.p_id=b.p_id and  b.update_time between ? and ? group by a.p_id ";
				} else if ("qi".equals(type)) {
					sql = "select a.* from person a,manager b where a.p_id=b.p_id and b.update_time between ? and ? and b.mb='是' group by a.p_id";
				}
			}
			plist = pd.btSelPerson(sql, start, end);
		} else if ("cun".equals(b)) {
			String cz = new String(request.getParameter("cun").getBytes(
					"iso8859-1"), "utf-8");
			if ("gxy".equals(type)) {// 高血压 收缩压大于140mmHg,舒张压大于90mmHg
				sql = "select * from person where ssy>140 and szy>90 and  cz=? group by p_id";
			} else if ("tang".equals(type)) {// 空腹血糖大于5.7~mmol/L或餐后血糖大于7mmol/L
				sql = "select * from person where kfxt>5.7 and chxt>7 and  cz=? group by p_id";
			} else if ("qi".equals(type)) {
				sql = "select a.* from person a,manager b where a.p_id=b.p_id and a.cz=? and b.mb='是' group by a.p_id";
			}
			plist = pd.bcSelPerson(sql, cz);
		} else if ("xq".equals(b)) {
			int p_id = Integer.parseInt(request.getParameter("id"));
			Person p = pd.idSelPerson(p_id);
			request.setAttribute("person", p);
			List<Manager> mlist = bd.idSelManager(p_id);
			request.setAttribute("mlist", mlist);
			String suggest=bd.idSelSuggest(p_id);
			request.setAttribute("suggest",suggest);
			request.getRequestDispatcher("/html/mbingxq.jsp").forward(request,
					response);
			return;
		}else if("suggest".equals(b)){
			int p_id = Integer.parseInt(request.getParameter("id"));
			String suggest = new String(request.getParameter("suggest").getBytes("iso8859-1"), "utf-8");
			int a=bd.addSuggest(p_id, suggest);
			String content="为id为"+p_id+"的患者 添加干预建议："+suggest;
			ad.weihu(u_id, content);
			if(a>0){
				request.getRequestDispatcher("/html/success.jsp").forward(request,
						response);
			}else{
				request.getRequestDispatcher("/html/error.jsp").forward(request,
						response);
			}
			return ;
		}
		request.setAttribute("plist", plist);

		request.getRequestDispatcher("/html/mbing.jsp").forward(request,
				response);

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
		int u_id = Integer.parseInt(request.getSession().getAttribute("u_id")
				.toString());// 获取操作人id
		String scontent = null;

		String b = request.getParameter("b");// 标记按条件查询类型
		System.out.println(b);
		if ("suifang".equals(b)) {
			String visit_time = request.getParameter("sftime");
			String zz = request.getParameter("zz");
			String text = request.getParameter("text");
			String mb = request.getParameter("szmxb");
			String sftext=request.getParameter("sftext");
			int p_id = Integer.parseInt(request.getParameter("id"));
			bd.updateMb(p_id, mb);//修改慢病信息
			int a = bd.addSuifang(p_id, visit_time, text, zz, mb,sftext);
			if (a > 0) {
				scontent = "添加随访记录，时间：" + visit_time;
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/html/error.jsp").forward(
						request, response);
			}
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
