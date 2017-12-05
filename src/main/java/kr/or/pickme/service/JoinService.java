package kr.or.pickme.service;

/*
@class : JoinService
@Date : 2017-11-30
@Author : 강희창
@Desc : 
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.pickme.dao.JoinCompDAO;
import kr.or.pickme.dao.JoinSoloDAO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;

@Service
public class JoinService {
	
	@Autowired
	private SqlSession sqlsession;
	
	/*개인회원가입*/
	public int insertMember(UserSoloDTO usersolo) {
		
		int result = 0;
		JoinSoloDAO dao = sqlsession.getMapper(JoinSoloDAO.class);
		
		try {
			result = dao.insertMember(usersolo);
			result += dao.rollInsert(usersolo);
			System.out.println("정보업데이트");
		}catch (Exception e) {
			System.out.println("트랜잭션 예외발생 : " + e.getMessage());
			throw e; //예외발생 시 : 자동 rollback
		}	
		
		return result;
	}
	
	/*개인회원메일인증*/
	public int rollUpdate(String username) {
		
		int result = 0;
		JoinSoloDAO dao = sqlsession.getMapper(JoinSoloDAO.class);
		result = dao.rollUpdate(username);
		
		return result;
		
	}
	
	/*기업회원가입*/
	public int insertComp(UserComPpDTO dto) {
		
		int result = 0;
		JoinCompDAO dao = sqlsession.getMapper(JoinCompDAO.class);
		
		
		try {
			result = dao.insertComp1(dto);
			result += dao.insertComp2(dto);	
			result += dao.rollInsert(dto);
			result += dao.rollUpdate(dto);
			System.out.println("정보업데이트");
		}catch (Exception e) {
			System.out.println("트랜잭션 예외발생 : " + e.getMessage());
			throw e; //예외발생 시 : 자동 rollback
		}		
		
		return result;
	}
	
	/*개인회원 아이디중복체크*/
	public int idCheckSolo(String username) {
		
		int result = 0;
		
		JoinSoloDAO dao = sqlsession.getMapper(JoinSoloDAO.class);
		
		result = dao.idCheckSolo(username);
		return result;
		
	}
	
	//페이스북 가입 
	@RequestMapping("/fbsignup.htm")
	public int fbsignup(UserSoloDTO dto) throws Exception {
		int result = 0;
		
		JoinSoloDAO dao = sqlsession.getMapper(JoinSoloDAO.class);
		
		try {
			result = dao.insertFacebook(dto);
			result += dao.rollInsert(dto);
			System.out.println("정보업데이트");
		}catch (Exception e) {
			System.out.println("트랜잭션 예외발생 : " + e.getMessage());
			throw e; //예외발생 시 : 자동 rollback
		}	
		
		return result;
		
	}
	
	/*기업회원 아이디중복체크*/
	public int idCheckComp(String username) {
		
		int result = 0;
		
		JoinCompDAO dao = sqlsession.getMapper(JoinCompDAO.class);
		
		result = dao.idCheckComp(username);
		return result;
		
	}	

}
