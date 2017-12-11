package kr.or.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.service.AdminEditBoardService;
import kr.or.pickme.service.EditBoardService;

////////////////////////////////////////개인회원용 첨삭 컨트롤러

@Controller
public class EditBoardController {

	@Autowired
	private EditBoardService editservice;
	
	
	/*
	@class : EditBoardController 
	@Date : 2017-12-02
	@Author : 정수민
	*/
	/*개인회원이 첨삭요청하면 이동하는 페이지*/
	
	@RequestMapping("/userEditBoard.htm")
	public String userEditBoard(String ps, String cp, Model model, HttpServletRequest request) {
		List<ResumeDTO> elist = editservice.editlist(ps, cp);
		
		model.addAttribute("elist", elist);
		
		return "edit.userEditBoard";
	}

	/*
	@class : EditBoardController 
	@Date : 2017-12-08
	@Author : 정수민
	*/
	/*개인회원이 첨삭완료된 게시물을 확인하는 상세페이지*/
	
	@RequestMapping(value = "/userEditDetail.htm" , method= RequestMethod.GET)
	public String userEditDetail(String username, int pick_code, Model model) {
		
		List<CoverletterDTO2> cover2 = editservice.userEditDetail(username, pick_code);
		
		model.addAttribute("Cover2List", cover2);
		
		return "edit.userEditDetail";
	}
	
}
