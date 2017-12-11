package kr.or.pickme.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import kr.or.pickme.service.CompanyPickBoardService;
/*
@class : CompanyPickBoardController
@Date : 2017-12-05
@Author : 임혜성
@Desc : 채용공고 관련 controller
*/
@Controller
public class CompanyPickBoardController {
	
	@Autowired
	private CompanyPickBoardService companyPickBoardService;
	
	@RequestMapping("/comp_pick_list.htm")
	public String compList(Model model) {
		return companyPickBoardService.compList(model);
	}
	
	@RequestMapping("/comp_pick_cal.htm")
	public String companyPickCalList(Model model) {
		return companyPickBoardService.compListCal(model);
	}
	
	@RequestMapping(value = "filterSearch.htm", method=RequestMethod.POST)
	public View compFilterSearch(String job_field, String username, String comp_name, Model model) {
		System.out.println("job : " + job_field);
		return companyPickBoardService.filterSearch(job_field, username, comp_name, model);
	}
}
