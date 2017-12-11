package kr.or.pickme.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sun.org.apache.xml.internal.utils.NameSpace;

import kr.or.pickme.dao.EntityBoardDAO;
import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.EntityReplyDTO;


@Service
public class EntityService {
	
		@Autowired
		private SqlSession sqlsession;
		
		public List<BoardEntityDTO> entityList(){
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			List<BoardEntityDTO> list = entitydao.entityList();
			return list;
		}
		

		public int getCount(){
			
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			int cnt = entitydao.getCount();
			
			return cnt;
		}
		public String entityInsert(BoardEntityDTO dto) {
			System.out.println("entity_notice : " + dto.getEntity_notice());
			EntityBoardDAO entityDao = sqlsession.getMapper(EntityBoardDAO.class);
			entityDao.entityInsert(dto);
			
			System.out.println("여기서 걸리냐?"+dto.getEntity_ctmt());
			System.out.println("서비스" + dto);
			System.out.println("entity_notice : " + dto.getEntity_notice());
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
		
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
		
			int result = entitydao.entityUpdate(dto);
		}
		
		public void entityDelete(int entity_code) {
			EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			entitydao.entitydelete(entity_code);
		}
		
		
		 public int regReply(Map<String, Object> paramMap) {
			
			 EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			 
		        return entitydao.regReply(paramMap);
		    }
		 
		 
		 public int delReply(Map<String, Object> paramMap) {
			 System.out.println("서비스안" + paramMap);
			 
			 EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
			 int result = entitydao.delReply(paramMap);
			 
			 System.out.println("result 서비스안" + result);
		     return result;
		   }
		 
		 public List<EntityReplyDTO> getReplyList(Map<String, Object> paramMap) {
			 EntityBoardDAO entitydao = sqlsession.getMapper(EntityBoardDAO.class);
		        List<EntityReplyDTO> boardReplyList = entitydao.getReplyList(paramMap);
		        
		       
		        //부모
		        List<EntityReplyDTO> boardReplyListParent = new ArrayList<EntityReplyDTO>();
		        //자식
		        List<EntityReplyDTO> boardReplyListChild = new ArrayList<EntityReplyDTO>();
		        //통합
		        List<EntityReplyDTO> newBoardReplyList = new ArrayList<EntityReplyDTO>();
		 
		        //1.부모와 자식 분리
		        for(EntityReplyDTO boardReply: boardReplyList){
		            if(boardReply.getEntity_re_depth().equals("0")){
		                boardReplyListParent.add(boardReply);
		            }else{
		                boardReplyListChild.add(boardReply);
		            }
		        }
		 
		        //2.부모를 돌린다.
		        for(EntityReplyDTO boardReplyParent: boardReplyListParent){
		            //2-1. 부모는 무조건 넣는다.
		            newBoardReplyList.add(boardReplyParent);
		            //3.자식을 돌린다.
		            for(EntityReplyDTO boardReplyChild: boardReplyListChild){
		                //3-1. 부모의 자식인 것들만 넣는다.
		                if(boardReplyParent.getEntity_re_code().equals(boardReplyChild.getEntity_parent())){
		                    newBoardReplyList.add(boardReplyChild);
		                }
		 
		            }
		 
		        }

		        return newBoardReplyList;
		    }
		 
}
