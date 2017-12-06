package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.View;

import kr.or.pickme.dao.CompPickInfoDAO;
import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.LikeCartDTO;
import kr.or.pickme.dto.UserComPpDTO;

@Service
public class CompanyPickBoardService {
	
	@Autowired
	private SqlSession sqlsession; 
	
	@Autowired
	private View jsonview;
	
	public View filterSearch(String job_field, String username, String comp_name, Model model) {
		CompPickInfoDAO compPickInfoDAO = sqlsession.getMapper(CompPickInfoDAO.class);
		if(comp_name.equals("")) {	//필터 공고 리스트
			//직무 필터 공고 리스트
			List <CompPickInfoDTO> filterCompPickInfoList = compPickInfoDAO.filterCompList(job_field);
			System.out.println("filter : " + filterCompPickInfoList.get(0).toString());
			model.addAttribute("filterCompPickInfoList", filterCompPickInfoList);
			
			//기업정보 및 기업회원 리스트
			List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
			System.out.println("user : " + userComPpList.size());
			model.addAttribute("userComPpList", userComPpList);
			
		}else {	//사용자 기업 검색 공고 리스트
			System.out.println("comp_name : " + comp_name);
			//기업 공고 리스트
			List <CompPickInfoDTO> compPickList = compPickInfoDAO.compList();
			System.out.println("comp : " + compPickList.get(1).toString());
			model.addAttribute("filterCompPickInfoList", compPickList);
			
			//기업정보 및 기업회원 리스트
			List <UserComPpDTO> userComPpNameList = compPickInfoDAO.userCompNameList(comp_name);
			System.out.println("123");
			System.out.println("comp_name_user : " + userComPpNameList.size());
			model.addAttribute("userComPpList", userComPpNameList);
			
		}
		//좋아요
		//로그인한 유저가 좋아요를 눌렀는지 확인
		List <LikeCartDTO> listLike = compPickInfoDAO.likeList(username);
		System.out.println("listLike : ");
		model.addAttribute("listLike", listLike);
		
		return jsonview;
	}
	
}
