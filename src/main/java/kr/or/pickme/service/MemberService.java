package kr.or.pickme.service;
/*
@class : MemberService
@Date : 2017-12-04
@Author : 강희창
@Desc : 
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.MemberCompDAO;
import kr.or.pickme.dao.MemberSoloDAO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;


	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String idFind(UserSoloDTO dto)
	*/
	/*개인회원 아이디찾기*/
	public String idFind(UserSoloDTO dto) {
		
		String result;
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		
		result = dao.idFind(dto);
		
		if(result == null) {
			result = "no";
		}

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int pwdRe(UserSoloDTO dto)
	*/
	/*개인회원 비밀번호설정-아이디,이메일확인*/
	public int pwdRe(UserSoloDTO dto) {
		
		int result;
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		
		result = dao.pwdRe(dto);

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int newPwdUpdate(UserSoloDTO dto)
	*/
	/*개인회원 비밀번호설정-새 비번*/
	public int newPwdUpdate(UserSoloDTO dto) {
		
		int result;
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		
		result = dao.newPwdUpdate(dto);

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String idFindComp(UserComPpDTO dto)
	*/
	/*기엽회원 아이디찾기*/
	public String idFindComp(UserComPpDTO dto) {
		
		String result;
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		result = dao.idFindComp(dto);
		
		if(result == null) {
			result = "no";
		}

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int pwdReComp(UserComPpDTO dto)
	*/
	/*기업회원 비밀번호설정-아이디,이메일확인*/
	public int pwdReComp(UserComPpDTO dto) {
		
		int result;
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		result = dao.pwdReComp(dto);

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int newPwdUpdateComp(UserComPpDTO dto)
	*/
	/*기업회원 비밀번호설정-새 비번*/
	public int newPwdUpdateComp(UserComPpDTO dto) {
		
		int result;
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		result = dao.newPwdUpdateComp(dto);

		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : UserSoloDTO getSoloInfo(String username)
	*/
	/*개인회원 회원정보 로그인*/
	public UserSoloDTO getSoloInfo(String username) {
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		
		UserSoloDTO dto = dao.getSoloInfo(username);
		
		return dto;
		
	}
	
	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int soloUpdate(UserSoloDTO dto)
	*/
	/*개인회원 회원정보 수정*/
	public int soloUpdate(UserSoloDTO dto) {
		
		int result = 0;
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		result = dao.soloUpdate(dto);
		
		return result;
		
	}
	
	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int soloUpdateFb(UserSoloDTO dto)
	*/
	/*개인회원 회원정보 수정-페이스북*/
	public int soloUpdateFb(UserSoloDTO dto) {
		
		int result = 0;
		
		MemberSoloDAO dao = sqlsession.getMapper(MemberSoloDAO.class);
		result = dao.soloUpdateFb(dto);
		
		return result;
		
	}
	
	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : UserComPpDTO getCompInfo(String username)
	*/
	/*기업회원 회원정보 로그인*/
	public UserComPpDTO getCompInfo(String username) {
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		UserComPpDTO dto = dao.getCompInfo(username);
		
		return dto;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : int compUpdate(UserComPpDTO dto)
	*/
	/*개인회원 회원정보 수정-파일업로드 포함*/
	public int compUpdate(UserComPpDTO dto) {
		
		int result = 0;
		
		System.out.println(dto.toString());
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		try {
			result = dao.compUpdate(dto);
			result += dao.compUpdate2(dto);
			System.out.println("정보업데이트");
		}catch (Exception e) {
			System.out.println("트랜잭션 예외발생 : " + e.getMessage());
			throw e; //예외발생 시 : 자동 rollback
		}
		
		return result;
		
	}

	/*
	@class : MemberService
	@Date : 2017-12-05
	@Author : 강희창
	@Desc : int compUpdateNf(UserComPpDTO dto)
	*/
	/*개인회원 회원정보 수정-파일업로드 미포함*/
	public int compUpdateNf(UserComPpDTO dto) {
		
		int result = 0;
		
		System.out.println(dto.toString());
		
		MemberCompDAO dao = sqlsession.getMapper(MemberCompDAO.class);
		
		try {
			result = dao.compUpdateNf(dto);
			result += dao.compUpdateNf2(dto);
			System.out.println("정보업데이트");
		}catch (Exception e) {
			System.out.println("트랜잭션 예외발생 : " + e.getMessage());
			throw e; //예외발생 시 : 자동 rollback
		}
		
		return result;
		
	}

}
