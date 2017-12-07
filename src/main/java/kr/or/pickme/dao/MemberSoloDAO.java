package kr.or.pickme.dao;
/*
@class : MemberSoloDAO
@Date : 2017-12-04
@Author : 강희창
@Desc : 
*/

import kr.or.pickme.dto.UserSoloDTO;

public interface MemberSoloDAO {
	
	/*개인회원 아이디찾기*/
	public String idFind(UserSoloDTO dto);
	
	/*개인회원 비밀번호재설정-아이디,이메일확인*/
	public int pwdRe(UserSoloDTO dto);

	/*개인회원 비밀번호설정-새 비번*/
	public int newPwdUpdate(UserSoloDTO dto);

	/*개인회원 정보*/
	public UserSoloDTO getSoloInfo(String username);

	/*개인회원 정보수정*/
	public int soloUpdate(UserSoloDTO dto);

	/*개인회원 정보수정-페이스북*/
	public int soloUpdateFb(UserSoloDTO dto);

	/*개인회원 탈퇴*/
	public int memberDel(String username);

}
