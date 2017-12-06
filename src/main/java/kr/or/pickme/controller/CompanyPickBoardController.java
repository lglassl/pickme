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

@Controller
public class CompanyPickBoardController {
	
	@Autowired
	private CompanyPickBoardService companyPickBoardService;
	
	@RequestMapping("/comp_pick_list.htm")
	public String compList(@RequestParam(value="ps", required=false, defaultValue="5") String ps,
						@RequestParam(value="cp", required=false, defaultValue="1") String cp, 
						Model model, HttpServletRequest request) {
		
		int page = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		
		//List<Emp_DTO> list = empservice.empList(page, cpage);
		//model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("cpage", cpage);
		
		int cnt = 10;
		//int cnt = empservice.getCount();
		model.addAttribute("cnt", cnt);
		
		int pagecount = 0;	//전체 페이지
		if(cnt % page == 0) {
			pagecount = cnt / page;
		}else {
			pagecount = (cnt / page) + 1;
		}

		model.addAttribute("pagecount", pagecount);
		
		return "comp_pick.comp_pick_list";
	}
	
	@RequestMapping("/comp_pick_cal.htm")
	public String companyPickCalList() {
		return "comp_pick.comp_pick_cal";
	}
	
	@RequestMapping(value = "filterSearch.htm", method=RequestMethod.POST)
	public View compFilterSearch(String job_field, String username, String comp_name, Model model) {
		System.out.println("job : " + job_field);
		return companyPickBoardService.filterSearch(job_field, username, comp_name, model);
	}
}
