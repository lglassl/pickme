package kr.or.pickme.service;
/*
@class : ResumeBoardService
@Date : 2017-11-29
@Author : 정수민
@Desc : 
*/
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.ResumeBoardDAO;
import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.ResumeDTO;
@Service
public class ResumeBoardService {

	@Autowired
	private SqlSession sqlsession;
	//개인회원 이력서 자소서 리스트
	public List<ResumeDTO> resumeList(String ps, String cp){
		int page = 20;
		int cpage = 1;
		
		if(ps != null && ps.equals("")) {
			page = Integer.parseInt(ps);
		}
		if(cp != null && cp.equals("")) {
			cpage = Integer.parseInt(cp);
		}
		
		ResumeBoardDAO resumeboarddao = sqlsession.getMapper(ResumeBoardDAO.class);
		List<ResumeDTO> list = resumeboarddao.resumeList(page, cpage);
		return list;
	}
	//개인회원 이력서 자소서 상세보기
	public ResumeDTO resumeDetail(ResumeDTO username) {
		
		ResumeBoardDAO resumeboarddao = sqlsession.getMapper(ResumeBoardDAO.class);
		ResumeDTO resumedto = resumeboarddao.resumeDetail(username);
		
		return resumedto;
	}
	//이력서 자소서 첨삭상태
	public void esUpdate(ResumeDTO dto) {
		ResumeBoardDAO resumeboarddao = sqlsession.getMapper(ResumeBoardDAO.class);
		resumeboarddao.esUpdate(dto);
		
		System.out.println("서비스" + dto);
		
	}
	
	//이력서 자소서 제출상태
	public void psUpdate(ResumeDTO dto) {
		ResumeBoardDAO resumeboarddao = sqlsession.getMapper(ResumeBoardDAO.class);
		
		ResumeDTO result = resumeboarddao.psUpdate(dto);
		System.out.println(result);
		
		
	}
}
