package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.editDAO;
import kr.or.pickme.dto.ResumeDTO;

@Service
public class editService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<ResumeDTO> editlist(String ps, String cp){
		int page = 20;
		int cpage = 1;
		
		if(ps != null && ps.equals("")) {
			page = Integer.parseInt(ps);
		}
		if(cp != null && cp.equals("")) {
			cpage = Integer.parseInt(cp);
		}
		
		editDAO editdao = sqlsession.getMapper(editDAO.class);
		List<ResumeDTO> elist = editdao.editlist(page, cpage);
		return elist;
	}
	
}
