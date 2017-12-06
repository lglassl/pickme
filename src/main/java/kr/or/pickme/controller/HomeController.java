package kr.or.pickme.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.pickme.service.HomeService;
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
	
	/*@RequestMapping(value = "home.htm")
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		
		security로 로그인한 아이디 정보 - 2017-12-05
		Authentication id = SecurityContextHolder.getContext().getAuthentication();
		String username = id.getName();
		
		HttpSession session = request.getSession();
		
		String auth = service.checkAuth(username);
		if(auth != null) {
			if(auth.equals("ROLE_USER")) {
				
				UserSoloDTO solo = service.getSoloInfo(username);
						
				session.setAttribute("sname", solo.getSolo_name());
				
			}else if(auth.equals("ROLE_COMP")) {
				
				UserComPpDTO comp =service.getCompInfo(username);
				
				session.setAttribute("cname", comp.getComp_name());
				session.setAttribute("clogo", comp.getComp_logo());
				
			}
		}
		
		return "home.index";
	}*/
	
	
	@RequestMapping("home.htm")
	public String empList(@RequestParam(value="ps", required=false, defaultValue="5") String ps,
						@RequestParam(value="cp", required=false, defaultValue="1") String cp, 
						Model model, Locale locale, HttpServletRequest request) {
		//아이디 받아오기
		String username = "jung";
		return homeService.compList(ps, cp, model, locale, request, username);
	}
	
}