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

	public List<ResumeDTO> aelist(int ps, int cp);

	/*username, pick_code로 자기소개서 list를 select해오기*/
	public List<CoverletterDTO2> editDetail(String username, int pick_code);

}
