package kr.or.pickme.dao;

import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;

/*
@class : JoinSoloDAO
@Date : 2017-11-30
@Author : 강희창
@Desc : 
*/

public interface JoinCompDAO {
	
	/*회원가입*/
	public int insertComp1(UserComPpDTO dto);
	public int insertComp2(UserComPpDTO dto);
	
	/*회원가입시 부여되는 권한*/
	public int rollInsert(UserComPpDTO dto);
	public int rollUpdate(UserComPpDTO dto);

	/*기업회원 아이디중복체크*/
	public int idCheckComp(String username);

}
