package com.bjbj.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.bookclub.BookclubService;
import com.bjbj.books.BookService;
import com.bjbj.books.LikeBookDTO;
import com.bjbj.letter.LetterDTO;
import com.bjbj.letter.LetterService;
import com.bjbj.review.ReviewDTO;
import com.bjbj.review.ReviewService;
import com.bjbj.utils.EncryptionUtils;
import com.bjbj.utils.Pagination;
import com.bjbj.utils.Pagination2;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService Mservice;
	@Autowired
	private BookclubService Bservice;
	@Autowired
	private ReviewService Rservice;
	@Autowired
	private LetterService Lservice;
	@Autowired
	private BookService LBservice;
	@Autowired
	private HttpSession session;

	/* ************ 로그인 ************ */

	// 일반 로그인 
	@ResponseBody
	@RequestMapping(value = "/login")
	public String login(String email, String password) throws Exception {
		MemberDTO dto = Mservice.checkBlack(email); //블랙리스트 확인
		if (dto != null) { // 블랙리스트 O
			return "blackList";
		} else { // 블랙리스트 X
			dto = Mservice.login(email, password);
			if (dto != null) {
				session.setAttribute("loginSession", dto);
				System.out.println(((MemberDTO) session.getAttribute("loginSession")).toString());
				return "success";
			} else {
				return "fail";
			}
		}
	}
	
	// 카카오 로그인
	@ResponseBody
	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(String email) throws Exception {
		MemberDTO dto = Mservice.kakaoLogin(email);
		if (dto != null) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO) session.getAttribute("loginSession")).toString());
			return "success";
		} else {
			return "fail";
		}

	}

	
	/* ************ 로그아웃 ************ */
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout() {
		session.removeAttribute("loginSession");
		return "redirect: / ";
	}

	
	/* ************ 회원가입 ************ */

	// 회원가입 페이지
	@RequestMapping(value = "/toSignUp")
	public String toSignUp() {
		System.out.println("도착");
		return "/member/signup";
	}

	// 회원가입 요청
	@RequestMapping(value = "/signUp")
	public String signUp(MemberDTO dto) throws Exception {
		System.out.println(dto.toString());
		Mservice.signUp(dto);
		return "redirect:/";
	}


	// 카카오 회원가입 페이지
	@RequestMapping(value = "/toKakaoSignUp")
	public String toKakaoSignUp(String email,String phone, Model model) {
		System.out.println("도착");
		model.addAttribute("email", email);
		model.addAttribute("phone", phone);
		return "/member/signup-kakao";
	}
	
	// 카카오 회원가입 요청
	@RequestMapping(value = "/kakaoSignUp")
	public String kakaoSingUp(MemberDTO dto) throws Exception{
		System.out.println("카카오 회원가입 요청");
		if(dto.getPassword() == "") {
			String ranPw = Mservice.makePw(dto.getEmail());
			dto.setPassword(ranPw);
		}
		System.out.println(dto.toString());
		Mservice.signUp(dto);
		return "redirect:/";
	}


	// 이메일 중복 확인
	@RequestMapping(value = "/confirmEmail")
	@ResponseBody
	public String confirmEmail(String email) throws Exception {
		// checkEmail이 false를 반환하면 사용가능 email
		if (!Mservice.confirmEmail(email))
			return "available";
		// checkEmail이 true를 반환하면 중복 email
		else
			return "unavailable";
	}

	// 닉네임 중복 확인
	@RequestMapping(value = "/confirmNickname")
	@ResponseBody
	public String confirmNickname(String nickname) throws Exception {
		if (!Mservice.confirmNickname(nickname))
			return "available";
		else
			return "unavailable";
	}

	// VerifyPhoneNumber _ 휴대폰 본인인증
	@RequestMapping(value = "/phoneCheck")
	public String sendSMS(String phone) { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		Mservice.certifiedPhoneNumber(phone, randomNumber);

		return Integer.toString(randomNumber);
	}

	/* ************ 아이디, 비밀번호 찾기 ************ */

	// 아이디,비밀번호찾기 페이지 요청
	@RequestMapping(value = "/toFindInfo")
	public String toFindInfo() {
		System.out.println("도착");
		return "/member/find-pw";
	}

	// 아이디 찾기(email)
	@ResponseBody
	@RequestMapping(value = "/searchEmail")
	public MemberDTO searchEamil(String name, String phone) throws Exception {

		System.out.println("이메일을 찾아볼까?");

		MemberDTO dto = Mservice.searchEmail(name, phone);
		return dto;
		}
	
	
	// 비밀번호 찾기시 이메일 찾기
	@ResponseBody
	@RequestMapping(value = "/searchPw")
	public MemberDTO searchPw(String email) throws Exception{
		System.out.println(email);
		MemberDTO dto = Mservice.selectByEmail(email);
		System.out.println(dto);
		return dto;
	}
	
	

	/* ************ 마이페이지 ************ */

	// 마이페이지 페이지 요청
	@RequestMapping(value = "/toMyinfo")
	public String toMyinfo(Model model) throws Exception {
		// 참여 독서 모임
		List<BookclubDTO> BookclubList = Bservice
				.selectLately(((MemberDTO) session.getAttribute("loginSession")).getEmail());
		model.addAttribute("BookclubList", BookclubList);

		for (BookclubDTO dto : BookclubList) {
			dto.setOpen_date(Bservice.getDate(dto.getOpen_date()));
			dto.setClose_date(Bservice.getDate(dto.getClose_date()));
		}

		// 도서 리뷰
		List<ReviewDTO> ReviewList = Rservice
				.selectLately(((MemberDTO) session.getAttribute("loginSession")).getEmail());
		model.addAttribute("ReviewList", ReviewList);

		// 찜 도서
		List<LikeBookDTO> LikeBooklist = LBservice
				.likeBook(((MemberDTO) session.getAttribute("loginSession")).getEmail());
		model.addAttribute("LikeBooklist", LikeBooklist);

		// 찜 독서 모임
		List<BookclubDTO> LikeclubList = Bservice
				.likeClub(((MemberDTO) session.getAttribute("loginSession")).getEmail());
		model.addAttribute("LikeclubList", LikeclubList);

		for (BookclubDTO dto : LikeclubList) {
			dto.setRecruit_end(Bservice.getDate(dto.getRecruit_end()));
			dto.setOpen_date(Bservice.getDate(dto.getOpen_date()));
			dto.setClose_date(Bservice.getDate(dto.getClose_date()));
		}
		return "/mypage/myinfo";
	}

	// 내 정보 수정 페이지 요청
	@RequestMapping(value = "/toChange")
	public String toChange(Model model) throws Exception {
		String email = ((MemberDTO) session.getAttribute("loginSession")).getEmail();
		MemberDTO dto = Mservice.selectByEmail(email);

		model.addAttribute("dto", dto);
		return "/mypage/change-myinfo";
	}

	// 내 정보 수정 페이지 요청
	@RequestMapping(value = "/toModify")
	public String toModify(Model model) throws Exception {
		String email = ((MemberDTO) session.getAttribute("loginSession")).getEmail();
		MemberDTO dto = Mservice.selectByEmail(email);

		model.addAttribute("dto", dto);
		return "/mypage/modifyInfo";
	}

	// 내 정보 수정 요청
	@RequestMapping(value = "/toModifyInfo")
	public String toModify(String email, String password, String nickname, String mydesc) throws Exception {
		System.out.println(email + " : " + password + " : " + nickname + " : " + mydesc);
		email = ((MemberDTO) session.getAttribute("loginSession")).getEmail();
		// pw 암호화
		password = EncryptionUtils.getSHA512(password);

		int rs = Mservice.updateInfo(email, password, nickname, mydesc);
		if (rs > 0) {
			System.out.println("수정 완료");
			System.out.println("암호화된 pw : " + password);
			return "redirect:/member/toMyinfo";

		}

		return null;
	}

	/* ************ 회원 탈퇴 ************ */
	@RequestMapping(value = "/toDelete")
	@ResponseBody
	public String toDelete(String email, String password) throws Exception {
		System.out.println(email + " : " + password);
		int rs = Mservice.delete(((MemberDTO) session.getAttribute("loginSession")).getEmail(), password);
		if (rs > 0) {
			session.invalidate();
			System.out.println("탈퇴 완료");
			return "success";
		} else {
			System.out.println("탈퇴 실패");
			return "fail";
		}
	}

	// 참여 독서 모임 페이지 요청
	@RequestMapping(value = "/toMybookclub")
	public String toMybookclub(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
		// 총 게시물 수
		int totalListCnt = Bservice.getCount(((MemberDTO) session.getAttribute("loginSession")).getEmail());

		// 생성인자로 총 게시물 수, 현재 페이지를 전달
		Pagination pagination = new Pagination(totalListCnt, page);

		// DB select start index
		int startIndex = pagination.getStartIndex();
		// 페이지 당 보여지는 게시글의 최대 개수
		int pageSize = page * pagination.getPageSize();

		List<BookclubDTO> list = Bservice.selectPage(startIndex, pageSize,
				((MemberDTO) session.getAttribute("loginSession")).getEmail());

		for (BookclubDTO dto : list) {
			dto.setOpen_date(Bservice.getDate(dto.getOpen_date()));
			dto.setClose_date(Bservice.getDate(dto.getClose_date()));
		}

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);

		return "/mypage/mybookclub";
	}

	// 도서 리뷰 페이지 요청
	@RequestMapping(value = "/toMyreview")
	public String toMyreview(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
		// 총 게시물 수
		int totalListCnt = Rservice.getCount(((MemberDTO) session.getAttribute("loginSession")).getEmail());

		// 생성인자로 총 게시물 수, 현재 페이지를 전달
		Pagination2 pagination = new Pagination2(totalListCnt, page);

		// DB select start index
		int startIndex = pagination.getStartIndex();
		// 페이지 당 보여지는 게시글의 최대 개수
		int pageSize = page * pagination.getPageSize();

		List<ReviewDTO> list = Rservice.selectPage(startIndex, pageSize,
				((MemberDTO) session.getAttribute("loginSession")).getEmail());

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		return "/mypage/myreview";
	}

	// 찜 도서 페이지 요청
	@RequestMapping(value = "/toLikebook")
	public String toLikebook() {
		return "/mypage/likebook";
	}

	// 찜 독서모임 페이지 요청
	@RequestMapping(value = "/toLikeclub")
	public String toLikeclub(Model model) throws Exception {
		List<BookclubDTO> list = Bservice.likeClub(((MemberDTO) session.getAttribute("loginSession")).getEmail());

		for (BookclubDTO dto : list) {
			dto.setRecruit_end(Bservice.getDate(dto.getRecruit_end()));
			dto.setOpen_date(Bservice.getDate(dto.getOpen_date()));
			dto.setClose_date(Bservice.getDate(dto.getClose_date()));
		}
		model.addAttribute("list", list);
		return "/mypage/likeclub";
	}

	// 찜 도서 삭제 요청
	@RequestMapping(value = "/toDeleteLikeBook")
	public String toDeleteLikeBook(String book_isbn) throws Exception {
		System.out.println("book_isbn : " + book_isbn);
		int rs = LBservice.deleteLikeBook(book_isbn);
		System.out.println("rs :" + rs);
		if (rs > 0) {
			System.out.println("삭제 완료");
			return "redirect:/member/toLikebook";
		}
		return null;
	}

	// 찜 독서모임 삭제 요청
	@RequestMapping(value = "/toDeleteLikeClub")
	@ResponseBody
	public String toDeleteLikeClub(@RequestParam(value = "no[]") int[] no) throws Exception {
		Bservice.deleteLikeClub(no);
		return "success";
	}

	// 쪽지함 페이지 요청
	@RequestMapping(value = "/toLetter")
	public String toLetter(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
		// 총 게시물 수
		int totalListCnt = Lservice.getCount(((MemberDTO) session.getAttribute("loginSession")).getEmail());

		// 생성인자로 총 게시물 수, 현재 페이지를 전달
		Pagination pagination = new Pagination(totalListCnt, page);

		// DB select start index
		int startIndex = pagination.getStartIndex();
		// 페이지 당 보여지는 게시글의 최대 개수
		int pageSize = page * pagination.getPageSize();
		List<LetterDTO> list = Lservice.selectPage(startIndex, pageSize,
				((MemberDTO) session.getAttribute("loginSession")).getEmail());

		for (LetterDTO dto : list) {
			dto.setWritten_date(Lservice.getDate(dto.getWritten_date()));
		}

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);

		return "/mypage/letter";
	}

	// 쪽지 삭제 요청
	@RequestMapping(value = "/toDeleteLetter")
	@ResponseBody
	public String toDeleteLetter(@RequestParam(value = "no[]") int[] no) throws Exception {
		Lservice.delete(no);
		return "success";
	}

	// 쪽지 보기
	@RequestMapping(value = "/toDetailLetter")
	public String toDetailLetter(Model model, int no) throws Exception {
		LetterDTO dto = Lservice.detailLetter(no, ((MemberDTO) session.getAttribute("loginSession")).getEmail());

		dto.setWritten_date(Lservice.getDate(dto.getWritten_date()));

		model.addAttribute("dto", dto);
		return "/mypage/detailLetter";
	}

	// 에러
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
}
