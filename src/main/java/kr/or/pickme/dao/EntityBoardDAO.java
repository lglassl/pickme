package kr.or.pickme.dao;


import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.or.pickme.dto.BoardEntityDTO;

public interface EntityBoardDAO {



		//소통 게시판 목록보기
		public List<BoardEntityDTO> entityList(int ps, int cp);
		
		//소통게시판 게시물 수
		public int getCount();

		//게시판 등록
		public int entityInsert(BoardEntityDTO boardEntityDto);
		
		//게시판 상세보기
		public BoardEntityDTO entityDetail(int entity_code);
		
		public int entityUpdate(BoardEntityDTO boardEntityDTO);
		
		public BoardEntityDTO getBoard(int entity_code);
		
		public int entitydelete(int entity_code); 
	}



