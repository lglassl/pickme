package kr.or.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.service.AdminEditBoardService;

/////////////////////////////////////////////////전문가용 첨삭 컨트롤러

@Controller
public class AdminEditBoardController {

	@Autowired
	private AdminEditBoardService aeservice;
	
	/*
	@class : AdminEditBoardController 
	@Date : 2017-12-06
	@Author : 정수민
	*/
	/*첨삭전문가가  첨삭작업하는 페이지*/
	@RequestMapping("/adminEditBoard.htm")
	public String adminEditBoard(String ps, String cp, Model model, HttpServletRequest request) {
		List<ResumeDTO> aelist = aeservice.aelist(ps, cp);
		
		model.addAttribute("aelist", aelist);
		return "edit.adminEditBoard";
	}
	
	/*
	@class : AdminEditBoardController 
	@Date : 2017-12-08
	@Author : 정수민
	*/
	/*첨삭전문가가  첨삭상세 페이지에서 실제 첨삭내용 입력하는 페이지*/
	@RequestMapping(value = "/adminEditDetail.htm" , method= RequestMethod.GET)
	public String adminEditDetail(String username, int pick_code, Model model) {
		System.out.println("첨삭게시물의 username:" +username+"pick_code:"+ pick_code);
		
		List<CoverletterDTO2> cover2List = aeservice.editDetail(username, pick_code);
		for(int i = 0; i<cover2List.size(); i++) {
			System.out.println("covercode 뭐뭐있냐 "+cover2List.get(i).getCover_no());
		}
		
		model.addAttribute("Cover2List", cover2List);
		
		return "edit.adminEditDetail";
	}
	
	
	
	/////////////////////////////////첨삭 상세 페이지에서 등록(첨삭완료) 클릭하면 ///////////
	/*
	@class : AdminEditBoardController 
	@Date : 2017-12-09
	@Author : 정수민
	*/
	/*coverletter2에 첨삭내용 업데이트*/
	@RequestMapping(value = "/editUpdate.htm" , method= RequestMethod.POST)
	public String editUpdate(ResumeDTO resumeDTO) {
	
	System.out.println("첨삭업데이트 컨트롤러 입구");
	System.out.println("첨삭게시물의 username:" +resumeDTO.getUsername()+"pick_code:"+ resumeDTO.getPick_code());
	System.out.println(resumeDTO.getUsername());
		
	System.out.println("서비스 전");
	
	//상태변경
	 int statusResult = aeservice.statusUpdate(resumeDTO);
	 System.out.println("디비 업데이트 후 상태값 : " + statusResult);
	 //첨삭내용추가 
	 aeservice.editUpdate(resumeDTO);
	System.out.println("서비스 후");
	System.out.println(resumeDTO.getUsername());
	
		return "edit.adminEditBoard";
	}
}
