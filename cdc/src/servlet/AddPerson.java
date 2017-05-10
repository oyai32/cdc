package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Empty;

import dao.AdminDao;
import dao.BingDao;
import dao.PersonDao;

/**
 * 添加个人档案
 * 
 * @author Administrator
 * 
 */
public class AddPerson extends HttpServlet {

	public AddPerson() {
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
		String yan = request.getParameter("yan");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
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
		
		PersonDao dao = new PersonDao();
		int p_id=(int) (Math.random()*9999);
		while(dao.idSelPerson(p_id)!=null){//存在此id
			p_id=(int) (Math.random()*9999);
		}
		
		int a = dao.addPerson(p_id,p_name, p_sex, p_birth, sfzh, jzzk, yhzgx, cz,
				hzxm, hzsfzh, address, tel, gzdw, whcd, hyzk, mz, ssy, szy,
				kfxt, chxt,yan,height,weight);
		//System.out.println(a);
		if (a > 0) {
			BingDao bd=new BingDao();
			String sftext="收缩压："+ssy+"  舒张压："+szy+"  空腹血糖："+kfxt+"  餐后血糖："+chxt+"";
			bd.firstSuifang(p_id,sftext);//自动添加第一条随访记录
			int u_id=Integer.parseInt(request.getSession().getAttribute("u_id").toString());//获取操作人id
			String content="添加"+p_name+"的个人健康档案";
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
