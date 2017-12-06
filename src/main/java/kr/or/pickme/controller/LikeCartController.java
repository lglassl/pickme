package kr.or.pickme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.pickme.dto.LikeCartDTO;
import kr.or.pickme.service.LikeCartService;

@Controller
public class LikeCartController {
	
	@Autowired
	private LikeCartService likeCartService;
	
	@RequestMapping(value="likeAjax.htm", method=RequestMethod.POST)
	public View likeAjax(@RequestBody LikeCartDTO likeCartDTO, Model model) {
		System.out.println("드러와");
		return likeCartService.likeCart(likeCartDTO, model);
	}
}
