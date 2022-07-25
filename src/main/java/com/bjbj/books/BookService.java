package com.bjbj.books;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	@Autowired
	private LikeBookDAO dao;
	
	
	private String ttbkey = "ttbstardust31042148001";
	
	// 상품검색 API
	public String searchBookByKeyword(String keyword, String searchType) throws Exception {
		// StringBuilder를 사용해 알라딘 API에 요청으로 보내줄 URI 구성
		StringBuilder baseURI = new StringBuilder("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx");
		baseURI.append("?" + URLEncoder.encode("ttbkey","UTF-8") + "=" + ttbkey); // api 키
		baseURI.append("&" + URLEncoder.encode("Query","UTF-8") + "=" + keyword); // 검색할 키워드
		baseURI.append("&" + URLEncoder.encode("QueryType","UTF-8") + "=" + searchType); // 가져올 데이터 종류
		baseURI.append("&" + URLEncoder.encode("MaxResults","UTF-8") + "=10");
		baseURI.append("&" + URLEncoder.encode("start","UTF-8") + "=1");
		baseURI.append("&" + URLEncoder.encode("SearchTarget","UTF-8") + "=Book");
		baseURI.append("&" + URLEncoder.encode("output","UTF-8") + "=js"); // xml, js(json 중에서 선택)
		baseURI.append("&" + URLEncoder.encode("Version","UTF-8") + "=20131101");
		
		URL url = new URL(baseURI.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
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
	
	// 상품리스트 API
	public String getBookList(String queryType, String category) throws Exception {
		
		// StringBuilder를 사용해 알라딘 API에 요청으로 보내줄 URI 구성
		StringBuilder baseURI = new StringBuilder("http://www.aladin.co.kr/ttb/api/ItemList.aspx");
		// 필수 입력값
		baseURI.append("?" + URLEncoder.encode("ttbkey","UTF-8") + "=" + ttbkey); // api 키
		baseURI.append("&" + URLEncoder.encode("QueryType","UTF-8") + "=" + queryType); // 가져올 데이터 종류
		
		// 옵션 입력값
		baseURI.append("&" + URLEncoder.encode("MaxResults","UTF-8") + "=50"); // 검색결과 한페이지당 최대 출력 개수
		baseURI.append("&" + URLEncoder.encode("start","UTF-8") + "=1"); // 검색결과 시작페이지
		baseURI.append("&" + URLEncoder.encode("SearchTarget","UTF-8") + "=Book"); // 도서만 검색
		baseURI.append("&" + URLEncoder.encode("CategoryId","UTF-8") + "=" + category);
		baseURI.append("&" + URLEncoder.encode("Cover","UTF-8") + "=MidBig");
		baseURI.append("&" + URLEncoder.encode("output","UTF-8") + "=js"); // xml, js(json 중에서 선택)
		baseURI.append("&" + URLEncoder.encode("Version","UTF-8") + "=20131101");
		
		URL url = new URL(baseURI.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
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

	// 도서 찜하기
	public int addLikeBook(LikeBookDTO dto) throws Exception {
		return dao.addLikeBook(dto);
	}
	
	public int removeLikeBook(String email, String book_isbn) throws Exception {
		return dao.removeLikeBook(email, book_isbn);
	}
	
}
