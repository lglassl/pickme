package kr.or.pickme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.View;

@Service
public class CompanyPickChatService {
	@Autowired
	private SqlSession sqlsession; 
	
	@Autowired
	private View jsonview;
	
	public String compChat(String pick_code, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.setAttribute("pick_code", pick_code);
		return "comp_chat.comp_mult_chat";
	}
	
	public String companyPickMessage(Model model, HttpServletRequest request) {
		return "comp_chat.comp_message";
	}
}
