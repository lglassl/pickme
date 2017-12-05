package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.ResumeDTO;

public interface resumeDAO {
	
	public List<ResumeDTO> resumeList(int ps, int cp);
	
	public ResumeDTO resumeDetail(ResumeDTO ResumeDTO);
	
	public ResumeDTO psUpdate(String username);

	public ResumeDTO esUpdate(String username);
}
