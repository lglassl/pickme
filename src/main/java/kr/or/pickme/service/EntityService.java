package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sun.org.apache.xml.internal.utils.NameSpace;

import kr.or.pickme.dao.EntityBoardDAO;
import kr.or.pickme.dto.BoardEntityDTO;


@Service
public class EntityService {
	
		@Autowired
		private SqlSession sqlsession;
		
		public List<BoardEntityDTO> entityList(String ps, String cp){
			
			int page = 20;
			int cpage = 1;
			
			if(ps != null && ps.equals("")) {
				page = Integer.parseInt(ps);
			}
			if(cp != null && cp.equals("")) {
				cpage = Integer.parseInt(cp);
			}
			
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			List<BoardEntityDTO> list = entitydao.entityList(page, cpage);
			
			return list;
		}
		

		public int getCount(){
			
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			int cnt = entitydao.getCount();
			
			return cnt;
		}
		public String entityInsert(BoardEntityDTO dto) {

			EntityBoardDAO entityDao = sqlsession.getMapper(EntityBoardDAO.class);
			entityDao.entityInsert(dto);
			System.out.println("서비스" + dto);
			String view = "redirect:entity_list.htm";
			return view;
		}
		public BoardEntityDTO entityDetail(int entity_code) {
			
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			BoardEntityDTO entitydto = entitydao.entityDetail(entity_code);
			
			return entitydto;
		}
		
		public BoardEntityDTO entityUpdateForm(Model model, int entity_code) {
			
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			BoardEntityDTO dto = entitydao.getBoard(entity_code);
		
			return dto; 
			
			
		}
		public void entityUpdate(BoardEntityDTO dto) {
			System.out.println("service진입" + dto.toString());
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			System.out.println("service진입2");
			int result = entitydao.entityUpdate(dto);
			System.out.println("result : " + result);
			System.out.println("서비스" + dto);
		}
		
		public void entityDelete(int entity_code) {
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			entitydao.entitydelete(entity_code);
		}
}
