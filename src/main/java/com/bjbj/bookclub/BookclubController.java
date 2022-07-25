package com.bjbj.bookclub;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.member.MemberDTO;
import com.bjbj.member.MemberService;

@RequestMapping(value = "/club")
@Controller
public class BookclubController {
	@Autowired
	private BookclubService service;
	@Autowired
	private MemberService memberService;

	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/toClub") // 클럽리스트 요청
	public String toClub(Model model) throws Exception {
		List<BookclubDTO> list = service.selectList();

		for (BookclubDTO dto : list) { // 날짜 형식 format( MM월 dd일 )
			// System.out.println("open_date : " + dto.getOpen_date());

			dto.setOpen_date(service.getStrDate(dto.getOpen_date()));
			dto.setClose_date(service.getStrDate(dto.getClose_date()));
		}

		System.out.println("list : " + list.toString());
		model.addAttribute("list", list);

		String email =((MemberDTO)(session.getAttribute("loginSession"))).getEmail();
		// 현재 본인이 참여중인 클럽 room_id 포함 정보 구하기 (by email)
		RoleDTO roleDTO = service.selectRole(email);
		model.addAttribute("role", roleDTO);
		
		return "/bookclub/findclub";
	}

	@RequestMapping(value = "/toWrite") // 모집글쓰기 요청
	public String write() throws Exception {
		return "bookclub/write";
	}

	@RequestMapping(value = "/write") // 글쓰기 등록 시
	public String toWrite(BookclubDTO dto) throws Exception {
		System.out.println("room_title : " + dto.getRoom_title());
		System.out.println("place : " + dto.getPlace()); // radio 버튼
		System.out.println("tag : " + dto.getTag()); // select바
		System.out.println("meet_week : " + dto.getMeet_week()); // select바
		System.out.println("시작 날짜 : " + dto.getOpen_date()); // datePicker
		System.out.println("종료 날짜 : " + dto.getClose_date()); // datePicker

		
		String email = ((MemberDTO)session.getAttribute("loginSession")).getEmail();
		RoleDTO roleDto = new RoleDTO(email, 0, "L");
		service.insert(dto, roleDto);

		return "redirect:/club/toClub";
	}

	@RequestMapping(value = "/detailView") // 상세페이지 요청 시
	public String detailView(int room_id, Model model) throws Exception {
		System.out.println("room_id : " + room_id);
		BookclubDTO dto = service.selectOne(room_id);

		dto.setOpen_date(service.getStrDate(dto.getOpen_date()));
		dto.setClose_date(service.getStrDate(dto.getClose_date()));

		model.addAttribute("dto", dto);

		String email = ((MemberDTO)session.getAttribute("loginSession")).getEmail();

		// 모집글은 계정당 한개의 모집글만 올릴 수 있음
		// 해당 계정의 role테이블 데이터, loginSession, bookroom 테이블 데이터 필요
		RoleDTO role = service.selectRole(email);
		model.addAttribute("role", role);

		return "/bookclub/detailView";
	}

	// 클럽에 지원하기 요청
	@RequestMapping(value = "/recruit")
	public String recruit(String mydesc, int room_id) throws Exception {
		System.out.println("자기소개 : " + mydesc);
		System.out.println("지원할 room_id : " + room_id);

		String email = ((MemberDTO)session.getAttribute("loginSession")).getEmail();

		service.updateMydesc(email, mydesc); // 자기소개 업데이트
		service.insertWaiting(new WaitingDTO(room_id, email, null)); // waiting테이블 데이터 삽입

		return "redirect:/club/toClub";
	}

	// 클럽 지원 시 다른 클럽에 지원했는지 여부
	/*
	 * public String ???{ // 한번에 한 모임에만 신청 가능 WaitingDTO waitingDto =
	 * service.selectByEmail("kgh9201@gmail.com"); if(waitingDto != null) { return
	 * false; } return true; }
	 */

	// 클럽 상세페이지 이동(리더만 이용가능)
	@RequestMapping(value = "/myclub")
	public String myclub(int room_id, Model model) throws Exception {
		System.out.println("room_id(리더페이지) = " + room_id);
		// 해당 모임 정보
		BookclubDTO dto = service.selectOne(room_id);
		dto.setOpen_date(service.getStrDate(dto.getOpen_date()));
		dto.setClose_date(service.getStrDate(dto.getClose_date()));
		model.addAttribute("dto", dto);

		// 지원 인원 정보
		List<String> waitingList = service.selectByRoom(room_id);
		List<MemberDTO> list = new ArrayList<>();

		for (String email : waitingList) {
			// System.out.println("넘어갈 email : " + email);
			// System.out.println("selectByEmail : " + memberService.selectByEmail(email));
			list.add(memberService.selectByEmail(email));

		}
		// System.out.println("list : " + list.toString());
		model.addAttribute("list", list);

		return "/bookclub/myclub";
	}

	// 지원하기 승인 여부
	@RequestMapping(value = "/approve")
	@ResponseBody
	public String approve(String email, String approve, int room_id) throws Exception {

		if (approve.equals("Y")) { // 승인 시

			System.out.println("email : " + email);

			// 해당 room에 정원 여유가 있는지 여부 (없으면 return false)
			int current = service.selectOne(room_id).getRoom_current(); // 현재 인원
			int people = service.selectOne(room_id).getRoom_people(); // 최대 인원
			System.out.println("현재인원(전) : " + current);
			System.out.println("최대인원(전) : " + people);

			if (current >= people) {
				return "false";
			} else {

				// role 테이블에 해당 유저 일반모임원 직급으로 등록
				RoleDTO role = new RoleDTO(email, room_id, "C"); // C : 일반 모임원
				service.insertRole(role);
				// waiting테이블에서 해당 email에 해당하는 데이터 삭제
				service.deleteByEmail(email);

				// 해당 room에 현재인원 + 1
				service.updateCurrent(room_id);

				// 인원 추가 후 현재 인원 수 확인 (최대인원과 같으면 바로 해당 모임의 clubBoard.jsp로)
				current = service.selectOne(room_id).getRoom_current(); // 추가 후 현재 인원
				people = service.selectOne(room_id).getRoom_people(); // 최대 인원
				System.out.println("현재인원(후) : " + current);
				System.out.println("최대인원(후) : " + people);

				if (current == people) {
					service.updateStatus("진행중", room_id);
					return "go";
				}
			}
			return "true";

		} else if (approve.equals("N")) { // 거절 시

			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/clubBoard") // 내모임게시판
	public String clubBoard(Model model) throws Exception {
		// 로그인 된 유저 정보
		 MemberDTO loginSession =(MemberDTO)session.getAttribute("loginSession");
		 model.addAttribute("session", loginSession);
		
		 String id = ((MemberDTO)session.getAttribute("loginSession")).getEmail();
		 
		 int room_id = service.selectRole(id).getRoom_id();
		 
		// 해당 방 정보
		BookclubDTO clubDto = service.selectOne(room_id);
		clubDto.setOpen_date(service.getStrDate(clubDto.getOpen_date()));
		clubDto.setClose_date(service.getStrDate(clubDto.getClose_date()));
		model.addAttribute("dto", clubDto);
		
		// 해당 방의 멤버 정보
		List<RoleDTO> roleList =  service.selectRoleByRoom(room_id);
		System.out.println("방 멤버 : " + roleList.toString());
		model.addAttribute("member",roleList);
		
		// 현재 접속한 계정이 리더인가?
		String role = service.selectRole(id).getRole();
		System.out.println("해당 계정 역할 :" + role);
		model.addAttribute("role", role);
		
		// 해당 방의 게시판 정보
		List<BoardDTO> boardList = service.selectAllBoardById(room_id);
		for (BoardDTO boardDTO : boardList) { // 날짜 형식 format
			boardDTO.setBoard_date(service.getStrDate(boardDTO.getBoard_date()));
		}
		
		model.addAttribute("board", boardList);
		// 해당 방의 캘린더 정보
		
		return "/bookclub/clubBoard";
	}

	@RequestMapping(value = "/writeBoard") //내 클럽게시판에서 글쓰기 완료
	@ResponseBody
	public List<BoardDTO> writeBoard(BoardDTO dto, int room_id) throws Exception{
		MemberDTO loginSession = (MemberDTO)session.getAttribute("loginSession");
		
		dto.setRoom_id(room_id);
		dto.setEmail(loginSession.getEmail());
		dto.setNickname(loginSession.getNickname());
		service.insertBoard(dto);
		
		
		// List<boardDTO> 출력
		List<BoardDTO> list = service.selectAllBoard();
		for (BoardDTO boardDTO : list) { // 날짜 형식 format
			boardDTO.setBoard_date(service.getStrDate(boardDTO.getBoard_date()));
		}
		
		return list;
	}
	
	@RequestMapping(value = "/modify") // 게시글 수정
	public String modify(BoardDTO dto)throws Exception{
		System.out.println("board_seq : " + dto.getBoard_seq());
		System.out.println("title : " + dto.getBoard_title());
		System.out.println("content : " + dto.getBoard_content());
		
		service.updateBoard(dto);

		return "redirect:/club/clubBoard";
	}
	
	@RequestMapping(value = "/delete") // 게시글 삭제
	@ResponseBody
	public List<BoardDTO> delete(int board_seq) throws Exception{
		
		System.out.println("target no : " + board_seq);
		service.deleteBoard(board_seq);
		
		// List<boardDTO> 출력
		List<BoardDTO> list = service.selectAllBoard();
		for (BoardDTO boardDTO : list) { // 날짜 형식 format
			boardDTO.setBoard_date(service.getStrDate(boardDTO.getBoard_date()));
		}
				
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
}
