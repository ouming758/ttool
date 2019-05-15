/**
 *******************************************************************************
 * Simple To Introduction
 * 
 * 项 目 名：pdvims <br>
 * 包 路 径：com.xz.pdvims.core.util.AntZipUtil.java <br>
 * 模 块 名：(手动填写) <br>
 * 创 建 人：谭地明 <br>
 * 创建时间：Dec 10, 2012 3:32:04 PM <br>
 * 修改历史：<br>
 * 日期			修改人		描述 <br>
 * ----------------------------------------------------------------------------- <br>
 * 
 * 版    本：1.0 <br>
 * Copyright © 2012 重庆市小召科技有限公司. All Rights Reserved.
 *******************************************************************************  
 */
package com.t.core.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

/**
 * 压缩、解压文件工具类 (depends on ant.jar)
 * @author Administrator
 */
@SuppressWarnings("rawtypes")
public class AntZipUtil {

	private static final int BUFFEREDSIZE = 1024;

	/**
	 * 压缩文件到zip格式
	 * @param inputFilePath 压缩的文件或文件夹及详细路径
	 * @throws IOException void
	 */
	public static synchronized void zip(String inputFilePath) throws IOException {
		if (inputFilePath.lastIndexOf(File.separator) != -1) {
			inputFilePath = inputFilePath.substring(0, inputFilePath.length() - 1);
		}
		String outFileName = inputFilePath + ".zip";
		zip(inputFilePath, outFileName);
	}

	/**
	 * 压缩文件到zip格式 <br>
	 * @param inputFilePath 压缩的文件或文件夹及详细路径
	 * @param zipFilePath 输出文件名称及详细路径
	 * @throws IOException void
	 */
	public static synchronized void zip(String inputFilePath, String zipFilePath) throws IOException {
		zip(new File(inputFilePath), zipFilePath);
	}

	/**
	 * 压缩文件到zip格式
	 * @param inputFile 需压缩文件
	 * @param zipFilePath 输出文件及详细路径
	 * @throws IOException void
	 */
	public static synchronized void zip(File inputFile, String zipFilePath) throws IOException {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFilePath));
		out.setEncoding("gb2312");
		try {
			zip(inputFile, out, "");
		} catch (IOException e) {
			throw e;
		} finally {
			out.close();
		}
	}

	/**
	 * 压缩文件到zip格式
	 * @param inputFile 需压缩文件
	 * @param out 输出压缩文件
	 * @param base 结束标识
	 * @throws IOException void
	 */
	private static synchronized void zip(File inputFile, ZipOutputStream out, String base) throws IOException {
		if (inputFile.isDirectory()) { // 如果是目录
			File[] inputFiles = inputFile.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < inputFiles.length; i++) {
				zip(inputFiles[i], out, base + inputFiles[i].getName());
			}
		} else { // 如果是文件
			if (base.length() > 0) {
				out.putNextEntry(new ZipEntry(base));
			} else {
				out.putNextEntry(new ZipEntry(inputFile.getName()));
			}
			FileInputStream in = null;
			try {
				in = new FileInputStream(inputFile);
				int len;
				byte[] buff = new byte[BUFFEREDSIZE];
				while ((len = in.read(buff)) != -1) {
					out.write(buff, 0, len);
				}
			} catch (IOException e) {
				throw e;
			} finally {
				try {
					in.close();
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
	}

	/**
	 * 解zip格式压缩包
	 * @param zipFilePath 压缩包路劲
	 * @throws Exception void
	 */
	public static synchronized void unzip(String zipFilePath) throws Exception {// 解压到当前文件夹
		String unzipDirPath = zipFilePath.substring(0, zipFilePath.lastIndexOf("."));
		unzip(zipFilePath, unzipDirPath);
	}

	/**
	 * 解压zip格式的压缩文件到指定位置
	 * @param zipFilePath 压缩包路劲
	 * @param unzipDirPath 解压存放目录
	 * @throws Exception void
	 */
	public static synchronized void unzip(String zipFilePath, String unzipDirPath) throws Exception {
		InputStream is = null;
		BufferedInputStream bis = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		try {
			(new File(unzipDirPath)).mkdirs();
			File f = new File(zipFilePath);
			ZipFile zipFile = new ZipFile(zipFilePath);
			if ((!f.exists()) && (f.length() <= 0)) {
				throw new Exception("要解压的文件不存在!");
			}
			String strPath, gbkPath, strtemp;
			File tempFile = new File(unzipDirPath);// 从当前目录开始
			strPath = tempFile.getAbsolutePath();// 输出的绝对位置
			Enumeration e = zipFile.getEntries();
			while (e.hasMoreElements()) {
				org.apache.tools.zip.ZipEntry zipEnt = (ZipEntry) e.nextElement();
				gbkPath = zipEnt.getName();
				if (zipEnt.isDirectory()) {
					strtemp = strPath + File.separator + gbkPath;
					File dir = new File(strtemp);
					dir.mkdirs();
					continue;
				} else {
					// 读写文件
					is = zipFile.getInputStream(zipEnt);
					bis = new BufferedInputStream(is);
					gbkPath = zipEnt.getName();
					strtemp = strPath + File.separator + gbkPath;

					// 建目录
					String strsubdir = gbkPath;
					for (int i = 0; i < strsubdir.length(); i++) {
						if (strsubdir.substring(i, i + 1).equalsIgnoreCase("/")) {
							String temp = strPath + File.separator + strsubdir.substring(0, i);
							File subdir = new File(temp);
							if (!subdir.exists())
								subdir.mkdir();
						}
					}
					fos = new FileOutputStream(strtemp);
					bos = new BufferedOutputStream(fos);
					int len;
					byte[] buff = new byte[BUFFEREDSIZE];
					while ((len = bis.read(buff)) != -1) {
						bos.write(buff, 0, len);
					}
					bos.close();
					fos.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				is.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				bis.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				bos.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	public static void main(String args[]) throws Exception {
		zip("D:\\Temp\\imgin\\");
		unzip("D:\\Temp\\docin\\1.zip");
	}
}