package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.LetterDTO;
import kr.or.pickme.dto.UserSoloDTO;

/*
@class : LetterDAO
@Date : 2017-12-08
@Author : 강희창
@Desc : 
*/

public interface LetterDAO {
	
	/*쪽지보내기*/
	public int sendLetter(LetterDTO letter);
	
	/*회원목록*/
	public List<UserSoloDTO> memberList();
	
	/*쪽지목록*/
	public List<LetterDTO> letterList(String solo_username);
	
	/*쪽지갯수*/
	public int letterCount(String solo_username);
	
	/*쪽지보기*/
	public LetterDTO showLetter(int letter_no);
	
}
