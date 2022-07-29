package com.bjbj.library;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class LibraryService {
	
	private String serviceKey = "Ly5i4UOb2ovLXliG3aY51YEMRtW%2BkvnnSTQLnyNQ2wNRshOOh%2FqVxAlFy8UCOD23iU%2FrSbj69rgVSiC7hxuEsw%3D%3D";

	// 현재 지역명을 통해 주변 도서관 주소들을 조회
	public String getAllLibrary(String ctprvn, String sigungu) throws Exception {
		StringBuilder baseURI = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_lbrry_api"); /*URL*/
		baseURI.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
		baseURI.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		baseURI.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		baseURI.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
		
		baseURI.append("&" + URLEncoder.encode("CTPRVN_NM","UTF-8") + "=" + URLEncoder.encode(ctprvn, "UTF-8")); /*시도명*/
		baseURI.append("&" + URLEncoder.encode("SIGNGU_NM","UTF-8") + "=" + URLEncoder.encode(sigungu, "UTF-8")); /*시군구명*/
		
		System.out.println(baseURI);
		
		URL url = new URL(baseURI.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
		    sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}

}
