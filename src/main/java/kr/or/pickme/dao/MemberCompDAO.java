package kr.or.pickme.dao;
/*
@class : MemberCompDAO
@Date : 2017-12-04
@Author : 강희창
@Desc : 
*/

import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;

public interface MemberCompDAO {
	
	/*기업회원 아이디찾기*/
	public String idFindComp(UserComPpDTO dto);
	
	/*기업회원 비밀번호재설정-아이디,이메일확인*/
	public int pwdReComp(UserComPpDTO dto);

	/*기업회원 비밀번호설정-새 비번*/
	public int newPwdUpdateComp(UserComPpDTO dto);

	/*기업회원 정보*/
	public UserComPpDTO getCompInfo(String username);

	/*기업회원 정보수정-파일업로드포함*/
	public int compUpdate(UserComPpDTO dto);
	public int compUpdate2(UserComPpDTO dto);

	/*기업회원 정보수정-파일업로드없음*/
	public int compUpdateNf(UserComPpDTO dto);
	public int compUpdateNf2(UserComPpDTO dto);

}
