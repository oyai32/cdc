package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import model.Person;
import util.DBUtils;
import util.Empty;

/**
 * 关于个人信息模块的数据处理
 * 
 * @author Administrator
 * 
 */
public class PersonDao {

	/**
	 * 添加个人档案
	 * 
	 * @param p_name
	 * @return
	 */
	public int addPerson(int p_id, String p_name, String p_sex,
			String p_birth, String sfzh, String jzzk, String yhzgx, String cz,
			String hzxm, String hzsfzh, String address, String tel,
			String gzdw, String whcd, String hyzk, String mz, int ssy, int szy,
			float kfxt, float chxt, String yan, String height, String weight) {
		String bmi =smbi(height,weight);
		String sql = "insert into person (p_id,p_name,p_sex,p_birth,sfzh,jzzk,yhzgx,cz,hzxm,hzsfzh,address,tel,gzdw,whcd,hyzk,mz,ssy,szy,kfxt,chxt,create_time,yan,height,weight,bmi) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,curdate(),?,?,?,?)";
		int a = DBUtils.update(sql, p_id, p_name, p_sex, p_birth, sfzh, jzzk,
				yhzgx, cz, hzxm, hzsfzh, address, tel, gzdw, whcd, hyzk, mz,
				ssy, szy, kfxt, chxt, yan, height, weight, bmi);
		return a;
	}

	public static String smbi(String height,String weight){
		
		if( Empty.empty(height)&&Empty.empty(weight) ){
			
			int xh = Integer.parseInt(height);
			int xw = Integer.parseInt(weight);
			float b = (float) xw / (((float) xh / 100) * ((float) xh / 100));
			DecimalFormat df = new DecimalFormat("0.00");// 格式化小数
			String bmi = df.format(b);// 返回的是String类型
			return bmi;
		}
		return " ";
	}

	/**
	 * 按时间查询
	 * 
	 * @param cust
	 * @return
	 */
	public List<Person> timeSelPerson(String sql,String start, String end) {
		System.out.println(sql);
		List<Map<String, Object>> list = DBUtils.queryList(sql, start, end);
		System.out.println(list);
		if (list != null) {
			List<Person> personList = new ArrayList<Person>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				personList.add(maptop(map));
			}
			return personList;
		}
		return null;
	}

	/**
	 * 按村庄查询
	 * 
	 * @param cust
	 * @return
	 */
	public List<Person> czSelPerson(String cz) {
		String sql = "select * from person where cz =? ";
		List<Map<String, Object>> list = DBUtils.queryList(sql, cz);
		if (list != null) {
			List<Person> personList = new ArrayList<Person>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				personList.add(maptop(map));
			}
			return personList;
		}
		return null;
	}

	/**
	 * 按时间查询各种患者
	 * 
	 * @param cust
	 * @return
	 */
	public List<Person> btSelPerson(String sql, String start, String end) {
		List<Map<String, Object>> list = DBUtils.queryList(sql, start, end);
		if (list != null) {
			List<Person> personList = new ArrayList<Person>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				personList.add(maptop(map));
			}
			return personList;
		}
		return null;
	}

	/**
	 * 按村庄查询各种患者
	 * 
	 * @param cust
	 * @return
	 */
	public List<Person> bcSelPerson(String sql, String cz) {
		List<Map<String, Object>> list = DBUtils.queryList(sql, cz);
		if (list != null) {
			List<Person> personList = new ArrayList<Person>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				personList.add(maptop(map));
			}
			return personList;
		}
		return null;
	}
	/**
	 * 按条件查询各种患者（高危）
	 * 
	 * @param cust
	 * @return
	 */
	public List<Person> selPerson(String sql) {
		List<Map<String, Object>> list = DBUtils.queryList(sql);
		if (list != null) {
			List<Person> personList = new ArrayList<Person>();
			Map<String, Object> map = null;
			for (int i = 0; i < list.size(); i++) {
				map = list.get(i);
				personList.add(maptop(map));
			}
			return personList;
		}
		return null;
	}
	/**
	 * 按id查询
	 * 
	 * @param cust
	 * @return
	 */
	public Person idSelPerson(int p_id) {
		String sql = "select * from person where p_id =? ";
		Map<String, Object> map = DBUtils.query(sql, p_id);
		Person p = new Person();
		if (map.get("p_id") != null) {
			p = maptop(map);
			return p;
		} else {
			return null;
		}
	}

	/**
	 * 删除个人信息
	 * 
	 * @param cust
	 * @return
	 */
	public int delPerson(int p_id) {
		String sql = "delete from person where p_id =? ";
		int a = DBUtils.update(sql, p_id);
		return a;
	}

	/**
	 * 修改个人信息
	 * 
	 * @return
	 */
	public int updatePerson(int p_id, String p_name, String p_sex,
			String p_birth, String sfzh, String jzzk, String yhzgx, String cz,
			String hzxm, String hzsfzh, String address, String tel,
			String gzdw, String whcd, String hyzk, String mz, int ssy, int szy,
			float kfxt, float chxt,String yan,String height,String weight) {
		
		String bmi=smbi(height,weight);
		System.out.println("-------------------------");
		String sql = "update  person  set p_name=?,p_sex=?,p_birth=?,sfzh=?,jzzk=?,yhzgx=?,cz=?,hzxm=?,hzsfzh=?,address=?,tel=?,gzdw=?,whcd=?,hyzk=?,mz=?,ssy=?,szy=?,kfxt=?,chxt=?,yan=?,height=?,weight=?,bmi=? where p_id=?";
	
		int a = DBUtils.update(sql, p_name, p_sex, p_birth, sfzh, jzzk, yhzgx,
				cz, hzxm, hzsfzh, address, tel, gzdw, whcd, hyzk, mz, ssy, szy,
				kfxt, chxt, yan,height,weight,bmi,p_id);
		return a;
	}

	/**
	 * map转换为person实体
	 * 
	 * @param map
	 * @return
	 */
	public static Person maptop(Map<String, Object> map) {
		Person p = new Person();
		p.setP_id(Integer.parseInt(map.get("p_id").toString()));
		p.setP_name(map.get("p_name").toString());
		p.setP_sex(map.get("p_sex").toString());
		p.setP_birth(map.get("p_birth").toString());
		p.setSfzh(map.get("sfzh").toString());
		p.setJzzk(map.get("jzzk").toString());
		p.setYhzgx(map.get("yhzgx").toString());
		p.setCz(map.get("cz").toString());
		p.setHzxm(map.get("hzxm").toString());
		p.setHzsfzh(map.get("hzsfzh").toString());
		p.setAddress(map.get("address").toString());
		p.setTel(map.get("tel").toString());
		p.setGzdw(map.get("gzdw").toString());
		p.setWhcd(map.get("whcd").toString());
		p.setHyzk(map.get("hyzk").toString());
		p.setMz(map.get("mz").toString());
		p.setYan(map.get("yan").toString());
		String height=map.get("height").toString();
		String weight=map.get("weight").toString();
		p.setHeight(height);
		p.setWeight(weight);
		p.setBmi(smbi(height,weight));
		p.setSsy(Integer.parseInt(map.get("ssy").toString()));
		p.setSzy(Integer.parseInt(map.get("szy").toString()));
		p.setKfxt(Float.parseFloat(map.get("kfxt").toString()));
		p.setChxt(Float.parseFloat(map.get("chxt").toString()));
		p.setCreate_time(map.get("create_time").toString());
		return p;
	}


}
