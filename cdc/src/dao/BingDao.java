package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Manager;
import model.Person;
import util.DBUtils;

public class BingDao {
	/**
	 * 添加随访记录
	 * 
	 * @return
	 */
	public int addSuifang(int p_id, String visit_time, String text, String zz,
			String mb,String sftext) {
		String sql = "insert into manager (p_id,visit_time,text,zz,mb,update_time,sftext) values(?,?,?,?,?,curdate(),?)";
		int a = DBUtils.update(sql, p_id, visit_time, text, zz, mb,sftext);
		return a;
	}
	/**
	 * 修改慢病信息
	 * 
	 * @return
	 */
	public int updateMb(int p_id,String mb) {
		String sql = "update manager set mb=? where p_id=?";
		int a = DBUtils.update(sql,mb,p_id);
		return a;
	}
	/**
	 * 添加干预建议
	 * 
	 * @return
	 */
	public int addSuggest(int p_id, String suggest) {
		String sql = "insert into gysuggest (p_id,suggest,create_time) values(?,?,now())";
		int a = DBUtils.update(sql, p_id,suggest);
		return a;
	}

	/**
	 * 添加第一条随访记录（即创建档案）
	 * 
	 * @return
	 */
	public int firstSuifang(int p_id,String sftext) {
		System.out.println(sftext);
		String sql = "insert into manager (p_id,visit_time,text,zz,mb,update_time,sftext) values(?,curdate(),'创建档案',' ','否',curdate(),?)";
		int a = DBUtils.update(sql, p_id,sftext);
		return a;
	}

	/**
	 * 根据患者id，查询干预记录
	 * 
	 * @param cust
	 * @return
	 */
	public List<Manager> idSelManager(int p_id) {
		String sql = "select * from manager where p_id=? order by update_time desc";
		List<Map<String, Object>> list = DBUtils.queryList(sql, p_id);
		if (list != null) {
			List<Manager> mList = new ArrayList<Manager>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				mList.add(maptom(map));
			}
			return mList;
		}
		return null;
	}

	/**
	 * 根据患者id，查询干预建议
	 * 
	 * @param cust
	 * @return
	 */
	public String idSelSuggest(int p_id) {
		String sql = "select * from gysuggest where p_id=? order by create_time desc limit 0,1";
		String  suggest=null;
		Map<String,Object> map=DBUtils.query(sql, p_id);
		if (map.get("p_id") != null) {
			suggest=map.get("suggest").toString();
		}
		return suggest;
	}

	private Manager maptom(Map<String, Object> map) {
		Manager m = new Manager();
		m.setM_id(Integer.parseInt(map.get("m_id").toString()));
		m.setP_id(Integer.parseInt(map.get("p_id").toString()));
		m.setVisit_time(map.get("visit_time").toString());
		m.setText(map.get("text").toString());
		m.setZz(map.get("zz").toString());
		m.setSftext(map.get("sftext").toString());
		m.setMb(map.get("mb").toString());
		m.setUpdate_time(map.get("update_time").toString());
		return m;
	}

}
