package kr.or.pickme.dao;
/*
@class : AdminResumeEditBoardDAO
@Date : 2017-12-06
@Author : 정수민
@Desc : 
*/
import java.util.List;

import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
//첨삭 게시판

public interface AdminResumeEditBoardDAO {
	
	
	//전문가 첨삭 게시판 리스트	
	public List<ResumeDTO> aelist(int ps, int cp);
	
	/*username, pick_code로 자기소개서 list를 select해오기 admin
	  첨삭 상세 보기 페이지*/
	public List<CoverletterDTO2> editDetail(String username, int pick_code);
	
	// 첨삭내용 등록했을 때 첨삭 내용 변경
	public int editUpdate(CoverletterDTO2 dto);
	
	// 등록했을 때 첨삭 상태 변경
	public int statusUpdate(String username, int pick_code);

}
