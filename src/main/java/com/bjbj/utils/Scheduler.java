package com.bjbj.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.bookclub.BookclubService;
import com.bjbj.bookclub.ExpirationDTO;
import com.bjbj.bookclub.ExpirationRoleDTO;
import com.bjbj.bookclub.RoleDTO;
import com.bjbj.letter.LetterDTO;
import com.bjbj.letter.LetterService;


@Component
public class Scheduler {
	@Autowired
	private BookclubService clubService;
	@Autowired
	private LetterService letterService;
	
	
	public Scheduler() {
		System.out.println("scheduler operated");
	}
	/* 
	초 : 0~59
	분 : 0~59
	시 : 0~24
	일 : 1~31
	월 : 1~12
	요일 : 0(sun)~6(mon) or MON, WED, FRI
	* : all
	*/
	// 모집 기간 스케쥴 - 매일 오전 12시 실행 ( 모집기간이 지났는데도 '모집중' 인 클럽 대상 )
	@Scheduled(cron= "0 0 * * * *")
	public void recruitSchedule() {
	try {
		if(clubService.selectRoomIdByRecruit() != null) {
			
			List<Integer> recruit_end = clubService.selectRoomIdByRecruit();
			
			for(int i = 0; i < recruit_end.size(); i++) {
				
				int room_id = recruit_end.get(i);
				
				//구성원들에게 클럽 해제 공지
				List<RoleDTO> list = clubService.selectRoleByRoom(room_id);
					for (int j = 0; j < list.size(); j++) {
						String email = list.get(i).getEmail();
						String title = "[클럽] 모집기간 동안 충분한 멤버가 모이지 못했습니다.";
						String content = "클럽을 폭파할게요!";
						letterService.insertLetter(new LetterDTO(0, email, title, content,"", null));
					}
				
				//신청인원 해제
				clubService.deleteWaitingByRoomId(room_id);
				// 구성원 해산
				clubService.deleteRoleByRoomId(room_id);
				// 방 삭제
				clubService.deleteBookroom(room_id);
		}
	}
		System.out.println("모집 스케쥴링 완료");
	} catch (Exception e) {
		e.printStackTrace();
	}

	}

	
	// 모임 기간 스케쥴 - 매일 오전 12시 1분 실행
	@Scheduled(cron= "1 0 * * * *")
	public void clubSchedule() {
		try {
			if(clubService.selectRoomIdByClosedate() != null) {
				
				List<Integer> close_date = clubService.selectRoomIdByClosedate();
				
				for(int i = 0; i < close_date.size(); i++) {
					
					int room_id = close_date.get(i);
					
				//구성원들에게 클럽 종료 공지
				List<RoleDTO> list = clubService.selectRoleByRoom(room_id);
					for (int j = 0; j < list.size(); j++) {
						String email = list.get(j).getEmail();
						String title = "[클럽] 모임 기간이 종료되었습니다.";
						String content = "모임에서 읽은 책들을 리뷰해보세요!";
						letterService.insertLetter(new LetterDTO(0, email, title, content,"", null));
						System.out.println( i +"번째 이메일 : " + email);
						// 종료된 모임 참여자 및 방 정보 삽입
						clubService.insertExpirationRole(new ExpirationRoleDTO(room_id, email));
					}
					
					// bookroom 테이블의 데이터 expiration 테이블로 이전
					BookclubDTO dto = clubService.selectOne(room_id);
					System.out.println("open_date : " + dto.getOpen_date());
					clubService.insertExpiration(new ExpirationDTO(dto.getRoom_id(), dto.getRoom_title(), dto.getRoom_detail(), dto.getBook_title(), dto.getBook_cover(), dto.getRoom_people(), dto.getRoom_current(), dto.getOpen_date(), dto.getClose_date(), dto.getTag(), dto.getMeet_week(), dto.getPlace()));
					 
					// bookroom 테이블 데이터 및 role테이블 데이터 삭제 (다른 모임에 참여 할 수 있게)
					clubService.deleteRoleByRoomId(room_id);
					clubService.deleteBookroom(room_id);
				
				}
			}

			System.out.println("모임 스케쥴링 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
