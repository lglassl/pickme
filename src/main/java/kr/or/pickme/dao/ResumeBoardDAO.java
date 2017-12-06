package kr.or.pickme.dao;
/*
@class : ResumeBoardDAO
@Date : 2017-11-28
@Author : 정수민
@Desc : 
*/
import java.util.List;

import kr.or.pickme.dto.ResumeDTO;

public interface ResumeBoardDAO {
	//개인회원 이력서 자소서 리스트를 게시판으로 보여줌
	public List<ResumeDTO> resumeList(int ps, int cp);
	//이력서 자소서 상세보기 페이지
	public ResumeDTO resumeDetail(ResumeDTO ResumeDTO);
	//제출상태 업데이트
	public ResumeDTO psUpdate(ResumeDTO ResumeDTO);
	//첨삭상태 업데이트
	public ResumeDTO esUpdate(ResumeDTO ResumeDTO);
}
