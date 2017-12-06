package kr.or.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.pickme.controller.Comp_email;
import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.service.doingService;
import kr.or.pickme.service.mailService;
import kr.or.pickme.service.resumeService;

@Controller
public class ResumeController {
	@Autowired
	private mailService ms;
		
	@Autowired
	private Comp_email ce;
	
	
	@Autowired
	private resumeService resumeservice;
	
	@Autowired
	private doingService doingservice;
	
	@RequestMapping("/userResume.htm")
	public String userResumeList(String ps, String cp, Model model, HttpServletRequest request) {
		List<ResumeDTO> list = resumeservice.resumeList(ps, cp);
		
		model.addAttribute("list", list);
		return "resume.userResume";
	}
	
	@RequestMapping("/userResumeDetail.htm")
	public String resumeDetail(ResumeDTO username, Model model) {
			
			ResumeDTO resume = resumeservice.resumeDetail(username);
			
			model.addAttribute("resumedto", resume);
		return "resume.userResumeDetail";
	}
	
	@RequestMapping("/userResumeDoing.htm")
	public String resumeDoing(String ps, String cp, Model model, HttpServletRequest request) {
		
		List<ResumeDTO> doinglist = doingservice.doingList(ps, cp);
		
		model.addAttribute("doinglist", doinglist);
	return "resume.userResumeDoing";
}

	@RequestMapping("/esUpdate.htm")
	public String esUpdate(String username, HttpServletRequest request) {
		username = request.getParameter("username");
		String url = resumeservice.esUpdate(username);
		return url;
	}
	
	@RequestMapping("/psUpdate.htm")
	public String psUpdate(String username, HttpServletRequest request) {
		System.out.println("1");
		username = request.getParameter("username");
		System.out.println("2");
		String url = resumeservice.psUpdate(username);
		System.out.println("3");
		return url;
	}

	@RequestMapping("/compResume.htm")
	public String compResumeList() {
		return "resume.compResume";
	}
	
	@RequestMapping("/compResumeDetail.htm")
	public String compResumeDetailList() {
		return "resume.compResumeDetail";
	}

	@RequestMapping("/MailSend.htm" )
	public String mailSend() {
		System.out.println("ce 직전입니다");
		ce.sendMail();
		System.out.println("ce 직후입니다");
	return "redirect:compResume.htm";
	}
	
	
	
}

