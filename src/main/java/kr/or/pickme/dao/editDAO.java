package kr.or.pickme.dao;

import java.util.List;

import kr.or.pickme.dto.ResumeDTO;

public interface editDAO {

	public List<ResumeDTO> editlist(int ps, int cp);
}
