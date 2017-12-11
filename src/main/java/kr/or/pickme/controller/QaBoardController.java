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



import kr.or.pickme.dto.BoardQaDTO;


import kr.or.pickme.service.QaService;




@Controller
public class QaBoardController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private QaService qaservice;
	

	@Autowired
	private View jsonview;

	@RequestMapping(value = "/qa_list.htm" ,method= RequestMethod.GET)
public String qaList( Model model, HttpServletRequest request) {
		
		List<BoardQaDTO> list = qaservice.qaList();
		System.out.println("controller컨트롤러 list = " + list);
		model.addAttribute("list", list);
		System.out.println("list = " +list);
		int cnt = qaservice.getCount();
		model.addAttribute("cnt", cnt);
		//System.out.println("cnt = " +cnt);
		return "board_qa.qa_list";
	}
	@RequestMapping(value ="/qa_insertForm.htm" ,method= RequestMethod.GET)
	public String qaInsertForm() {
		System.out.println("여기는 컨트롤러");
		return  "board_qa.qa_insert";
	}
	
	
	@RequestMapping(value ="/qa_insert.htm" , method= RequestMethod.POST)
	public String qaInsert(BoardQaDTO dto) {
		
		
		System.out.println("insert controller" + dto);
		String url = qaservice.qaInsert(dto);
		
		return url;
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/qa_Detail.htm")
	public String qaDetail(@RequestParam Map<String, Object> paramMap,int qa_code, Model model) {
		
		BoardQaDTO qa = qaservice.qaDetail(qa_code);
		model.addAttribute("replyList", qaservice.getReplyList(paramMap));
		model.addAttribute("qadto", qa);
		
		return "board_qa.qa_detail";
	}
	@RequestMapping(value ="/qa_updateForm.htm", method= RequestMethod.GET)
	public String qaUpdateForm(int qa_code, Model model)throws Exception {
		System.out.println("qaUpdateFrom 컨트롤러");
		BoardQaDTO qa = qaservice.qaUpdateForm(model, qa_code);
		model.addAttribute("qadto", qa);
	
		return "board_qa.qa_update";
	}
	@RequestMapping(value ="/qa_update.htm", method= RequestMethod.POST)
	public String qaUpdate(HttpServletRequest request , BoardQaDTO dto) throws UnsupportedEncodingException {
		System.out.println("업데이트 컨트롤러22" + dto.toString());
		qaservice.qaUpdate(dto);
		
		System.out.println(dto.getQa_code());
		
		return "redirect:qa_list.htm";
	} 
	
	@RequestMapping(value = "/qa_delete.htm",  method= RequestMethod.GET)
	public String qaDelete(int qa_code) {
		System.out.println("삭제 컨트롤러" + qa_code);
		qaservice.qaDelete(qa_code);
		
		return "redirect:qa_list.htm";
	}
	
	 //AJAX 호출 (댓글 등록)
    @RequestMapping(value="/qa_re_insert", method=RequestMethod.POST)
    @ResponseBody
    public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
    	 System.out.println("paramMap는 : "+ paramMap);
    	
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("qa_re_pwd").toString(), null);
        paramMap.put("qa_re_pwd", password);
        System.out.println("댓글 컨트롤러" + password);
       
        //정보입력
        int result = qaservice.regReply(paramMap);
        System.out.println("서비스 들렀다가 : " + result);
        System.out.println( "paramMap 값-----------------"+paramMap.get("qa_re_code"));
        
        if(result>0){
            retVal.put("code", "OK");
            retVal.put("qa_re_code", paramMap.get("qa_re_code"));
            
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "등록에 실패 하였습니다.");
        }
        System.out.println("retVal : " + retVal);
       
        return retVal;
 
    }
 
    //AJAX 호출 (댓글 삭제)
    @RequestMapping(value="/qa_re_delete.htm", method=RequestMethod.POST)
    @ResponseBody
    public Object boardReplyDel(@RequestParam Map<String, Object> paramMap,ModelMap map) {
    	 
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("qa_re_pwd").toString(), null);
        paramMap.put("qa_re_pwd", password);
 
        //정보입력
         
        
        int result = qaservice.delReply(paramMap);
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
