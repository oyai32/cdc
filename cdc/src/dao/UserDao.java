package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Family;
import model.User;
import util.DBUtils;
import util.Empty;

public class UserDao {

	/**
	 * 添加用户
	 * 
	 * @return
	 */
	public boolean addUser(String zhanghao, String userName, int r_id, String cz) {
		String sql = "select power from rank where r_id=?";// 查询默认权限
		Map<String, Object> map = DBUtils.query(sql, r_id);
		String power = map.get("power").toString();
		sql = "insert into user(zhanghao,userName,password,create_time,r_id,cz,power)values(?,?,'000000',curdate(),?,?,?)";
		int a = DBUtils.update(sql, zhanghao, userName, r_id, cz, power);
		if (a > 0) {
			return true;
		} else {
			return false;
		}

	}
	/**
	 * 检查操作人身份
	 */
		public int idSel(int u_id){
			String sql="select r_id from user where u_id=?";
			Map<String, Object> map = DBUtils.query(sql, u_id);
			int r_id = Integer.parseInt(map.get("r_id").toString());
			return r_id;
		}
	/**
	 * 按id查询
	 * 
	 * @param cust
	 * @return
	 */
	public User idSelUser(int u_id) {
		String sql = "select a.*,b.r_name from user a,rank b where u_id =? and a.r_id=b.r_id ";
		Map<String, Object> map = DBUtils.query(sql, u_id);
		User u = new User();
		if (map.get("u_id") != null) {
			u = maptou(map);
		}
		return u;
	}

	/**
	 * 按帐号密码查询
	 * 
	 * @param cust
	 * @return
	 */
	public User login(String zhanghao, String password) {

		String sql = "select a.*,b.r_name from user a,rank b where zhanghao =? and password=? and a.r_id=b.r_id";
		Map<String, Object> map = DBUtils.query(sql, zhanghao, password);
		User u = new User();
		if (map.get("u_id") != null) {
			u = maptou(map);
		} else {
			u = null;
		}
		return u;
	}

	/**
	 * 按帐号查询是否存在此帐号
	 * 
	 * @param cust
	 * @return
	 */
	public boolean sZhang(String zhanghao) {

		String sql = "select count(1) as count from user  where zhanghao =? ";
		Map<String, Object> map = DBUtils.query(sql, zhanghao);
		if (Integer.parseInt(map.get("count").toString()) > 0) {
			return false;
		} else {
			return true;
		}
	}
	/**
	 *修改权限
	 * 
	 * @param cust
	 * @return
	 */
	public boolean updatePower(String power,int u_id) {

		String sql = "update user set power=? where u_id=? ";
		int a= DBUtils.update(sql, power,u_id);
		if (a> 0) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 按帐号查询用户
	 * 
	 * @param cust
	 * @return
	 */
	public User zSelUser(String zhanghao) {
		String sql = "select a.*,b.r_name  from user a,rank b  where zhanghao =? and a.r_id=b.r_id";
		Map<String, Object> map = DBUtils.query(sql, zhanghao);
		User u = new User();
		if (map.get("u_id") != null) {
			u = maptou(map);
		}
		return u;
	}
	/**
	 * 按用户名查询用户
	 * 
	 * @param cust
	 * @return
	 */
	public User uSelUser(String userName) {
		String sql = "select a.*,b.r_name  from user a,rank b  where userName =?  and a.r_id=b.r_id";
		Map<String, Object> map = DBUtils.query(sql, userName);
		User u = new User();
		if (map.get("u_id") != null) {
			u = maptou(map);
		}
		return u;
	}
	/**
	 * 按id修改密码
	 * 
	 * @param cust
	 * @return
	 */
	public boolean updatePwd(int u_id, String ypw, String xpw) {
		String sql = "update user set password=? where u_id=? and password=?";
		int a = DBUtils.update(sql, xpw, u_id, ypw);
		if (a > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 初始化密码
	 * 
	 * @param cust
	 * @return
	 */
	public boolean cshPwd(int u_id) {
		String sql = "update user set password='000000' where u_id=? ";
		int a = DBUtils.update(sql, u_id);
		if (a > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 删除
	 * 
	 * @param cust
	 * @return
	 */
	public boolean delUser(int u_id) {
		String sql = "delete from user where u_id=? ";
		int a = DBUtils.update(sql, u_id);
		if (a > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 按时间查用户列表
	 * 
	 * @param cust
	 * @return
	 */
	public List<User> timeSelUser(String start, String end) {
		String sql = "select a.*,b.r_name from user a,rank b where a.create_time between ? and ?  and b.r_id=a.r_id";
		List<Map<String, Object>> list = DBUtils.queryList(sql, start, end);
		if (list != null) {
			List<User> ulist = new ArrayList<User>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				ulist.add(maptou(map));
			}
			return ulist;
		}
		return null;
	}

	/**
	 * 按村庄查用户列表
	 * 
	 * @param cust
	 * @return
	 */
	public List<User> czSelUser(String cz) {
		String sql = "select a.*,b.r_name from user a,rank b where a.cz=? and b.r_id=a.r_id";
		List<Map<String, Object>> list = DBUtils.queryList(sql, cz);
		if (list != null) {
			List<User> ulist = new ArrayList<User>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				ulist.add(maptou(map));
			}
			return ulist;
		}
		return null;
	}

	/**
	 * map转换为user实体
	 * 
	 * @param map
	 * @return
	 */
	public static User maptou(Map<String, Object> map) {
		User u = new User();
		u.setU_id(Integer.parseInt(map.get("u_id").toString()));
		u.setZhanghao(map.get("zhanghao").toString());
		u.setPassword(map.get("password").toString());
		u.setUserName(map.get("userName").toString());
		u.setCreate_time(map.get("create_time").toString());
		u.setCz(map.get("cz").toString());
		u.setPower(map.get("power").toString());
		u.setR_name(map.get("r_name").toString());
		u.setR_id(Integer.parseInt(map.get("r_id").toString()));
		return u;
	}
}
