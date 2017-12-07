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

	public CoverletterDTO2 editDetail(String username);

}
