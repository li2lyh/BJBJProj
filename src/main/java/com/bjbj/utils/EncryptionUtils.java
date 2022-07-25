package com.bjbj.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class EncryptionUtils {
	public static String getSHA512(String pw) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.reset();
		md.update(pw.getBytes("utf8"));
		BigInteger bI = new BigInteger(1, md.digest());
		pw = String.format("%0128x", bI);
		return pw;
	}
}
