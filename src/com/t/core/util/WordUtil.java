package com.t.core.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

public class WordUtil {

	/**
	 * 根据Word模板替换内容
	 * @param templetPath 模板路径
	 * @param valueMap 值Map
	 * @param outFilePath 输出文件路径
	 * @return
	 */
	public static boolean replaceByTemplet(String templetPath, Map<String, String> valueMap, String outFilePath) {
		boolean isSuccess = false;
		InputStream is = null;
		OutputStream os = null;
		HWPFDocument doc = null;
		try {
			is = new FileInputStream(templetPath);
			doc = new HWPFDocument(is);
			Range range = doc.getRange();
			for (String key : valueMap.keySet()) {
				String value = valueMap.get(key) == null ? "" : valueMap.get(key);
				range.replaceText(key, value);
			}
			os = new FileOutputStream(outFilePath);
			doc.write(os);
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (is != null) {
					is.close();
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {
				if (os != null) {
					os.close();
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return isSuccess;
	}

	public static void main(String[] args) throws Exception {
		Map<String, String> valueMap = new HashMap<String, String>();
		valueMap.put("$hphm", "渝AX8786");
		valueMap.put("$clsbdh", "☑合格    □不合格");
		valueMap.put("$pzr", "张三");
		valueMap.put("$qsr", "☑合格    □不合格");
		valueMap.put("$jcrq", "2019-12-12 12:12:12");
		boolean flag = replaceByTemplet("D:\\Temp\\docin\\wqbg_asm_a4.doc", valueMap,
				"d:\\Temp\\" + System.currentTimeMillis() + ".doc");
		System.out.println(flag);
	}
}
