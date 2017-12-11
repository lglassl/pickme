package kr.or.pickme.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sun.org.apache.xml.internal.utils.NameSpace;


import kr.or.pickme.dao.QaBoardDAO;

import kr.or.pickme.dto.BoardQaDTO;
import kr.or.pickme.dto.QaReplyDTO;



@Service
public class QaService {
	
		@Autowired
		private SqlSession sqlsession;
		
		public List<BoardQaDTO> qaList(){
			
		
			
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			List<BoardQaDTO> list = qadao.qaList();
			
			return list;
		}
		

		public int getCount(){
			
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			int cnt = qadao.getCount();
			
			return cnt;
		}
		public String qaInsert(BoardQaDTO dto) {
			System.out.println("qa_notice : " + dto.getQa_notice());
			QaBoardDAO qaDao = sqlsession.getMapper(QaBoardDAO.class);
			qaDao.qaInsert(dto);
			
			System.out.println("여기서 걸리냐?"+dto.getQa_ctmt());
			System.out.println("서비스" + dto);
			System.out.println("qa_notice : " + dto.getQa_notice());
			String view = "redirect:qa_list.htm";
			return view;
		}
		public BoardQaDTO qaDetail(int qa_code) {
			
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			BoardQaDTO qadto = qadao.qaDetail(qa_code);
			
			return qadto;
		}
		
		public BoardQaDTO qaUpdateForm(Model model, int qa_code) {
			
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			BoardQaDTO dto = qadao.getBoard(qa_code);
		
			return dto; 
			
			
		}
		public void qaUpdate(BoardQaDTO dto) {
		
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
		
			int result = qadao.qaUpdate(dto);
		}
		
		public void qaDelete(int qa_code) {
			QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			qadao.qadelete(qa_code);
		}
		
		
		 public int regReply(Map<String, Object> paramMap) {
			
			 QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			 
		        return qadao.regReply(paramMap);
		    }
		 
		 
		 public int delReply(Map<String, Object> paramMap) {
			 System.out.println("서비스안" + paramMap);
			 
			 QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
			 int result = qadao.delReply(paramMap);
			 
			 System.out.println("result 서비스안" + result);
		     return result;
		   }
		 
		 public List<QaReplyDTO> getReplyList(Map<String, Object> paramMap) {
			 QaBoardDAO qadao = sqlsession.getMapper(QaBoardDAO.class);
		        List<QaReplyDTO> boardReplyList = qadao.getReplyList(paramMap);
		        
		       
		        //부모
		        List<QaReplyDTO> boardReplyListParent = new ArrayList<QaReplyDTO>();
		        //자식
		        List<QaReplyDTO> boardReplyListChild = new ArrayList<QaReplyDTO>();
		        //통합
		        List<QaReplyDTO> newBoardReplyList = new ArrayList<QaReplyDTO>();
		 
		        //1.부모와 자식 분리
		        for(QaReplyDTO boardReply: boardReplyList){
		            if(boardReply.getQa_re_depth().equals("0")){
		                boardReplyListParent.add(boardReply);
		            }else{
		                boardReplyListChild.add(boardReply);
		            }
		        }
		 
		        //2.부모를 돌린다.
		        for(QaReplyDTO boardReplyParent: boardReplyListParent){
		            //2-1. 부모는 무조건 넣는다.
		            newBoardReplyList.add(boardReplyParent);
		            //3.자식을 돌린다.
		            for(QaReplyDTO boardReplyChild: boardReplyListChild){
		                //3-1. 부모의 자식인 것들만 넣는다.
		                if(boardReplyParent.getQa_re_code().equals(boardReplyChild.getQa_parent())){
		                    newBoardReplyList.add(boardReplyChild);
		                }
		 
		            }
		 
		        }

		        return newBoardReplyList;
		    }
		 
}
