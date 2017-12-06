package kr.or.pickme.dao;

import kr.or.pickme.dto.UserComPpDTO;

/*
@class : MemberDAO
@Date : 2017-12-05
@Author : 강희창
@Desc : 
*/

public interface MemberDAO {
	
	/*회원 권한 판단*/
	public String checkAuth(String username);

}
