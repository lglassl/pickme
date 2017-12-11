package kr.or.pickme.dao;
/*
@class : ResumeEditBoardDAO
@Date : 2017-11-30
@Author : 정수민
@Desc : 개인회원의 첨삭진행중 리스트
*/
import java.util.List;

import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
//첨삭 게시판
public interface ResumeEditBoardDAO {

	public List<ResumeDTO> editlist(int ps, int cp);
	
	/*username, pick_code로 자기소개서 list를 select해오기 user*/
	public List<CoverletterDTO2> userEditDetail(String username, int pick_code);

}
