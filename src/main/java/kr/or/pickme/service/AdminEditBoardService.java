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
import kr.or.pickme.dao.EntityBoardDAO;
import kr.or.pickme.dao.ResumeEditBoardDAO;
import kr.or.pickme.dto.BoardEntityDTO;
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
	//첨삭 상세 게시판
	public CoverletterDTO2 editDetail(String username, int pick_code) {
		
		AdminResumeEditBoardDAO edDAO= sqlsession.getMapper(AdminResumeEditBoardDAO.class);
		CoverletterDTO2 eddto = edDAO.editDetail(username, pick_code);
		
		return eddto;
	}
	
}
