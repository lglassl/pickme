package kr.or.pickme.controller;

import java.io.UnsupportedEncodingException;
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

	@RequestMapping(value="/esUpdate.htm", method = RequestMethod.POST)
	public String esUpdate(HttpServletRequest request , ResumeDTO dto) {
		resumeservice.esUpdate(dto);
		System.out.println(dto.getUsername());
		return "redirect:userResume.htm";
	}
	
	
	@RequestMapping(value="/psUpdate.htm", method = RequestMethod.POST)
	public String psUpdate(HttpServletRequest request , ResumeDTO dto) {
		resumeservice.psUpdate(dto);
		System.out.println(dto.getUsername());
		return "redirect:userResume.htm";
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

