package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.resumeDAO;
import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.ResumeDTO;
@Service
public class resumeService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<ResumeDTO> resumeList(String ps, String cp){
		int page = 20;
		int cpage = 1;
		
		if(ps != null && ps.equals("")) {
			page = Integer.parseInt(ps);
		}
		if(cp != null && cp.equals("")) {
			cpage = Integer.parseInt(cp);
		}
		
		resumeDAO resumedao = sqlsession.getMapper(resumeDAO.class);
		List<ResumeDTO> list = resumedao.resumeList(page, cpage);
		return list;
	}
	
	public ResumeDTO resumeDetail(ResumeDTO username) {
		
		resumeDAO resumedao = sqlsession.getMapper(resumeDAO.class);
		ResumeDTO resumedto = resumedao.resumeDetail(username);
		
		return resumedto;
	}
	
	public void esUpdate(ResumeDTO dto) {
		System.out.println("service진입" + dto.toString());
		resumeDAO resumedao = sqlsession.getMapper(resumeDAO.class);
		System.out.println("service진입2");
		resumedao.esUpdate(dto);
		
		System.out.println("서비스" + dto);
		
	}
	
	
	public int psUpdate(ResumeDTO dto) {
		System.out.println("service진입" + dto.toString());
		resumeDAO resumedao = sqlsession.getMapper(resumeDAO.class);
		System.out.println("service진입2");
		try {
		resumedao.psUpdate(dto);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("서비스" + dto);
		return 0;
		
	}
}
