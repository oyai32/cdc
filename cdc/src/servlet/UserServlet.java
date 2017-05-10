package servlet;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Empty;

import model.User;

import dao.AdminDao;
import dao.Power;
import dao.UserDao;

public class UserServlet extends HttpServlet {
	UserDao ud = new UserDao();
	AdminDao ad = new AdminDao();

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
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
		String uu = session.getAttribute("u_id").toString();
		int u_id = 0;
		new Empty();
		if (Empty.empty(uu)) {
			u_id = Integer.parseInt(uu);
		} else {
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
		}

		String b = request.getParameter("b");// 标记按条件查询类型
		System.out.println(b);

		if ("xgmm".equals(b)) {
			String ypw = request.getParameter("ypw");
			String xpw = request.getParameter("xpw");
			if (ud.updatePwd(u_id, ypw, xpw)) {
				scontent = "id为" + u_id + "的用户，成功修改密码";
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/html/xgerror.jsp").forward(
						request, response);
			}
		} else if ("time".equals(b)) {
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			System.out.println(start + "     " + end);
			List<User> ulist = ud.timeSelUser(start, end);
			request.setAttribute("ulist", ulist);
			request.getRequestDispatcher("/html/zhwh.jsp").forward(request,
					response);
		} else if ("cun".equals(b)) {
			String cun = new String(request.getParameter("cun").getBytes(
					"iso8859-1"), "utf-8");
			List<User> ulist = ud.czSelUser(cun);
			request.setAttribute("ulist", ulist);
			request.getRequestDispatcher("/html/zhwh.jsp").forward(request,
					response);
		} else if ("update".equals(b)) {// 初始化密码
			int id = Integer.parseInt(request.getParameter("id"));
			if (ud.cshPwd(id)) {
				scontent = "初始化id为：" + id + "的用户的密码";
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/html/error.jsp").forward(
						request, response);
			}
		} else if ("del".equals(b)) {
			int id = Integer.parseInt(request.getParameter("id"));
			if (ud.delUser(id)) {
				scontent = " 删除id为：" + id + "的用户";
				ad.weihu(u_id, scontent);
				request.getRequestDispatcher("/html/success.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/html/error.jsp").forward(
						request, response);
			}
		} else if ("add".equals(b)) {
			String zhanghao = request.getParameter("zhanghao");
			if (ud.sZhang(zhanghao)) {// 此帐号不存在，可以注册
				String userName = request.getParameter("userName");
				int r_id = Integer.parseInt(request.getParameter("jibie"));
				String cz = request.getParameter("cun");
				if (ud.addUser(zhanghao, userName, r_id, cz)) {
					scontent = "添加帐号为：" + zhanghao + "的用户";
					ad.weihu(u_id, scontent);
					request.getRequestDispatcher("/html/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/html/error.jsp").forward(
							request, response);
				}
			} else {
				request.getRequestDispatcher("/html/chongerror.jsp").forward(
						request, response);
			}
		}else if("zhang".equals(b)){//按帐号查用户表
			String zhanghao = request.getParameter("zhanghao");
			User user=ud.zSelUser(zhanghao);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/html/mqxgl.jsp").forward(
					request, response);
		}else if("userName".equals(b)){//按用户名查权限表
			String userName = request.getParameter("userName");
			User user=ud.uSelUser(userName);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/html/mqxgl.jsp").forward(
					request, response);
		}else if("gqx".equals(b)){
			int id =Integer.parseInt(request.getParameter("id"));
			User user=ud.idSelUser(id);
			request.setAttribute("user", user);
			
			String power=user.getPower();
		    List<Integer> ypIdList=new ArrayList<Integer>();// 此人拥有的权限id
		    List<String> ypNameList=new ArrayList<String>();// 此人拥有的权限名
		    List<Integer> fIdList=new ArrayList<Integer>();// 此人不拥有的权限id
		    List<String> fNameList=new ArrayList<String>();// 此人不拥有的权限名
			List<Power> powerList=ad.selPower();//查此人权限
			for(int i=0;i<powerList.size();i++){
				int power_id=powerList.get(i).getPower_id();
				if(power.indexOf(""+power_id+"")>-1){ //是 此人拥有权限
					ypIdList.add(power_id);
					ypNameList.add(powerList.get(i).getPower_name());
				}else{
					fIdList.add(power_id);
					fNameList.add(powerList.get(i).getPower_name());
				}
			}
			request.setAttribute("ypIdList", ypIdList);
			request.setAttribute("fIdList", fIdList);
			request.setAttribute("ypNameList", ypNameList);
			request.setAttribute("fNameList", fNameList);
			request.getRequestDispatcher("/html/gqx.jsp").forward(
					request, response);
		}else if("qxtijiao".equals(b)){//权限提交
			String p[]=request.getParameterValues("power");
			StringBuffer pobuffer=new StringBuffer();
			for(int i=0;i<p.length;i++){
				pobuffer.append(p[i]+",");
			}
			String power=pobuffer.toString();
			int id=Integer.parseInt(request.getParameter("id"));
			if(ud.updatePower(power, id)){
				request.getRequestDispatcher("/html/success.jsp").forward(
						request, response);
			}else{
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
