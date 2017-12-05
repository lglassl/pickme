package kr.or.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.service.editService;

@Controller
public class EditController {

	@Autowired
	private editService editservice;
	
	//첨삭완료 게시판
	@RequestMapping("/userEditBoard.htm")
	public String userEditBoard(String ps, String cp, Model model, HttpServletRequest request) {
		List<ResumeDTO> elist = editservice.editlist(ps, cp);
		
		model.addAttribute("elist", elist);
		return "edit.userEditBoard";
	}
	
	//관리자 첨삭관리게시판
	@RequestMapping("/adminEditBoard.htm")
	public String adminEditBoard() {
		return "edit.adminEditBoard";
	}
}
