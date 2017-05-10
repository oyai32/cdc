package util;
/**
 * 判断是否为空
 * @author Administrator
 *
 */
public class Empty {
	public static boolean empty(String str) {
		if (str != null && !"".equals(str)) {
			return true;
		} else {
			return false;
		}
	}
}
