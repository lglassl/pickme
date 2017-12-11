package kr.or.pickme.dao;
/*
@class : ResumeDoingBoardDAO
@Date : 2017-11-30
@Author : 정수민
@Desc : 
*/
import java.util.List;

import kr.or.pickme.dto.ResumeDTO;

public interface ResumeDoingBoardDAO {
	//작성중인 리스트를 게시판형태로
	public List<ResumeDTO> doingList(String username);
	//username에 따라 작성중인 것만 가지고 온다 ... 서류작성
	public ResumeDTO resumeDoing(String username);

}
