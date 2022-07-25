package com.bjbj.bookclub;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.member.MemberDAO;
import com.bjbj.utils.PageDTO;

@Service
public class BookclubService {
	@Autowired
	private BookclubDAO dao;
	@Autowired
	private MemberDAO memberDao;
  
  /* �쟾�젣 議고쉶 */
	public List<BookclubDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
	
	/* 理쒓렐�닚�쑝濡� 議고쉶 */
	public List<BookclubDTO> selectLately() throws Exception {
		return dao.selectLately();
	}
	
	/* �럹�씠吏� */
	public void getPage(HttpServletRequest request) throws Exception{
      //�븳 �럹�씠吏��뿉 紐뉕컻�뵫 �몴�떆�븷 寃껋씤吏�
      final int PAGE_ROW_COUNT=5;
      //�븯�떒 �럹�씠吏�瑜� 紐뉕컻�뵫 �몴�떆�븷 寃껋씤吏�
      final int PAGE_DISPLAY_COUNT=5;
      
      //蹂댁뿬以� �럹�씠吏��쓽 踰덊샇瑜� �씪�떒 1�씠�씪怨� 珥덇린媛� 吏��젙
      int pageNum=1;
      //�럹�씠吏� 踰덊샇媛� �뙆�씪誘명꽣濡� �쟾�떖�릺�뒗吏� �씫�뼱�� 蹂몃떎.
      String strPageNum = request.getParameter("pageNum");
      //留뚯씪 �럹�씠吏� 踰덊샇媛� �뙆�씪誘명꽣濡� �꽆�뼱 �삩�떎硫�
      if(strPageNum != null){
         //�닽�옄濡� 諛붽퓭�꽌 蹂댁뿬以� �럹�씠吏� 踰덊샇濡� 吏��젙�븳�떎.
         pageNum=Integer.parseInt(strPageNum);
      }
      
      //蹂댁뿬以� �럹�씠吏��쓽 �떆�옉 ROWNUM
      int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
      //蹂댁뿬以� �럹�씠吏��쓽 �걹 ROWNUM
      int endRowNum = pageNum * PAGE_ROW_COUNT;
      
      //startRowNum 怨� endRowNum  �쓣 BookclubDTO 媛앹껜�뿉 �떞怨�
      PageDTO dto = new PageDTO();
      dto.setStartRowNum(startRowNum);
      dto.setEndRowNum(endRowNum);
      
      // BookclubDTO 媛앹껜瑜� �씠�슜�빐�꽌 紐⑸줉�쓣 �뼸�뼱�삩�떎.
      List<BookclubDTO> list = dao.selectPage(startRowNum, endRowNum);
      
      //�븯�떒 �떆�옉 �럹�씠吏� 踰덊샇 
      int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
      //�븯�떒 �걹 �럹�씠吏� 踰덊샇
      int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
      
      //�쟾泥� row �쓽 媛��닔
      int totalRow = dao.getCount();
      //�쟾泥� �럹�씠吏��쓽 媛��닔 援ы븯湲�
      int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
      //�걹 �럹�씠吏� 踰덊샇媛� �씠誘� �쟾泥� �럹�씠吏� 媛��닔蹂대떎 �겕寃� 怨꾩궛�릺�뿀�떎硫� �옒紐삳맂 媛믪씠�떎.
      if(endPageNum > totalPageCount){
         endPageNum = totalPageCount; //蹂댁젙�빐 以��떎. 
      }
      
      //request �쁺�뿭�뿉 �떞�븘二쇨린
      request.setAttribute("list", list);   //Bookclub list
      request.setAttribute("startPageNum", startPageNum);   //�떆�옉 �럹�씠吏� 踰덊샇
      request.setAttribute("endPageNum", endPageNum);   //�걹 �럹�씠吏� 踰덊샇
      request.setAttribute("pageNum", pageNum);   //�쁽�옱 �럹�씠吏� 踰덊샇
      request.setAttribute("totalPageCount", totalPageCount);   //紐⑤뱺 �럹�씠吏� count	      
	}
	
	/* 李쒗븳 紐⑥엫 議고쉶 */
	public List<BookclubDTO> likeClub() throws Exception {
		return dao.likeClub();
	}

	public List<BookclubDTO> selectList() throws Exception {
		List<BookclubDTO> list = dao.selectList();
		return dao.selectList();
	}

	public void insert(BookclubDTO dto, RoleDTO roleDto) throws Exception {
		// room_id �떆���뒪 誘몃━ �깮�꽦 (role table, bookroom table �룞�떆 �쟻�슜)
		int room_id = dao.selectSeq();
		dto.setRoom_id(room_id);
		roleDto.setRoom_id(room_id);

		dao.insert(dto);
		dao.insertRole(roleDto);
	}

	public void insertRole(RoleDTO dto) throws Exception {
		dao.insertRole(dto);
	}

	// room_id �뿉 �뵲瑜� �븳媛� 由ъ뒪�듃 媛��졇�삤湲�
	public BookclubDTO selectOne(int room_id) throws Exception {
		return dao.selectOne(room_id);
	}

	// email濡� �빐�떦 role �뜲�씠�꽣 媛��졇�삤湲�
	public RoleDTO selectRole(String email) throws Exception {
		return dao.selectRole(email);
	}

	// �궇吏쒗몴湲� format (String to String)
	public String getStrDate(String string) throws Exception {
		return dao.getStrDate(string);
	}

	// �옄湲곗냼媛� �뜲�씠�꽣 �뾽�뜲�씠�듃
	public int updateMydesc(String email, String mydesc) throws Exception {
		return memberDao.updateMydesc(email, mydesc);
	}

	// waiting �뀒�씠釉� �뜲�씠�꽣 �궫�엯
	public void insertWaiting(WaitingDTO dto) throws Exception {
		dao.insertWaiting(dto);
	}

	// �씠硫붿씪濡� waiting �뀒�씠釉� 議고쉶
	public WaitingDTO selectByEmail(String email) throws Exception {
		return dao.selectByEmail(email);
	}

	// Room_id �뿉 �뵲瑜� 吏��썝 �씤�썝 蹂닿린
	public List<String> selectByRoom(int room_id) throws Exception {
		return dao.selectByRoom(room_id);
	}

	// waiting �뀒�씠釉붿뿉�꽌 �씠硫붿씪濡� �빐�떦 �뜲�씠�꽣 �궘�젣
	public void deleteByEmail(String email) throws Exception {
		dao.deleteByEmail(email);
	}

	// �쁽�옱�씤�썝 + 1
	public void updateCurrent(int room_id) throws Exception {
		dao.updateCurrent(room_id);
	}

	public int updateStatus(String room_status, int room_id) throws Exception {
		return dao.updateStatus(room_status, room_id);
	}
	
}
