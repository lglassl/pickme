package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.ResumeDTO;

public interface doingDAO {

	List<ResumeDTO> doingList(int page, int cpage);
	
	public ResumeDTO resumeDoing(String username);

}
