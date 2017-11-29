package kr.or.pickme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pickme.controller.Comp_email;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.service.mailService;

@Controller
public class ResumeController {
	//@Autowired
	private mailService ms;
		
	
	private Comp_email ce;

	@RequestMapping("/userResume.htm")
	public String userResumeList() {
		return "resume.userResume";
	}
	
	@RequestMapping("/userResumeDetail.htm")
	public String userResumeDetailList() {
		return "resume.userResumeDetail";
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
		try {
			ce.sendMail();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("메일보냈어요");

		return "resume.compResume";
	}
}
