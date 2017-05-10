package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Empty;

import model.Person;

import dao.AdminDao;
import dao.PersonDao;
import dao.UserDao;

/**
 * 查询
 * 
 * @author Administrator
 * 
 */
public class SelectPerson extends HttpServlet {
AdminDao ad=new AdminDao();
	PersonDao pd=new PersonDao();
	UserDao ud=new UserDao();
	public SelectPerson() {
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
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Person> plist=new ArrayList<Person>();
		int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
		String scontent=null;
			
			String b=request.getParameter("b");//标记按条件查询类型
			
			System.out.println(b);
			if("time".equals(b)){
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				 int r_id=ud.idSel(u_id);//检查操作人身份
				 String sql = null;
				if(r_id==1){//村用户
					sql = "select a.* from person a,user b where a.create_time between ? and ? and b.cz=a.cz and b.u_id="+u_id;
				}else{//项目村
					sql = "select * from person where create_time between ? and ? ";
				}
				
				plist=pd.timeSelPerson(sql,start, end);
				System.out.println(start);
			}else if("cun".equals(b)){
				String cun = new String(request.getParameter("cun").getBytes("iso8859-1"), "utf-8");
				System.out.println(cun+"000000");
				plist=pd.czSelPerson(cun);
			}else if("toupdate".equals(b)){
				int p_id=Integer.parseInt(request.getParameter("id"));
				Person p=pd.idSelPerson(p_id);
				request.setAttribute("person", p);
				String c=request.getParameter("c");
				if("up".equals(c)){

					request.getRequestDispatcher("/html/updateperson.jsp").forward(request, response);
				}else if("xiang".equals(c)){
					request.getRequestDispatcher("/html/xiangperson.jsp").forward(request, response);
				}
				return;
			}else if("del".equals(b)){
				int p_id=Integer.parseInt(request.getParameter("id"));
				int a=pd.delPerson(p_id);
				if(a>0){
					scontent="删除id为："+p_id+"的个人健康档案";
					ad.weihu(u_id, scontent);
					request.getRequestDispatcher("/html/success.jsp").forward(request, response);
					return;
				}else{
					request.getRequestDispatcher("/html/error.jsp").forward(request, response);
					return;
				}
			}else if("ren".equals(b)){
				String type=request.getParameter("type");
				String p=request.getParameter("p");
				String sql=null;
				if("1".equals(p)){//按村查询
					String cz = new String(request.getParameter("cun").getBytes("iso8859-1"), "utf-8");
					if("gao".equals(type)){
						sql="select * from person where (ssy>=130 and ssy<140 and cz='"+cz+"') or (szy>=85 and szy<90 and cz='"+cz+"') or (kfxt>=6.1 and kfxt<7 and cz='"+cz+"') or (chxt>=7.8 and chxt<11.1 and cz='"+cz+"') or(yan>=20 and cz='"+cz+"') or(bmi>24 and cz='"+cz+"') ";
						plist = pd.selPerson(sql);
					}else if("huan".equals(type)){
						 sql="select p.* from person p, manager m where p.p_id not in (select p_id from person where (ssy>=130 and ssy<140 and cz='"+cz+"') or (szy>=85 and szy<90 and cz='"+cz+"' ) or (kfxt>=6.1 and kfxt<7 and cz='"+cz+"') or (chxt>=7.8 and chxt<11.1 and cz='"+cz+"') ) and p.p_id=m.p_id and m.mb='是' group by p.p_id";		
						 plist = pd.selPerson(sql);
					}else if("yi".equals(type)){
						 sql = "select p.* from person p, manager m where p.p_id not in(select p_id from person where (ssy>=130 and ssy<140 and cz='"+cz+"' ) or (szy>=85 and szy<90 and cz='"+cz+"') or (kfxt>=6.1 and kfxt<7 and cz='"+cz+"') or (chxt>=7.8 and chxt<11.1 and cz='"+cz+"') or(yan>=20 and cz='"+cz+"') or(bmi>24 and cz='"+cz+"') ) and p.p_id=m.p_id and m.mb='否' group by p.p_id";
						plist = pd.selPerson(sql);
					}
				}else{
					if("gao".equals(type)){
						 sql="select * from person where (ssy>=130 and ssy<140) or (szy>=85 and szy<90) or (kfxt>=6.1 and kfxt<7) or (chxt>=7.8 and chxt<11.1) or(yan>=20) or(bmi>24)" ;
						plist = pd.selPerson(sql);
					}else if("huan".equals(type)){
						 sql="select p.* from person p, manager m where p.p_id not in (select p_id from person where (ssy>=130 and ssy<140 ) or (szy>=85 and szy<90  ) or (kfxt>=6.1 and kfxt<7 ) or (chxt>=7.8 and chxt<11.1 ) ) and p.p_id=m.p_id and m.mb='是' group by p.p_id";
						plist = pd.selPerson(sql);
					}else if("yi".equals(type)){
						 sql = "select p.* from person p, manager m where p.p_id not in(select p_id from person where (ssy>=130 and ssy<140 ) or (szy>=85 and szy<90 ) or (kfxt>=6.1 and kfxt<7 ) or (chxt>=7.8 and chxt<11.1 ) or(yan>=20) or(bmi>24) ) and p.p_id=m.p_id and m.mb='否' group by p.p_id";
						plist = pd.selPerson(sql);
					}
				}
			
			}
		
		
		request.setAttribute("plist", plist);
		request.getRequestDispatcher("/html/mperson.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
		String scontent=null;
			
		int p_id=Integer.parseInt(request.getParameter("id"));
		String p_name = request.getParameter("name");
		String p_sex = request.getParameter("sex");
		String p_birth = request.getParameter("birth");
		String sfzh = request.getParameter("sfzh");
		String jzzk = request.getParameter("jzzk");
		String yhzgx = request.getParameter("yhzgx");
		String cz = request.getParameter("cz");
		String hzxm = request.getParameter("hzxm");
		// String hzxm="走走走";
		String hzsfzh = request.getParameter("hzsfzh");

		String tel = request.getParameter("tel");
		String ssy1 = request.getParameter("ssy");
		int ssy=0;
		if (Empty.empty(ssy1)) {
			 ssy = Integer.parseInt(ssy1);
		}
		String szy1 = request.getParameter("szy");
		int szy=0;
		if (Empty.empty(szy1)) {
			 szy = Integer.parseInt(szy1);
		}
		String address = request.getParameter("address");
		String gzdw = request.getParameter("gzdw");
		String whcd = request.getParameter("whcd");
		String hyzk = request.getParameter("hyzk");
		String mz = request.getParameter("mz");
		
		String kfxt1 = request.getParameter("kfxt");
		Float kfxt=0f;
		if (Empty.empty(kfxt1)) {
			kfxt = Float.parseFloat(kfxt1);
		}
		
		String chxt1 = request.getParameter("chxt");
		Float chxt=0f;
		if (Empty.empty(chxt1)) {
			chxt = Float.parseFloat(chxt1);
		}
		String yan = request.getParameter("yan");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		System.out.println(yan);
		int a=pd.updatePerson(p_id, p_name, p_sex, p_birth, sfzh, jzzk, yhzgx, cz, hzxm, hzsfzh, address, tel, gzdw, whcd, hyzk, mz, ssy, szy, kfxt, chxt,yan,height,weight);
		if(a>0){
			scontent="更新id为："+p_id+"的个人健康档案";
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
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
