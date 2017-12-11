package kr.or.pickme.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.email.Comp_email;
import kr.or.pickme.service.DoingBoardService;
import kr.or.pickme.service.MailService;
import kr.or.pickme.service.ResumeBoardService;

@Controller
public class ResumeBoardController {
	@Autowired
	private MailService ms;
		
	@Autowired
	private Comp_email ce;
	
	
	@Autowired
	private ResumeBoardService resumeservice;
	
	@Autowired
	private DoingBoardService doingservice;
	
	/*
	@class : ResumeBoardController
	@Date : 2017-11-28
	@Author : 정수민
	@Desc : userResumeList()
	*/
	/*개인회원 이력서와 자소서 상태 게시판형태로 보는 페이지*/
	@RequestMapping("/userResume.htm")
	public String userResumeList(Principal prin, Model model, HttpServletRequest request) {
		List<ResumeDTO> list = resumeservice.resumeList(prin.getName());
		model.addAttribute("list", list);
		return "resume.userResume";
	}
	
	/*
	@class : ResumeBoardController
	@Date : 2017-11-28
	@Author : 정수민
	@Desc : resumeDetail()
	*/
	/*개인회원 이력서와 자소서 상세히 보는 페이지*/
	@RequestMapping("/userResumeDetail.htm")
	public String resumeDetail(Principal prin, Model model) {
			String username = prin.getName();
			ResumeDTO resume = resumeservice.resumeDetail(username);
			
			model.addAttribute("resumedto", resume);
		return "resume.userResumeDetail";
	}
	
	/*
	@class : ResumeBoardController
	@Date : 2017-11-29
	@Author : 정수민
	@Desc : resumeDoing()
	*/
	/*개인회원 이력서와 자소서 작성중인 리스트 페이지*/
	@RequestMapping("/userResumeDoing.htm")
	public String resumeDoing(String ps, String cp, Model model, HttpServletRequest request) {
		
		List<ResumeDTO> doinglist = doingservice.doingList(ps, cp);
		
		model.addAttribute("doinglist", doinglist);
	return "resume.userResumeDoing";
}

	/*
	@class : ResumeBoardController
	@Date : 2017-12-06
	@Author : 정수민
	@Desc : esUpdate()
	*/
	/*첨삭요청을 통해 첨삭상태 변경*/
	@RequestMapping(value="/esUpdate.htm", method = RequestMethod.POST)
	public String esUpdate(HttpServletRequest request , int resu_code) {
		resumeservice.esUpdate(resu_code);
		return "redirect:userResume.htm";
	}
	
	/*
	@class : ResumeBoardController
	@Date : 2017-12-05
	@Author : 정수민
	@Desc : psUpdate()
	*/
	/*제출하기를 통해 제출상태 변경*/
	@RequestMapping(value="/psUpdate.htm", method = RequestMethod.POST)
	public String psUpdate(HttpServletRequest request , ResumeDTO dto) {
		resumeservice.psUpdate(dto);
		return "redirect:userResume.htm";
	}
	
	
	/*
	@class : ResumeBoardController
	@Date : 2017-11-30
	@Author : 정수민
	*/
	/*기업회원이 채용공고에 따라 지원자 리스트 보는 페이지*/
	@RequestMapping("/compResume.htm")
	public String compResumeList() {
		return "resume.compResume";
	}
	
	/*
	@class : ResumeBoardController
	@Date : 2017-11-30
	@Author : 정수민
	*/
	/*기업회원이 지원자 리스트에서 이력서+자소서+포트폴리오 파일 보는 페이지*/
	@RequestMapping("/compResumeDetail.htm")
	public String compResumeDetailList() {
		return "resume.compResumeDetail";
	}
	/*
	@class : ResumeBoardController
	@Date : 2017-12-02
	@Author : 정수민
	*/
	/*기업회원이 지원자 리스트 보는 페이지에서 합불결정하면 메일 발송*/
	@RequestMapping("/MailSend.htm" )
	public String mailSend() {
		ce.sendMail();
	return "redirect:compResume.htm";
	}
}

