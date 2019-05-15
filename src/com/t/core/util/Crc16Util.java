package com.t.core.util;

import java.math.BigInteger;

public class Crc16Util {

	/**
	 * 计算CRC16校验码
	 * @param bytes 字节数组
	 * @return {@link String} 校验码
	 * @since 1.0
	 */
	public static String getCRC(byte[] bytes) {
		int CRC = 0x0000ffff;
		int POLYNOMIAL = 0x0000a001;
		int i, j;
		for (i = 0; i < bytes.length; i++) {
			CRC ^= ((int) bytes[i] & 0x000000ff);
			for (j = 0; j < 8; j++) {
				if ((CRC & 0x00000001) != 0) {
					CRC >>= 1;
					CRC ^= POLYNOMIAL;
				} else {
					CRC >>= 1;
				}
			}
		}
		return Integer.toHexString(CRC);
	}

	/**
	 * 将16进制单精度浮点型转换为10进制浮点型
	 * @return float
	 * @since 1.0
	 */
	@SuppressWarnings("unused")
	private float parseHex2Float(String hexStr) {
		BigInteger bigInteger = new BigInteger(hexStr, 16);
		return Float.intBitsToFloat(bigInteger.intValue());
	}

	/**
	 * 将十进制浮点型转换为十六进制浮点型
	 * @return String
	 * @since 1.0
	 */
	@SuppressWarnings("unused")
	private String parseFloat2Hex(float data) {
		return Integer.toHexString(Float.floatToIntBits(data));
	}

	public static void main(String[] args) {
		byte[] bytes = new byte[] { 0x21, 0x21, 0x66, 0x02, 0x00, 0x13, (byte) 0xc0, (byte) 0xa8, 0x00, (byte) 0x08,
				0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, (byte) 0x88, (byte) 0x99, (byte) 0xaa, (byte) 0xbb,
				(byte) 0xcc, (byte) 0xdd, (byte) 0xee, (byte) 0xff };
		String cc = getCRC(bytes);
		System.out.println(cc);
	}
}
