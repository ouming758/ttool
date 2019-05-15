package com.t.core.util;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class UdpUtil {

	/**
	 * UDP发送消息
	 * @param host 主机
	 * @param port 端口
	 * @param message 消息
	 */
	public static void sendMessage(String host, int port, String message) {
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket();
			byte[] buffer = message.getBytes();
			DatagramPacket packet = new DatagramPacket(buffer, buffer.length, InetAddress.getByName(host), port);
			socket.send(packet);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			socket.close();
		}
	}

	/**
	 * UDP发送消息
	 * @param host 主机
	 * @param port 端口
	 * @param message 消息
	 * @param charset 编码
	 */
	public static void sendMessage(String host, int port, String message, String charset) {
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket();
			byte[] buffer = message.getBytes(charset);
			DatagramPacket packet = new DatagramPacket(buffer, buffer.length, InetAddress.getByName(host), port);
			socket.send(packet);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			socket.close();
		}
	}

	/**
	 * UDP发送消息
	 * @param host 主机
	 * @param port 端口
	 * @param buffer void
	 */
	public static void sendMessage(String host, int port, byte[] buffer) {
		DatagramSocket socket = null;
		try {
			socket = new DatagramSocket();
			DatagramPacket packet = new DatagramPacket(buffer, buffer.length, InetAddress.getByName(host), port);
			socket.send(packet);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			socket.close();
		}
	}

}
