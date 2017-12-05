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
	
	public String esUpdate(String username) {

		resumeDAO resumeDao = sqlsession.getMapper(resumeDAO.class);
		resumeDao.esUpdate(username);
		
		System.out.println("리다이렉트 직전 es");
		String view = "redirect:userResume.htm";
		return view;
	}
	
	public String psUpdate(String username) {

		resumeDAO resumeDao = sqlsession.getMapper(resumeDAO.class);
		System.out.println("resumeDAO=" + resumeDao);
		resumeDao.psUpdate(username);
		System.out.println("username=" + username );
		String view = "redirect:userResume.htm";
		return view;
	}
	
}
