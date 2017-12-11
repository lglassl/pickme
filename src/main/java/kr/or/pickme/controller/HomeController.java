package kr.or.pickme.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pickme.dto.LetterDTO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.service.HomeService;
import kr.or.pickme.service.LetterService;
import kr.or.pickme.service.MemberService;

/*
@class : HomeController
@Date : 2017-12-05
@Author : 강희창
@Desc : session을 이용한 접속자의 정보관리
*/

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	private HomeService homeService;
	
	@Autowired
	LetterService lService;
	
	@RequestMapping(value = "home.htm")
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		
		/*security로 로그인한 아이디 정보 - 2017-12-05*/
		Authentication id = SecurityContextHolder.getContext().getAuthentication();
		String username = id.getName();
		String solo_name = "";
		System.out.println("username " + username);
		HttpSession session = request.getSession();
		
		String auth = service.checkAuth(username);
		if(auth != null) {
			if(auth.equals("ROLE_USER")) {
				
				UserSoloDTO solo = service.getSoloInfo(username);
				
				//회원 아이디 session
				session.setAttribute("username", username);
				//회원 이름 session
				session.setAttribute("sname", solo.getSolo_name());
				solo_name = solo.getSolo_name();
				
			    /*본인에게 온 쪽지목록*/
	            List<LetterDTO> list = lService.letterList(username);
	            int letterCount = lService.letterCount(username);
	            
	            session.setAttribute("letterList", list);
	            session.setAttribute("lCount", letterCount);
				
			}else if(auth.equals("ROLE_COMP")) {
				
				UserComPpDTO comp =service.getCompInfo(username);
				session.setAttribute("username", username);
				session.setAttribute("cname", comp.getComp_name());
				session.setAttribute("clogo", comp.getComp_logo());
				
			}
		}
		
		/*쪽지보낼때 회원목록*/
	      List<UserSoloDTO> memberList = new ArrayList<>();
	      memberList = lService.memberList();
	      
	      session.setAttribute("memberList", memberList);
		
		//아이디 받아오기
		return homeService.compList(model, locale, request, solo_name, username);
	}
	
}
