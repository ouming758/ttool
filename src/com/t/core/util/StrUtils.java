package com.t.core.util;

public class StrUtils {
	
	/**
	 * 验证是否为空字符串
	 * @param str
	 * @return boolean
	 */
	public static boolean isBlank(String str) {
		if (str == null || "".equals(str)) {
			return true;
		}
		return false;
	}


}
