package com.t.core.util;

public class StrUtils {
	
	/**
	 * ��֤�Ƿ�Ϊ���ַ���
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
