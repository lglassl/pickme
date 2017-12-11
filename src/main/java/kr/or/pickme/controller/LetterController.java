package kr.or.pickme.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

/*
@class : LetterController
@Date : 2017-12-08
@Author : 강희창
@Desc : 
*/

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import kr.or.pickme.dto.LetterDTO;
import kr.or.pickme.service.LetterService;

@Controller
public class LetterController {
	
	@Autowired
	private LetterService service;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	/*쪽지보내기*/
	@RequestMapping("/send_letter.htm")
	public String sendLetter(LetterDTO letter) {
		
		service.sendLetter(letter);
		
		return "redirect:home.htm";
		
	}
	
	/*쪽지보기*/
	@RequestMapping("/show_letter.htm")
	public View showLetter(int letter_no, Model model) {

		try {
			LetterDTO dto = service.showLetter(letter_no);
			System.out.println(dto);
			
			if(dto.getLetter_no() != 0) {
				model.addAttribute("msg", "success");
				model.addAttribute("letter", dto);
			}
			
		}catch (Exception e) {
			System.out.println("예외 발생 : " + e.getMessage());
		}
		
		
		return jsonview;
		
	}

}
