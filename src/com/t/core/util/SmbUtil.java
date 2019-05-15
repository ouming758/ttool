package com.t.core.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileInputStream;
import jcifs.smb.SmbFileOutputStream;

public class SmbUtil {

	/**
	 * 从局域网中共享文件夹下载文件
	 * @param remoteFilePath 共享电脑路径
	 *            如：smb//administrator:123456@172.16.10.136/smb/1221.zip ,
	 *            smb为共享文件 注：如果一直出现连接不上，有提示报错，并且错误信息是 用户名活密码错误 则修改共享机器的文件夹选项 查看
	 *            去掉共享简单文件夹的对勾即可。
	 * @param localDir 本地文件夹
	 * @param newFileName 保存文件的名称，若为空则使用源文件名称
	 */
	public static void smbGet(String remoteFilePath, String localDir, String newFileName) {
		InputStream in = null;
		OutputStream out = null;
		try {
			SmbFile smbFile = new SmbFile(remoteFilePath);
			String fileName = smbFile.getName();
			if (!newFileName.equals("")) {
				fileName = newFileName;
			}
			File localFile = new File(localDir + File.separator + fileName);
			in = new BufferedInputStream(new SmbFileInputStream(smbFile));
			out = new BufferedOutputStream(new FileOutputStream(localFile));
			byte[] buffer = new byte[1024];
			while ((in.read(buffer)) != -1) {
				out.write(buffer);
				buffer = new byte[1024];
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 上传文件到局域网中共享文件夹
	 * @param remoteDir 共享文件夹 如：smb//administrator:123456@172.16.10.136/smb
	 * @param newFileName 保存文件的名称，若为空则使用源文件名称
	 * @param localFilePath 本地文件路径
	 */
	public static void smbPut(String remoteDir, String localFilePath, String newFileName) {
		InputStream in = null;
		OutputStream out = null;
		try {
			File localFile = new File(localFilePath);
			String fileName = localFile.getName();
			if (!newFileName.equals("")) {
				fileName = newFileName;
			}
			SmbFile remoteFile = new SmbFile(remoteDir + "/" + fileName);
			in = new BufferedInputStream(new FileInputStream(localFile));
			out = new BufferedOutputStream(new SmbFileOutputStream(remoteFile));
			byte[] buffer = new byte[1024];
			while ((in.read(buffer)) != -1) {
				out.write(buffer);
				buffer = new byte[1024];
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		smbPut("smb://administrator:xz68818588@192.168.1.8/temp", "d:/temp/1.jpg", "");
		smbGet("smb://administrator:xz68818588@192.168.1.8/temp/1.zip", "D:/temp", "");
	}
}
