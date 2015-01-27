package cn.xyurp.system.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MyConstants {

	public static Map<String, String> initMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("add", "添加");
		map.put("update", "修改");
		// map.put("toAdd", "转至添加页面");
		map.put("del", "删除");
		//map.put("ts", "删除");
		map.put("list", "查看");
		map.put("show", "查看");
		// map.put("getListByC", "查询");
		map.put("find", "查看");
		// map.put("updateExpireTime", 1);
		// map.put("toExecl", "导出");
		map.put("getExecl", "导出");
		map.put("exporttjsj", "导出");
		map.put("sjtj", "查看");
		map.put("addRoles", "添加");
		map.put("login", "登录");
		map.put("userAddRoles", "分配角色");
		// map.put("addUI", 1);
		return map;
	}

	public static Map<String, Integer> initAuthMap() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("add", 0);
		map.put("update", 2);
		map.put("toAdd", 0);
		map.put("del", 3);
		map.put("list", 1);
		map.put("show", 1);
		map.put("getListByC", 1);
		map.put("find", 1);
		map.put("updateExpireTime", 2);
		map.put("toExecl", 1);
		map.put("getExecl", 1);
		map.put("getRoles", 0);
		map.put("addRoles", 0);
		map.put("userAddRoles", 0);
		map.put("addUI", 0);
		map.put("down", 1);
		map.put("useracl", 0);
		map.put("findModule", 1);
		map.put("selectList", 1);
		map.put("findRole", 1);
		map.put("select", 1);
		map.put("findUsers", 1);
		map.put("delUserRole", 3);
		map.put("updateExpireTime", 2);
		map.put("updateSave", 2);
		map.put("toUpdate", 1);
		map.put("lq", 0);
		map.put("qx", 0);
		map.put("tz", 0);
		map.put("pldy", 0);
		map.put("toImport", 0);
		map.put("importExcel", 0);
		map.put("release", 2);
		map.put("showToAdmin", 1);
		map.put("zkzPrint", 0);
		map.put("zt", 0);
		map.put("ks", 0);
		map.put("sc", 0);
		map.put("sjtj", 1);
		map.put("plfs", 0);
		map.put("pllq", 0);
		map.put("unRetrial", 0);
		map.put("retrial", 0);
		map.put("zhmm", 1);
		map.put("toZhmm", 1);
		return map;
	}
	public static Map<String, String> initUrlMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user", "/user/list.action");
		map.put("role", "/role/list.action");
		map.put("module", "/module/list.action");
		map.put("sysLog", "/sysLog/list.action");
		map.put("sysVariable", "/sysVar/show.action?o.id=1");
		map.put("specialty", "/specialty/list.action");
		map.put("bj", "/bj/list.action");
		map.put("hk", "/hk/list.action");
		map.put("zh", "/zh/list.action");
		map.put("tc", "/tc/list.action");
		map.put("cshz", "/cshz/list.action");
		map.put("fs", "/fs/list.action");
		map.put("examinee", "/examinee/list.action");
		map.put("kslq", "/kslq/list.action");
		map.put("guestBook", "/guestBook/list.action");
		map.put("notice", "/notice/list.action");
		map.put("tj", "/examinee/sjtj.action");
		map.put("link", "/link/list.action");
		map.put("zhmm", "/examinee/toZhmm.action");
		map.put("cs", "/cs/list.action");

		return map;
	}
	public static String getUrl(String key) {
		Map<String, String> map = initUrlMap();
		String value = (String) map.get(key);
		return value;
	}
	
	public static String getMethod(String key) {
		Map<String, String> map = initMap();
		String value = (String) map.get(key);
		return value;
	}

	public static Integer getAuthMethod(String key) {
		Map<String, Integer> map = initAuthMap();
		Integer value = (Integer) map.get(key);
		return value;
	}


	public static String ISOToUtf(String str) {
		String s = "";
		try {
			s = new String(str.getBytes("iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return s;
	}

	public static String ISOToGBK(String str) {
		String s = "";
		try {
			s = new String(str.getBytes("iso-8859-1"), "GBK");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return s;
	}

	public static String GBKToUTF(String str) {
		String s = "";
		try {
			s = new String(str.getBytes("GBK"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return s;
	}

	/**
	 * 判断是否汉字
	 * 
	 * @param str
	 * @return
	 */
	public static String vd(String str) {

		String ret = ISOToGBK(str);
		char[] chars = ret.toCharArray();
		boolean isGBK = false;
		for (int i = 0; i < chars.length; i++) {
			byte[] bytes = ("" + chars[i]).getBytes();
			if (bytes.length == 2) {
				int[] ints = new int[2];
				ints[0] = bytes[0] & 0xff;
				ints[1] = bytes[1] & 0xff;
				if (ints[0] >= 0x81 && ints[0] <= 0xFE && ints[1] >= 0x40
						&& ints[1] <= 0xFE) {
					isGBK = true;
					break;
				}
			}
		}
		if (isGBK) {
			return ret;
		} else {
			return str;
		}
	}

	public static int StringToInt(String number) {
		try {
			return Integer.parseInt(number);
		} catch (Exception e) {
			return 0;
		}
	}
}
