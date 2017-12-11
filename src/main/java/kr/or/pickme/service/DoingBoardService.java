package kr.or.pickme.service;
import java.security.Principal;
/*
@class : DoingBoardService
@Date : 2017-12-01
@Author : 정수민
@Desc : 
*/
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.ResumeDoingBoardDAO;
import kr.or.pickme.dao.ResumeEditBoardDAO;
import kr.or.pickme.dto.ResumeDTO;

@Service
public class DoingBoardService {
	@Autowired
	private SqlSession sqlsession;

		//개인회원 작성중 이력서 자소서 리스트
		public List<ResumeDTO> doingList(String username){
			ResumeDoingBoardDAO doingdao = sqlsession.getMapper(ResumeDoingBoardDAO.class);
			List<ResumeDTO> doinglist = doingdao.doingList(username);
			return doinglist;
	}

}
