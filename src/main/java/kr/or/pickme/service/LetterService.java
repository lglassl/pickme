package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

/*
@class : LetterService
@Date : 2017-12-08
@Author : 강희창
@Desc : 
*/

import org.springframework.stereotype.Service;

import kr.or.pickme.dao.LetterDAO;
import kr.or.pickme.dto.LetterDTO;
import kr.or.pickme.dto.UserSoloDTO;

@Service
public class LetterService {
	
	@Autowired
	private SqlSession sqlsession;

	/*쪽지보내기*/
	public int sendLetter(LetterDTO letter) {
		
		int result = 0;
		
		LetterDAO dao = sqlsession.getMapper(LetterDAO.class);
		
		result = dao.sendLetter(letter);
		
		return result;
	}
	
	/*회원목록*/
	public List<UserSoloDTO> memberList() {
		
		LetterDAO dao = sqlsession.getMapper(LetterDAO.class);
		
		List<UserSoloDTO> list = dao.memberList();
		
		return list;
		
	}
	
	/*쪽지목록*/
	public List<LetterDTO> letterList(String solo_username){
		
		LetterDAO dao = sqlsession.getMapper(LetterDAO.class);
		
		List<LetterDTO> list = dao.letterList(solo_username);
		
		return list;
		
	}
	
	/*쪽지갯수*/
	public int letterCount(String solo_username){
		
		LetterDAO dao = sqlsession.getMapper(LetterDAO.class);
		
		int count = dao.letterCount(solo_username);
		
		return count;
		
	}

	/*쪽지보기*/
	public LetterDTO showLetter(int letter_no) {
		/*System.out.println("service : " + letter_no);*/		
		LetterDAO dao = sqlsession.getMapper(LetterDAO.class);
		
		LetterDTO dto = dao.showLetter(letter_no);
		
		return dto;
	}

}
