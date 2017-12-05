package kr.or.pickme.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.sun.javafx.collections.MappingChange.Map;

import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.service.EntityService;



@Controller
public class EntityBoardControlller {
	
	@Autowired
	private EntityService entityservice;
	
	
	
	@RequestMapping(value = "/entity_list.htm" ,method= {RequestMethod.POST,RequestMethod.GET})
public String entityList(String ps, String cp, Model model, HttpServletRequest request) {
		//System.out.println("여기는 컨트롤러" + cp + ps + model + request);
		List<BoardEntityDTO> list = entityservice.entityList(ps, cp);
		//System.out.println("controller컨트롤러 list = " + list);
		model.addAttribute("list", list);
		//System.out.println("list = " +list);
		int cnt = entityservice.getCount();
		model.addAttribute("cnt", cnt);
		//System.out.println("cnt = " +cnt);
		return "board_entity.entity_list";
	}
	@RequestMapping(value ="/entity_insertForm.htm" ,method= RequestMethod.GET)
	public String entityInsertForm() {
		System.out.println("여기는 컨트롤러");
		return  "board_entity.entity_insert";
	}
	@RequestMapping(value ="/entity_insert.htm" , method= RequestMethod.POST)
	public String entityInsert(BoardEntityDTO dto) {
		
		
		System.out.println("insert controller" + dto);
		String url = entityservice.entityInsert(dto);
		
		return url;
	}
	
	
	
	@RequestMapping(value = "/entity_Detail.htm" , method= RequestMethod.GET)
	public String entityDetail(int entity_code, Model model) {
		
		BoardEntityDTO entity = entityservice.entityDetail(entity_code);
		
		model.addAttribute("entitydto", entity);
		
		return "board_entity.entity_detail";
	}
	@RequestMapping(value ="/entity_updateForm.htm", method= RequestMethod.GET)
	public String entityUpdateForm(int entity_code, Model model)throws Exception {
		System.out.println("entityUpdateFrom 컨트롤러");
		BoardEntityDTO entity = entityservice.entityUpdateForm(model, entity_code);
		model.addAttribute("entitydto", entity);
	
		return "board_entity.entity_update";
	}
	@RequestMapping(value ="/entity_update.htm", method= RequestMethod.POST)
	public String entityUpdate(HttpServletRequest request , BoardEntityDTO dto) throws UnsupportedEncodingException {
		System.out.println("업데이트 컨트롤러22" + dto.toString());
		entityservice.entityUpdate(dto);
		System.out.println(dto.getEntity_code());
		return "redirect:entity_list.htm";
	} 
	
	@RequestMapping(value = "/entity_delete.htm",  method= RequestMethod.GET)
	public String entityDelete(int entity_code) {
		System.out.println("삭제 컨트롤러" + entity_code);
		entityservice.entityDelete(entity_code);
		
		return "redirect:entity_list.htm";
	}
}
