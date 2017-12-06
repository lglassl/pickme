package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.LikeCartDTO;
import kr.or.pickme.dto.UserComPpDTO;

public interface CompPickInfoDAO {
	
	//기업정보 및 기업회원 리스트
	public List<UserComPpDTO> userCompList();
		
	//필터링(기업명) 채용공고 리스트
	public List<UserComPpDTO> userCompNameList(String comp_name);
	
	//채용정보, 채용상세정보, 자소서항목 리스트
	public List<CompPickInfoDTO> compList();
	
	//해당 유저 좋아요 리스트 가져오기
	public List<LikeCartDTO> likeList(String username);
	
	//필터링 채용공고 리스트
	public List<CompPickInfoDTO> filterCompList(String job_field);
	
	
}
