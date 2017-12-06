package kr.or.pickme.dao;
/*
@class : ResumeEditBoardDAO
@Date : 2017-11-30
@Author : 정수민
@Desc : 
*/
import java.util.List;

import kr.or.pickme.dto.ResumeDTO;
//첨삭 게시판
public interface ResumeEditBoardDAO {

	public List<ResumeDTO> editlist(int ps, int cp);
}
