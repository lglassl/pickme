package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.View;

import kr.or.pickme.dao.LikeCartDAO;
import kr.or.pickme.dto.LikeCartDTO;

@Service
public class LikeCartService {
	
	@Autowired
	private SqlSession sqlsession; 
	
	@Autowired
	private View jsonview;
	
	public View likeCart(LikeCartDTO likeCartDTO, Model model) {
		System.out.println("tt");
		LikeCartDAO likeCartDAO = sqlsession.getMapper(LikeCartDAO.class);
		int error = 0;
		System.out.println("rr");
		System.out.println("dto : " + likeCartDTO.toString());
		try {
			List <LikeCartDTO> likedList = likeCartDAO.likeSelect(likeCartDTO);
			if(likedList.size() > 0) {
				error = likeCartDAO.likeDelete(likeCartDTO);
				error = 1;
			}else {
				error = likeCartDAO.likeInsert(likeCartDTO);
				error = 2;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("dd");
		model.addAttribute("likeResult", error);
		
		return jsonview;
	}
}
