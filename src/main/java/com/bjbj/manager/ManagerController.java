package com.bjbj.manager;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.bookclub.BookclubService;
import com.bjbj.letter.LetterDTO;
import com.bjbj.letter.LetterService;
import com.bjbj.member.MemberDTO;
import com.bjbj.review.ReviewDTO;

@RequestMapping(value="/manager")
@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	@Autowired
	private LetterService Lservice;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/toAllmember") //전체 회원페이지 요청
	public String toAllmember(Model model) throws Exception{
		List<Map<String,Object>> list = service.selectAllmember();
		model.addAttribute("list" , list);
		return"manager/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/toSearchMember") //전체 회원 검색
	public List<MemberDTO>searchMember(String category, String keyword) throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<MemberDTO>list = service.searchMember(category, keyword);
		return list;
	}
	
	@RequestMapping(value="/toSendLetter") // 개별 쪽지 전송
	public String toSendLetter(LetterDTO dto)throws Exception{
		Lservice.insertLetter(dto);
		return "redirect:/manager/toAllmember";
	}
	
	
	@RequestMapping(value="/toblacklist") //블랙리스트 페이지 요청
	public String toblacklist(Model model)throws Exception{
		List<Map<String, Object>> list = service.selectBlacklist();
		model.addAttribute("list", list);
		return"manager/blacklist";
	}
	
	@RequestMapping(value="/deleteBlacklist") //블랙리스트 삭제 요청
	public String delete(String email)throws Exception{
		service.delete(email);
		return "redirect:/manager/toblacklist";
	}
	
	@RequestMapping(value="/addBlacklist") //블랙리스트 개별 추가
	public String addBlacklist(BlacklistDTO dto) throws Exception{
		service.insertBlacklist(dto);
		return "redirect:/manager/toAllmember";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchBlacklist") //블랙리스트 검색
	public List<MemberDTO>searchBlacklist(String category, String keyword) throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<MemberDTO>list = service.searchBlacklist(category, keyword);
		return list;
	}
	
	
	@RequestMapping(value="/toAllclub") //전체 모임페이지 요청
	public String toAllclub(Model model) throws Exception{
		List<Map<String, Object>> list = service.selectBookroomM();
		model.addAttribute("list", list);
		return "manager/bookclubList";
	}
	
	@RequestMapping(value="/deleteBookroom") // 모임 개별 삭제 
	public String deleteBookroom(int room_id)throws Exception{
		service.deleteBookroomM(room_id);
		return "redirect:/manager/toAllclub";
	}
	
	@RequestMapping(value="/toReview") //리뷰관리 페이지 요청
	public String toReview(Model model) throws Exception{
		List<ReviewDTO>list = service.selectAllreview();
		model.addAttribute("list" , list);
		return "manager/review";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchReview") //리뷰 검색
	public List<ReviewDTO> searchReview(String category, String keyword)throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<ReviewDTO> list = service.searchReview(category, keyword);
		return list;
	}
	
	@RequestMapping(value="/deleteReview") //리뷰 삭제
	public String deleteReview(int review_no) throws Exception{
		service.deleteReview(review_no);
		return "redirect:/manager/toReview";
	}
	
	
	@RequestMapping(value="/deleteAllReview") //전체 리뷰 삭제
	@ResponseBody
	public String deleteAllReview(@RequestParam(value="no[]")int[]no)throws Exception{
		for(int n : no) {
			System.out.println(n);
		}
		service.deleteAllReview(no);
		return "success";
	}
 	
	
	@RequestMapping(value="/toReport") //신고 리스트 요청
	public String toReport(Model model) throws Exception{
		//회원 신고 리스트
		List<ReportDTO> report_list = service.selectAllreport();
		model.addAttribute("report_list", report_list);
		//모임 신고 리스트
		List<ReportBookroomDTO>report_bookroom = service.selectRoomreport();
		model.addAttribute("report_bookroom",report_bookroom);
		return "manager/report";
	}
	
	//회원신고 - 신고삭제
	@RequestMapping(value="/deleteReport")
	public String deleteReport(String email) throws Exception{
		service.deleteReport(email);
		return "redirect:/manager/toReport";
	}
	//모임신고 - 신고삭제
	@RequestMapping(value="/deleteReportBR")
	public String deleteReportBR(int room_id) throws Exception{
		service.deleteReportBR(room_id);
		return "redirect:/manager/toReport";
	}
	//회원 신고 - 경고 추가
	@RequestMapping(value="/addReport")
	public String addReport(ReportDTO dto)throws Exception{
		//경고 +1
		service.addReport(dto);
		return "redirect:/manager/toReport";
		
	}

	
	
	//모임신고 - 경고 추가
	@RequestMapping(value="/addReportBR")
	public String reportBR(int room_id) throws Exception{
		//경고 +1
		service.addReportBR(room_id);
		
		//조치 상태 변경
		
		
		service.modifyActionBR(room_id);
		return "redirect:/manager/toReport";
	}
	
	
}
