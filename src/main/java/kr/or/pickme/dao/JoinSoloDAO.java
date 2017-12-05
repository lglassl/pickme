package kr.or.pickme.dao;

import kr.or.pickme.dto.UserComPpDTO;

/*
@class : JoinSoloDAO
@Date : 2017-11-30
@Author : 강희창
@Desc : 
*/

import kr.or.pickme.dto.UserSoloDTO;

public interface JoinSoloDAO {
	
	/*회원가입*/
	public int insertMember(UserSoloDTO usersolo);
	
	/*회원가입시 부여되는 권한*/
	public int rollInsert(UserSoloDTO usersolo);
	
	/*개인회원메일인증*/
	public int rollUpdate(String username);
	
	/*아이디중복체크*/
	public int idCheckSolo(String username);
	
	/*페이스북회원가입*/
	public int insertFacebook(UserSoloDTO usersolo);

}
