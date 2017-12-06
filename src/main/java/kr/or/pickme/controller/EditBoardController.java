package kr.or.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.service.EditBoardService;

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
	@Date : 2017-12-02
	@Author : 정수민
	*/
	/*첨삭전문가가  첨삭작업하는 페이지*/
	@RequestMapping("/adminEditBoard.htm")
	public String adminEditBoard() {
		return "edit.adminEditBoard";
	}
}
