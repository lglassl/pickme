package kr.or.pickme.dao;


import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


import kr.or.pickme.dto.BoardQaDTO;
import kr.or.pickme.dto.QaReplyDTO;


public interface QaBoardDAO {



		//소통 게시판 목록보기
		public List<BoardQaDTO> qaList();
		
		//소통게시판 게시물 수
		public int getCount();

		//게시판 등록
		public int qaInsert(BoardQaDTO boardQaDto);
		
		//게시판 상세보기
		public BoardQaDTO qaDetail(int qa_code);
		
		public int qaUpdate(BoardQaDTO BoardQaDTO);
		
		public BoardQaDTO getBoard(int qa_code);
		
		public int qadelete(int qa_code); 
		
		///////////////
		public int regReply(Map<String, Object> paramMap);
	     
	    public List<QaReplyDTO> getReplyList(Map<String, Object> paramMap);
	     
	    public int delReply(Map<String, Object> paramMap);
	}



