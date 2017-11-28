package kr.or.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyPickBoardController {
	
	@RequestMapping("/comp_pick.htm")
	public String companyPickAllList() {
		return "comp_pick.comp_pick_all_list";
	}
}
