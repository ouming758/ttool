package com.t.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUtil {

	/**
	 * 上传文件
	 * @param host FTP服务器地址
	 * @param port FTP服务器端口
	 * @param username FTP登录账号
	 * @param password FTP登录密码
	 * @param remotedir FTP服务器保存目录
	 * @param filename 上传到FTP服务器上的文件名
	 * @param input 输入流
	 * @return 成功返回true，否则返回false
	 */
	public static boolean uploadFile(String host, int port, String username, String password, String remotedir,
			String filename, InputStream input) {
		boolean success = false;
		boolean isCreateDirSuccess = createDirecroty(host, port, username, password, remotedir);
		if (isCreateDirSuccess) {
			FTPClient ftp = new FTPClient();
			try {
				int reply;
				ftp.connect(host, port);
				ftp.login(username, password);
				ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
				reply = ftp.getReplyCode();
				if (!FTPReply.isPositiveCompletion(reply)) {
					ftp.disconnect();
					return success;
				}
				ftp.changeWorkingDirectory(remotedir);
				// ftp.storeFile(filename, input);
				ftp.appendFile(filename, input);
				input.close();
				ftp.logout();
				success = true;
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (ftp.isConnected()) {
					try {
						ftp.disconnect();
					} catch (IOException ioe) {
					}
				}
			}
		}
		return success;
	}

	/**
	 * 下载文件
	 * @param host FTP服务器地址
	 * @param port FTP服务器端口
	 * @param username FTP登录账号
	 * @param password FTP登录密码
	 * @param remotePath FTP服务器上的相对路径
	 * @param fileName 要下载的文件名
	 * @param localPath 下载后保存到本地的路径
	 * @return
	 */
	public static boolean downFile(String host, int port, String username, String password, String remotePath,
			String fileName, String localPath) {
		boolean success = false;
		boolean isFileExits = false;
		FTPClient ftp = new FTPClient();
		try {
			int reply;
			ftp.connect(host, port);
			ftp.login(username, password);
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				return success;
			}
			// 转移到FTP服务器目录
			ftp.changeWorkingDirectory(remotePath);
			FTPFile[] fs = ftp.listFiles();
			for (FTPFile ff : fs) {
				if (ff.getName().equals(fileName)) {
					isFileExits = true;
					File localFile = new File(localPath + "/" + ff.getName());
					OutputStream is = new FileOutputStream(localFile);
					ftp.retrieveFile(ff.getName(), is);
					is.close();
				}
			}
			if (!isFileExits) {
				throw new RuntimeException("要下载的文件不存在！");
			}
			ftp.logout();
			success = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException ioe) {
				}
			}
		}
		return success;
	}

	/**
	 * 查询指定路径所有文件
	 * @param host FTP服务器地址
	 * @param port FTP服务器端口
	 * @param username FTP登录账号
	 * @param password FTP登录密码
	 * @param remotePath FTP服务器上的相对路径
	 * @return
	 */
	public static List<String> listFTPFiles(String host, int port, String username, String password, String remotePath) {
		ArrayList<String> resultList = new ArrayList<String>();
		FTPClient ftp = new FTPClient();
		try {
			int reply;
			ftp.connect(host, port);
			ftp.login(username, password);
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				return resultList;
			}
			ftp.changeWorkingDirectory(remotePath);// 转移到FTP服务器目录
			FTPFile[] fs = ftp.listFiles();
			for (FTPFile ff : fs) {
				resultList.add(ff.getName());
				// if (ff.getName().equals(fileName)) {
				// File localFile = new File(localPath + "/" + ff.getName());
				// OutputStream is = new FileOutputStream(localFile);
				// ftp.retrieveFile(ff.getName(), is);
				// is.close();
				// }
			}
			ftp.logout();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException ioe) {
				}
			}
		}
		return resultList;
	}

	/**
	 * 创建多层目录文件，如果有ftp服务器已存在该文件，则不创建，如果无，则创建
	 * @param host FTP服务器地址
	 * @param port FTP服务器端口
	 * @param username FTP登录账号
	 * @param password FTP登录密码
	 * @param remotedir
	 * @return
	 * @throws IOException
	 */
	public static boolean createDirecroty(String host, int port, String username, String password, String remotedir) {
		boolean success = false;
		try {
			FTPClient ftp = new FTPClient();
			int reply;
			ftp.connect(host, port);
			ftp.login(username, password);
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
			}
			ftp.changeWorkingDirectory("/var/www/html");// 转移到FTP服务器目录
			String directory = remotedir + "/";
			// String directory = remote.substring(0, remote.lastIndexOf("/") +
			// 1);
			// 如果远程目录不存在，则递归创建远程服务器目录
			if (!directory.equalsIgnoreCase("/") && !changeWorkingDirectory(new String(directory), ftp)) {
				int start = 0;
				int end = 0;
				if (directory.startsWith("/")) {
					start = 1;
				} else {
					start = 0;
				}
				end = directory.indexOf("/", start);
				String path = "";
				String paths = "";
				while (true) {

					String subDirectory = new String(remotedir.substring(start, end).getBytes("GBK"), "iso-8859-1");
					path = path + "/" + subDirectory;
					if (!existFile(path, ftp)) {
						if (makeDirectory(subDirectory, ftp)) {
							changeWorkingDirectory(subDirectory, ftp);
						} else {
							System.out.println("创建目录[" + subDirectory + "]失败");
							changeWorkingDirectory(subDirectory, ftp);
						}
					} else {
						changeWorkingDirectory(subDirectory, ftp);
					}

					paths = paths + "/" + subDirectory;
					start = end + 1;
					end = directory.indexOf("/", start);
					// 检查所有目录是否创建完毕
					if (end <= start) {
						break;
					}
				}
			}
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	/**
	 * 改变目录路径
	 * @param directory
	 * @param ftp
	 * @return
	 * @date 创建时间：2017年6月22日 上午11:52:13
	 */
	public static boolean changeWorkingDirectory(String directory, FTPClient ftp) {
		boolean flag = true;
		try {
			flag = ftp.changeWorkingDirectory(directory);
			if (flag) {
				System.out.println("进入文件夹" + directory + " 成功！");
			} else {
				System.out.println("进入文件夹" + directory + " 失败！");
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		return flag;
	}

	/**
	 * 创建目录
	 * @param dir
	 * @param ftp
	 * @return
	 * @date 创建时间：2017年6月22日 上午11:52:40
	 */
	public static boolean makeDirectory(String dir, FTPClient ftp) {
		boolean flag = true;
		try {
			flag = ftp.makeDirectory(dir);
			if (flag) {
				System.out.println("创建文件夹" + dir + " 成功！");
			} else {
				System.out.println("创建文件夹" + dir + " 失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 判断ftp服务器文件是否存在
	 * @param path
	 * @param ftp
	 * @return
	 * @throws IOException
	 */
	public static boolean existFile(String path, FTPClient ftp) throws IOException {
		boolean flag = false;
		FTPFile[] ftpFileArr = ftp.listFiles(path);
		if (ftpFileArr.length > 0) {
			flag = true;
		}
		return flag;
	}

	public static void main(String[] args) {
		try {
			uploadFile("192.168.1.8", 21, "administrator", "xz68818588", "test/1", "1.jpg", new FileInputStream(
					new File("d:\\temp\\1.jpg")));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}