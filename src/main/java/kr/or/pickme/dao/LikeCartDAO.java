package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.LikeCartDTO;

public interface LikeCartDAO {
	//좋아요 삽입
	public int likeInsert(LikeCartDTO likeCartDTO);
	
	//좋아요 삭제
	public int likeDelete(LikeCartDTO likeCartDTO);
	
	//좋아요 목록
	public List<LikeCartDTO> likeSelect(LikeCartDTO likeCartDTO);
}
