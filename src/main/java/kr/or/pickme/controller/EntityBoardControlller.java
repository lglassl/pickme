package kr.or.pickme.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;


import kr.or.pickme.dto.BoardEntityDTO;
import kr.or.pickme.dto.EntityReplyDTO;
import kr.or.pickme.service.EntityService;



/*
@class : EntityBoardController 
@Date : 2017-12-02
@Author : 오영진
@Desc : 소통 게시판 관련 controller
*/


@Controller
public class EntityBoardControlller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private EntityService entityservice;
	

	@Autowired
	private View jsonview;

	@RequestMapping(value = "/entity_list.htm" ,method= RequestMethod.GET)
	public String entityList( Model model, HttpServletRequest request) {
		//System.out.println("여기는 컨트롤러" + cp + ps + model + request);
		List<BoardEntityDTO> list = entityservice.entityList();
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
	
	
	@RequestMapping(value = "/entity_Detail.htm")
	public String entityDetail(@RequestParam Map<String, Object> paramMap,int entity_code, Model model) {
		
		BoardEntityDTO entity = entityservice.entityDetail(entity_code);
		model.addAttribute("replyList", entityservice.getReplyList(paramMap));
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
	
	 //AJAX 호출 (댓글 등록)
    @RequestMapping(value="/entity_re_insert", method=RequestMethod.POST)
    @ResponseBody
    public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
    	 System.out.println("paramMap는 : "+ paramMap);
    	
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("entity_re_pwd").toString(), null);
        paramMap.put("entity_re_pwd", password);
        System.out.println("댓글 컨트롤러" + password);
       
        //정보입력
        int result = entityservice.regReply(paramMap);
        System.out.println("서비스 들렀다가 : " + result);
        System.out.println( "paramMap 값-----------------"+paramMap.get("entity_re_code"));
        
        if(result>0){
            retVal.put("code", "OK");
            retVal.put("entitiy_re_code", paramMap.get("entity_re_code"));
            
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "등록에 실패 하였습니다.");
        }
        System.out.println("retVal : " + retVal);
       
        return retVal;
 
    }
 
    //AJAX 호출 (댓글 삭제)
    @RequestMapping(value="/entity_re_delete.htm", method=RequestMethod.POST)
    @ResponseBody
    public Object boardReplyDel(@RequestParam Map<String, Object> paramMap,ModelMap map) {
    	 
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("entity_re_pwd").toString(), null);
        paramMap.put("entity_re_pwd", password);
 
        //정보입력
         
        
        int result = entityservice.delReply(paramMap);
        System.out.println("서비스 나오고 : " + result);
        if(result> 0){
            retVal.put("code", "OK");
            System.out.println("result ok : " + result);
        }else{
        	System.out.println("result fail : " + result);
            retVal.put("code", "FAIL");
            
            retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
        }
        System.out.println("retVal : " + retVal);
 
        return retVal;
 
    
    }
    /*public String boardReplyDel(String entity_re_pwd, int entity_re_code) {
    	System.out.println("delete 컨트롤" + entity_re_pwd);
        //리턴값
        String retVal = "";
        
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(entity_re_pwd, null);
        System.out.println("pwd : "+password);
        
        //정보입력
        int result = entityservice.delReply(password, entity_re_code);
        System.out.println("result 값 " + result);
        if(result>0){
        	System.out.println("result 값2 " + result);
            retVal= "OK";
          
        }else{
        	System.out.println("result 값3" + result);
            retVal="FAIL";
        }
 
        return retVal;
 
    }*/

}
