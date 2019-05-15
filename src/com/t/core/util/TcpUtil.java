package com.t.core.util;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.UnknownHostException;

public class TcpUtil {

	/**
	 * TCP发送消息
	 * @param host 主机
	 * @param port 端口
	 * @param message 消息
	 * @return boolean
	 */
	public static boolean sendMessage(String host, int port, String message) {
		Socket s = null;
		OutputStream os = null;
		DataOutputStream dos = null;
		boolean flag = true;
		try {
			SocketAddress address = new InetSocketAddress(host, port);
			s = new Socket();
			s.connect(address, 1000);
			os = s.getOutputStream();
			dos = new DataOutputStream(os);
			dos.write(message.getBytes());
			dos.flush();
		} catch (UnknownHostException e) {
			flag = false;
			e.printStackTrace();
		} catch (IOException e) {
			flag = false;
			e.printStackTrace();
		} finally {
			try {
				dos.close();
			} catch (Exception e) {
			}
			try {
				os.close();
			} catch (Exception e) {
			}
			try {
				s.close();
			} catch (Exception e) {
			}
		}
		return flag;
	}

	/**
	 * TCP发送消息
	 * @param host 主机
	 * @param port 端口
	 * @param bytes 字节
	 * @return boolean
	 */
	public static boolean sendMessage(String host, int port, byte[] bytes) {
		Socket s = null;
		OutputStream os = null;
		DataOutputStream dos = null;
		boolean flag = true;
		try {
			SocketAddress address = new InetSocketAddress(host, port);
			s = new Socket();
			s.connect(address, 1000);
			os = s.getOutputStream();
			dos = new DataOutputStream(os);
			dos.write(bytes);
			dos.flush();
		} catch (UnknownHostException e) {
			flag = false;
			e.printStackTrace();
		} catch (IOException e) {
			flag = false;
			e.printStackTrace();
		} finally {
			try {
				dos.close();
			} catch (Exception e) {
			}
			try {
				os.close();
			} catch (Exception e) {
			}
			try {
				s.close();
			} catch (Exception e) {
			}
		}
		return flag;
	}
}
