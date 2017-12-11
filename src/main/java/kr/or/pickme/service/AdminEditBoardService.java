package kr.or.pickme.service;
/*
@class : AdminEditBoardService
@Date : 2017-12-06
@Author : 정수민
@Desc : 전문가용 첨삭게시판
*/
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.AdminResumeEditBoardDAO;
import kr.or.pickme.dao.ResumeBoardDAO;
import kr.or.pickme.dao.ResumeEditBoardDAO;
import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;

@Service
public class AdminEditBoardService {

	@Autowired
	private SqlSession sqlsession;
	//첨삭게시판
	public List<ResumeDTO> aelist(String ps, String cp){
		int page = 20;
		int cpage = 1;
		
		if(ps != null && ps.equals("")) {
			page = Integer.parseInt(ps);
		}
		if(cp != null && cp.equals("")) {
			cpage = Integer.parseInt(cp);
		}
		
		AdminResumeEditBoardDAO editdao = sqlsession.getMapper(AdminResumeEditBoardDAO.class);
		List<ResumeDTO> aelist = editdao.aelist(page, cpage);
		return aelist;
	}
	//전문가 첨삭 게시판
	public List<CoverletterDTO2> editDetail(String username, int pick_code) {
		
		AdminResumeEditBoardDAO edDAO= sqlsession.getMapper(AdminResumeEditBoardDAO.class);
		List<CoverletterDTO2> eddto = edDAO.editDetail(username, pick_code);
		System.out.println(eddto.toString());
		return eddto;
	}
	public void esUpdate(ResumeDTO dto) {
		ResumeBoardDAO resumeboarddao = sqlsession.getMapper(ResumeBoardDAO.class);
		resumeboarddao.esUpdate(dto);
		
		System.out.println("서비스" + dto);
		
	}
	
	//첨삭내용 업데이트 부분
	public void editUpdate(ResumeDTO dto) {
		System.out.println("여기는 서비스");
		System.out.println(dto.toString());
		
	
		AdminResumeEditBoardDAO admineditdao = sqlsession.getMapper(AdminResumeEditBoardDAO.class);
	// 커버리스트에 항목별로 삽입	
		for(int i=0; i<dto.getCoverletterList2().size(); i++) {
			int result = admineditdao.editUpdate(dto.getCoverletterList2().get(i));
			System.out.println(i+"번째 객체 수정 성공여부 : " +result);
		}
		
	}
	
	//첨삭 상태 변경
	public int statusUpdate(ResumeDTO dto) {
		System.out.println(dto.getEdit_status());
		AdminResumeEditBoardDAO adminedit = sqlsession.getMapper(AdminResumeEditBoardDAO.class);
		System.out.println("첨삭상태변경하는 서비스가 username을 받아오냐?? :"+dto.getUsername());
		int result = adminedit.statusUpdate(dto.getCoverletterList2().get(0).getUsername(), dto.getCoverletterList2().get(0).getPick_code());
		
		return result;
	}
}
	
