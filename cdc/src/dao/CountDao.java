package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import model.Count;

import util.DBUtils;
import util.Empty;

public class CountDao {
	/**
	 * 统计全部
	 * 
	 * @return
	 */
	public Count qCount() {
		// Map<String,Object> map=new HashMap<String, Object>();
		String sql = null;
		Count count = new Count();
		sql = "select count(1) as count from person where ssy>140 and szy>90";// 高血压患者高血压患病人数
		String gxyhbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxyhbr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxyhbr(gxyhbr);

		sql = "select count(1) as count from person where kfxt>5.7 and chxt>7";// 糖尿病患病人数
		String tnbhbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbhbr = DBUtils.query(sql).get("count").toString();
		}
		count.setTnbhbr(tnbhbr);

		sql = "select count(1) as count from person a,manager b where a.p_id=b.p_id  and b.mb='是' group by a.p_id";// 其他慢性病患病人数
		String qthbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qthbr = DBUtils.query(sql).get("count").toString();
		}
		count.setQthbr(qthbr);

		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p_id from person where ssy>140 and szy>90) group by p_id having c>1) t";// 高血压随访人数
		String gxysfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxysfr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxysfr(gxysfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p_id from person  where kfxt>5.7 and chxt>7) group by p_id having c>1) t";// 糖尿病随访人数
		String tnbsfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbsfr = DBUtils.query(sql).get("count").toString();
		}
		count.setTnbsfr(tnbsfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m where p.p_id=m.p_id and m.mb='是' group by p.p_id)  group by p_id having c>1) t";// 慢病随访人数
		String qtsfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qtsfr = DBUtils.query(sql).get("count").toString();
		}
		count.setQtsfr(qtsfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m where p.p_id=m.p_id and m.mb='是' and m.sftext is not null group by p.p_id) group by p_id having c>1) t";// 慢病干预人数
		String qtgyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qtgyr = DBUtils.query(sql).get("count").toString();
		}
		count.setQtgyr(qtgyr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m  where ssy>140 and szy>90 and p.p_id=m.p_id and m.sftext is not null) group by p_id having c>1) t";// 高血压干预人数
		String gxygyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxygyr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxygyr(gxygyr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m  where kfxt>5.7 and chxt>7 and p.p_id=m.p_id and m.sftext is not null) group by p_id having c>1) t";// 糖尿病干预人数
		String tnbgyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbgyr = DBUtils.query(sql).get("count").toString();
		}
		
		count.setTnbgyr(tnbgyr);
		count.setGxysfl(js(gxysfr, gxyhbr));
		count.setGxygyl(js(gxygyr, gxyhbr));
		count.setGxyglr(gxysfr);
		count.setGxygll(js(gxysfr, gxyhbr));
		count.setTnbglr(tnbsfr);
		count.setTnbgll(js(tnbsfr, tnbhbr));
		count.setQtgll(js(qtsfr, qthbr));
		count.setQtglr(qtsfr);
		count.setTnbsfl(js(tnbsfr, tnbhbr));
		count.setTnbgyl(js(tnbgyr, tnbhbr));
		count.setQtsfl(js(qtsfr, qthbr));
		count.setQtgyr(qtgyr);
		count.setQtgyl(js(qtgyr,qthbr));
		return count;
	}

	/**
	 * 按村统计
	 * 
	 * @return
	 */
	public Count cCount(String cun) {
		// Map<String,Object> map=new HashMap<String, Object>();
		String sql = null;
		Count count = new Count();
		sql = "select count(1) as count from person where ssy>140 and szy>90 and cz='"
				+ cun + "'";// 高血压患者高血压患病人数
		String gxyhbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxyhbr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxyhbr(gxyhbr);

		sql = "select count(1) as count from person where kfxt>5.7 and chxt>7 and cz='"
				+ cun + "'";// 糖尿病患病人数
		String tnbhbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbhbr = DBUtils.query(sql).get("count").toString();
		}
		count.setTnbhbr(tnbhbr);

		sql = "select count(1) as count from person a,manager b where a.p_id=b.p_id  and b.mb='是' and  a.cz='"
				+ cun + "' group by a.p_id";// 其他慢性病患病人数
		String qthbr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qthbr = DBUtils.query(sql).get("count").toString();
		}
		count.setQthbr(qthbr);

		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p_id from person where ssy>140 and szy>90 and cz='"
				+ cun + "') group by p_id having c>1) t";// 高血压随访人数
		String gxysfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxysfr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxysfr(gxysfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p_id from person  where kfxt>5.7 and chxt>7 and cz='"
				+ cun + "') group by p_id having c>1) t";// 糖尿病随访人数
		String tnbsfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbsfr = DBUtils.query(sql).get("count").toString();
		}
		count.setTnbsfr(tnbsfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m where p.p_id=m.p_id and m.mb='是' and p.cz='"
				+ cun + "' group by p.p_id)  group by p_id having c>1) t";// 慢病随访人数
		String qtsfr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qtsfr = DBUtils.query(sql).get("count").toString();
		}
		count.setQtsfr(qtsfr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m where p.p_id=m.p_id and m.mb='是'  and p.cz='"
				+ cun+ "' and m.sftext is not null group by p.p_id) group by p_id having c>1) t";// 慢病干预人数
		String qtgyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			qtgyr = DBUtils.query(sql).get("count").toString();
		}
		count.setQtgyr(qtgyr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m  where ssy>140 and szy>90 and p.p_id=m.p_id and p.cz='"
				+ cun
				+ "' and m.sftext is not null) group by p_id having c>1) t";// 高血压干预人数
		String gxygyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			gxygyr = DBUtils.query(sql).get("count").toString();
		}
		count.setGxygyr(gxygyr);
		sql = "select count(1) as count from (select p_id,count(1) as c from manager  where p_id in (select p.p_id from person p,manager m  where kfxt>5.7 and chxt>7 and p.p_id=m.p_id and p.cz='"
				+ cun + "' and m.sftext is not null) group by p_id having c>1) t";// 糖尿病干预人数
		String tnbgyr = "0";
		if (DBUtils.query(sql).get("count") != null) {
			tnbgyr = DBUtils.query(sql).get("count").toString();
		}
		count.setTnbgyr(tnbgyr);
		count.setGxysfl(js(gxysfr, gxyhbr));
		count.setGxygyl(js(gxygyr, gxyhbr));
		count.setGxyglr(gxysfr);
		count.setGxygll(js(gxysfr, gxyhbr));
		count.setTnbglr(tnbsfr);
		count.setTnbgll(js(tnbsfr, tnbhbr));
		count.setQtgll(js(qtsfr, qthbr));
		count.setQtglr(qtsfr);
		count.setTnbsfl(js(tnbsfr, tnbhbr));
		count.setTnbgyl(js(tnbgyr, tnbhbr));
		count.setQtsfl(js(qtsfr, qthbr));
		count.setQtgyr(qtgyr);
		count.setQtgyl(js(qtgyr,qthbr));
		return count;
	}

	public static String js(String ren, String zong) {

		if (!ren.equals("0") && !zong.equals("0")) {

			int jren = Integer.parseInt(ren);
			int jzong = Integer.parseInt(zong);
			float b = (float) jren / (float) jzong;
			DecimalFormat df = new DecimalFormat("0.0");// 格式化小数
			String lv = df.format(b*100) + "%";// 返回的是String类型
			return lv;
		}
		return "0";
	}
	
	public static void main(String[] args) {
		System.out.println(js("1","4"));
	}
}
