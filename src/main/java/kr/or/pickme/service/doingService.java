package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dao.doingDAO;
import kr.or.pickme.dao.editDAO;
import kr.or.pickme.dto.ResumeDTO;

@Service
public class doingService {
	@Autowired
	private SqlSession sqlsession;

		
		public List<ResumeDTO> doingList(String ps, String cp){
			int page = 20;
			int cpage = 1;
			
			if(ps != null && ps.equals("")) {
				page = Integer.parseInt(ps);
			}
			if(cp != null && cp.equals("")) {
				cpage = Integer.parseInt(cp);
			}
			
			doingDAO doingdao = sqlsession.getMapper(doingDAO.class);
			List<ResumeDTO> doinglist = doingdao.doingList(page, cpage);
			return doinglist;
	}

}
