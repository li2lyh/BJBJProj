package com.bjbj.bookclub;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/club")
@Controller
public class BookclubController {
@Autowired
private BookclubService service;
@Autowired
private HttpSession session;

	@RequestMapping(value = "/toClub") // 클럽리스트 요청
	public String toClub(Model model) throws Exception{
		List<BookclubDTO> list = service.selectList();
		
		for(BookclubDTO dto : list) {  //날짜 형식 format( MM월 dd일 )
			//System.out.println("open_date : " + dto.getOpen_date());
			
			dto.setOpen_date( service.getStrDate(dto.getOpen_date()) );
			dto.setClose_date( service.getStrDate(dto.getClose_date()) );
		}
		
		System.out.println("list : " + list.toString());
		model.addAttribute("list", list);

		return "/bookclub/findclub";
	}

	@RequestMapping(value="/toWrite") // 모집글쓰기 요청
	public String write()throws Exception{
		return "bookclub/write";
	}
	
	@RequestMapping(value="/write") // 글쓰기 등록 시
	public String toWrite(BookclubDTO dto)throws Exception{
		System.out.println("room_title : " + dto.getRoom_title());
		System.out.println("place : " + dto.getPlace()); //radio 버튼
		System.out.println("tag : " + dto.getTag()); // select바
		System.out.println("meet_week : " + dto.getMeet_week()); //select바
		System.out.println("시작 날짜 : " + dto.getOpen_date()); //datePicker
		System.out.println("종료 날짜 : " + dto.getClose_date()); //datePicker
		
		// loginSession 에서 email 받아와서 다시 작성
		RoleDTO roleDto = new RoleDTO("rkdgnlsla@naver.com", 0 , "L");
		service.insert(dto, roleDto);
		
		return "redirect:/club/toClub";
	}
	
	@RequestMapping(value="/detailView") // 상세페이지 요청 시
	public String detailView(int room_id, Model model) throws Exception{
		System.out.println("room_id : " + room_id);
		BookclubDTO dto = service.selectOne(room_id);
			
		dto.setOpen_date( service.getStrDate(dto.getOpen_date()) );
		dto.setClose_date( service.getStrDate(dto.getClose_date()) );
		
		model.addAttribute("dto", dto);
		
		// 로그인세션 필요
		
		// 모집글은 계정당 한개의 모집글만 올릴 수 있음
		// 해당 계정의 role테이블 데이터, loginSession, bookroom 테이블 데이터 필요
		RoleDTO role = service.selectRole("hwi9201@naver.com");
		System.out.println("role : " + role.getRole());
		model.addAttribute("role",role);
		
		return "/bookclub/detailView";
	}
	
		// 클럽에 지원하기 요청
		@RequestMapping(value = "/recruit")
		public String recruit(String mydesc)throws Exception{
			System.out.println("자기소개 : " + mydesc);
			
			
			
			return "redirect:/club/toClub";
		}

}
