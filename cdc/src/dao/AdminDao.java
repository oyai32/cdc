package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Person;
import model.Post;
import model.ShuJu;
import model.User;
import util.DBUtils;

public class AdminDao {

	/**
	 * 发布公告
	 * 
	 * @param title
	 * @param content
	 * @return
	 */
	public int fb(String title, String content) {
		String sql = "insert into post (title,content,create_time) values(?,?,curdate())";
		int a = DBUtils.update(sql, title, content);
		return a;
	}

	/**
	 * 数据维护（插入数据）
	 * 
	 * @param title
	 * @param content
	 * @return
	 */
	public int weihu(int u_id, String content) {
		String sql = "insert into  maintenance (u_id,create_time,content) values(?,now(),?)";
		int a = DBUtils.update(sql, u_id, content);
		return a;
	}

	/**
	 * 删除公告
	 * 
	 * @param title
	 * @param content
	 * @return
	 */
	public int delPost(int post_id) {
		String sql = "delete from post where post_id=?";
		int a = DBUtils.update(sql, post_id);
		return a;
	}

	/**
	 * 公告列表
	 * 
	 * @param cust
	 * @return
	 */
	public List<Post> selPost() {
		String sql = "select * from post order by create_time desc";
		List<Map<String, Object>> list = DBUtils.queryList(sql);
		if (list != null) {
			List<Post> plist = new ArrayList<Post>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				plist.add(maptop(map));
			}
			return plist;
		}
		return null;
	}

	/**
	 * 数据列表,按操作时间
	 * 
	 * @param cust
	 * @return
	 */
	public List<ShuJu> timeSelShuJu(String start, String end) {
		String sql = "select a.*,b.userName from maintenance a,user b where a.u_id=b.u_id and a.create_time between ? and ? order by a.create_time desc ";
		List<Map<String, Object>> list = DBUtils.queryList(sql, start, end);
		if (list != null) {
			List<ShuJu> slist = new ArrayList<ShuJu>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				slist.add(maptos(map));
			}
			return slist;
		}
		return null;
	}

	/**
	 * 数据列表,按操作人/内容
	 * 
	 * @param cust
	 * @return
	 */
	public List<ShuJu> cSelShuJu(String sql, String can) {
		List<Map<String, Object>> list = DBUtils.queryList(sql, can);
		if (list != null) {
			List<ShuJu> slist = new ArrayList<ShuJu>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				slist.add(maptos(map));
			}
			return slist;
		}
		return null;
	}

	/**
	 * 查权限表
	 * 
	 * @param cust
	 * @return
	 */
	public List<Power> selPower() {
		String sql = "select * from power";
		List<Map<String, Object>> list = DBUtils.queryList(sql);
		if (list != null) {
			List<Power> powerList = new ArrayList<Power>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				powerList.add(maptoPower(map));
			}
			return powerList;
		}
		return null;
	}

	private Power maptoPower(Map<String, Object> map) {
		Power p = new Power();
		p.setPower_id(Integer.parseInt(map.get("power_id").toString()));
		p.setPower_name(map.get("power_name").toString());
		
		return p;
	}

	private ShuJu maptos(Map<String, Object> map) {
		ShuJu s = new ShuJu();
		s.setId(Integer.parseInt(map.get("id").toString()));
		s.setU_id(Integer.parseInt(map.get("u_id").toString()));
		s.setContent(map.get("content").toString());
		s.setCreate_time(map.get("create_time").toString());
		s.setUserName(map.get("userName").toString());
		return s;
	}

	private Post maptop(Map<String, Object> map) {
		Post p = new Post();
		p.setPost_id(Integer.parseInt(map.get("post_id").toString()));
		p.setContent(map.get("content").toString());
		p.setCreate_time(map.get("create_time").toString());
		p.setTitle(map.get("title").toString());
		return p;
	}

}
