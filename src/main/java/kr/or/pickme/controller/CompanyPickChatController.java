package kr.or.pickme.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyPickChatController {
	
	@Autowired
	private CompanyPickChatService companyPickChatService;
	
	@RequestMapping("/chat.htm")
	public String companyPickCalList(String pick_code, Model model, HttpServletRequest request) {
		return companyPickChatService.compChat(pick_code, model, request);
	}
	
	@RequestMapping("/comp_message.htm")
	public String companyPickMessage( Model model, HttpServletRequest request) {
		return companyPickChatService.companyPickMessage(model, request);
	}
}
