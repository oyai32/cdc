package util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * 链接数据库工具类
 * 
 * @author Administrator
 * 
 */
public class DBUtils {
	private static ResourceBundle resourceBundle; // 资源束对象
	// SQL数据库引擎
	private static String driver = "com.mysql.jdbc.Driver";
	// 数据源
	private static String connectDB;
	// 用户名
	private static String userName;
	// 密码
	private static String password;

	public static Connection conn = null;

	/**
	 * 获得连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		try {
			// 从配置文件中读取
			try {
				resourceBundle = ResourceBundle.getBundle("database");
			} catch (MissingResourceException e) {
				e.printStackTrace();
			}
			String ip = resourceBundle.getString("ip");
			String port = resourceBundle.getString("port");
			String dbname = resourceBundle.getString("dbname");
			userName = resourceBundle.getString("account");
			password = resourceBundle.getString("password");
			connectDB = "jdbc:mysql://" + ip + ":" + port + "/" + dbname
					+ "?characterEncoding=utf-8";
			// System.out.println("connectDB:"+connectDB);
			// 创建连接
			Class.forName(driver);
			conn = DriverManager.getConnection(connectDB, userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭链接释放资源
	 * 
	 */
	private static void close(ResultSet rs, PreparedStatement pst,
			Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 增删改
	 * 
	 * @param sql
	 * @param objs
	 * @return
	 */
	public static int update(String sql, Object... objs) {
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = getConn();
			pst = conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pst, conn);
		}
		return -1;
	}

	/**
	 * 执行SQL语句返回map
	 * 
	 * @param sql
	 * @param objs
	 * @return
	 */
	public static Map<String, Object> query(String sql, Object... objs) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			conn = getConn();
			pst = conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			rs = pst.executeQuery();
			if (rs != null && rs.next()) {
				map = rsToMap(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pst, conn);
		}
		return map;
	}

	/**
	 * 将result结果集转换成Map
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private static Map<String, Object> rsToMap(ResultSet rs)
			throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		ResultSetMetaData md = rs.getMetaData();
		int count = md.getColumnCount();
		for (int i = 1; i <= count; i++) {
			String key = md.getColumnLabel(i);
			Object value = rs.getObject(key);
			map.put(key, value);
		}
		return map;
	}

	/**
	 * 执行SQL语句返回list对象
	 * 
	 * @param sql
	 * @param objs
	 * @return
	 */
	public static List<Map<String, Object>> queryList(String sql,
			Object... objs) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			conn = getConn();
			pst = conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			rs = pst.executeQuery();
			while (rs != null && rs.next()) {
				list.add(rsToMap(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pst, conn);
		}
		return list;
	}

	/**
	 * 通过语句查数据库里的当前时间
	 * 
	 * @param sql
	 * @return
	 */
	public static String getSystime(String sql) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs != null && rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pst, conn);
		}
		return null;
	}
}
