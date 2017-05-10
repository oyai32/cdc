package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Family;
import model.Person;
import util.DBUtils;

/**
 * 家庭档案数据处理类
 * 
 * @author Administrator
 * 
 */
public class FamilyDao {
	/**
	 * 增加家庭档案
	 * 
	 * @param hzxm
	 */
	public int addFamily(String hzxm, String sfzh, String tel, String birth,
			int num, String shouru, String cz, String address, String db) {
		String sql = "insert into family(hzxm,sfzh,tel,birth,num,shouru,cz,address,db,create_time) values(?,?,?,?,?,?,?,?,?,curdate())";
		int a = DBUtils.update(sql, hzxm, sfzh, tel, birth, num, shouru, cz,
				address, db);
		return a;
	}

	/**
	 * 按时间查询
	 * 
	 * @param cust
	 * @return
	 */
	public List<Family> timeSelFamily(String start, String end) {
		String sql = "select * from family where create_time between ? and ? ";
		List<Map<String, Object>> list = DBUtils.queryList(sql, start, end);
		if (list != null) {
			List<Family> familyList = new ArrayList<Family>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				familyList.add(maptof(map));
			}
			return familyList;
		}
		return null;
	}

	/**
	 * 按村庄查询
	 * 
	 * @param cust
	 * @return
	 */
	public List<Family> czSelFamily(String cz) {
		String sql = "select * from family where cz=?";
		List<Map<String, Object>> list = DBUtils.queryList(sql, cz);
		if (list != null) {
			List<Family> familyList = new ArrayList<Family>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				familyList.add(maptof(map));
			}
			return familyList;
		}
		return null;
	}

	/**
	 * 按id查询
	 * 
	 * @param cust
	 * @return
	 */
	public Family idSelFamily(int f_id) {
		String sql = "select * from family where f_id =? ";
		Map<String, Object> map = DBUtils.query(sql, f_id);
		Family f = new Family();
		if (map.get("f_id") != null) {
			f = maptof(map);
		}
		return f;
	}

	public int delFamliy(int f_id) {
		String sql = "delete from family where f_id =? ";
		int a = DBUtils.update(sql, f_id);
		return a;
	}

	public int updateFamily(int f_id, String hzxm, String sfzh, String tel,
			String birth, int num, String shouru, String cz, String address,
			String db) {
		String sql = "update  family set hzxm=?, sfzh=?, tel=?,  birth=?,  num=?,  shouru=?,  cz=?,  address=?,  db=? where f_id=? ";
		int a = DBUtils.update(sql, hzxm, sfzh, tel, birth, num, shouru, cz,
				address, db, f_id);
		return a;
	}

	/**
	 * map转换为family实体
	 * 
	 * @param map
	 * @return
	 */
	public static Family maptof(Map<String, Object> map) {
		Family f = new Family();
		f.setF_id(Integer.parseInt(map.get("f_id").toString()));
		f.setHzxm(map.get("hzxm").toString());
		f.setSfzh(map.get("sfzh").toString());
		f.setTel(map.get("tel").toString());
		f.setBirth(map.get("birth").toString());
		f.setNum(Integer.parseInt(map.get("num").toString()));
		f.setShouru(map.get("shouru").toString());
		f.setCreate_time(map.get("create_time").toString());
		f.setCz(map.get("cz").toString());
		f.setAddress(map.get("address").toString());
		f.setDb(map.get("db").toString());
		return f;
	}

}
