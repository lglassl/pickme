package kr.or.pickme.service;
/*
@class : EditBoardService
@Date : 2017-12-01
@Author : 정수민
@Desc : 첨삭게시판
*/
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.ResumeEditBoardDAO;
import kr.or.pickme.dto.ResumeDTO;

@Service
public class EditBoardService {

	@Autowired
	private SqlSession sqlsession;
	//첨삭게시판
	public List<ResumeDTO> editlist(String ps, String cp){
		int page = 20;
		int cpage = 1;
		
		if(ps != null && ps.equals("")) {
			page = Integer.parseInt(ps);
		}
		if(cp != null && cp.equals("")) {
			cpage = Integer.parseInt(cp);
		}
		
		ResumeEditBoardDAO editdao = sqlsession.getMapper(ResumeEditBoardDAO.class);
		List<ResumeDTO> elist = editdao.editlist(page, cpage);
		return elist;
	}
	
}
