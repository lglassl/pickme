package kr.or.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EditController {

	@RequestMapping("/userEditBoard.htm")
	public String userEditBoard() {
		return "edit.userEditBoard";
	}
	@RequestMapping("/adminEditBoard.htm")
	public String adminEditBoard() {
		return "edit.adminEditBoard";
	}
}
