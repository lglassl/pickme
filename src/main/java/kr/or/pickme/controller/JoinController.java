package kr.or.pickme.controller;

/*
@class : JoinController
@Date : 2017-11-28
@Author : 강희창
@Desc : 
*/

import java.io.FileOutputStream;

import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import kr.or.pickme.dao.JoinSoloDAO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.email.emailSend;
import kr.or.pickme.service.JoinService;

@Controller
public class JoinController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JoinService service;
	
	@Autowired 
	private View jsonview;
	
	@Autowired
	private emailSend es;

	/*
	@class : JoinController
	@Date : 2017-11-28
	@Author : 강희창
	@Desc : String joinSoloInsert()
	*/
	/*개인회원가입페이지*/
	@RequestMapping(value="/join_solo.htm", method = RequestMethod.GET)
	public String joinSoloInsert()  {
		return "join.join_solo";
	}

	/*
	@class : JoinController
	@Date : 2017-11-28
	@Author : 강희창
	@Desc : View joinSoloInsert(HttpServletRequest request, HttpServletResponse response, ModelMap map)
	*/
	/*개인회원가입기능*/
	@RequestMapping(value="/join_solo.htm", method = RequestMethod.POST)
	public @ResponseBody View joinSoloInsert(HttpServletRequest request, HttpServletResponse response, ModelMap map)  {
		
		UserSoloDTO usersolo = new UserSoloDTO();
		usersolo.setSolo_name(request.getParameter("solo_name"));
		usersolo.setUsername(request.getParameter("username"));
		usersolo.setSolo_gender(request.getParameter("solo_gender"));
		usersolo.setSolo_email(request.getParameter("solo_email"));
		usersolo.setSolo_addr(request.getParameter("solo_addr"));
		usersolo.setSolo_birth(request.getParameter("solo_birth"));
		usersolo.setSolo_cphone(request.getParameter("solo_cphone"));
		usersolo.setPassword(this.bCryptPasswordEncoder.encode(request.getParameter("password")));
				
		int result = 0;
		String msg = "";
		
		result = service.insertMember(usersolo);
		es.sendToSolo(usersolo);
		
		if(result > 1) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		map.addAttribute("msg", msg);
		
		return jsonview;
	}

	/*
	@class : JoinController
	@Date : 2017-12-01
	@Author : 강희창
	@Desc : String joinCompInsert()
	*/
	/*기업회원가입페이지*/
	@RequestMapping(value="/join_comp.htm", method = RequestMethod.GET)
	public String joinCompInsert()  {
		return "join.join_comp";
	}

	/*
	@class : JoinController
	@Date : 2017-12-01
	@Author : 강희창
	@Desc : String joinCompInsert(HttpServletRequest request, UserComPpDTO dto)
	*/
	/*기업회원가입기능*/
	@RequestMapping(value="/join_comp.htm", method = RequestMethod.POST)
	public String joinCompInsert(HttpServletRequest request, UserComPpDTO dto)  {
		
		dto.setPassword(this.bCryptPasswordEncoder.encode(request.getParameter("password")));
		
		//단일 파일
				CommonsMultipartFile imagefile = dto.getFile();
				
				String file = imagefile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/resources/bootstrap/upload/images");
				
				String fpath = path + "\\" + file;
				
				dto.setComp_logo("/resources/images/"+file);
				
				try {
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(imagefile.getBytes());
					fs.close();
					
					service.insertComp(dto);
				}catch (Exception e) {
					e.printStackTrace();
				}
		
		
		return "redirect:join_comp_ok.htm";
	}

	/*
	@class : JoinController
	@Date : 2017-11-30
	@Author : 강희창
	@Desc : String loginUser()
	*/
	/*로그인 페이지*/
	@RequestMapping(value="/login.htm" , method = RequestMethod.GET)
	public String loginUser() {
		return "member.login";
	}

	/*
	@class : JoinController
	@Date : 2017-11-29
	@Author : 강희창
	@Desc : String roleUpdate(String username)
	*/
	/*개인회원메일인증*/
	@RequestMapping("/role_update.htm")
	public String roleUpdate(String username) {
		
		service.rollUpdate(username);
		
		return "join.join_solo_ok";
		
	}

	/*
	@class : JoinController
	@Date : 2017-12-01
	@Author : 강희창
	@Desc : String joinCompOk()
	*/
	/*기업회원가입완료*/
	@RequestMapping("/join_comp_ok.htm")
	public String joinCompOk() {
		
		return "join.join_comp_ok";
		
	}

	/*
	@class : JoinController
	@Date : 2017-11-29
	@Author : 강희창
	@Desc : void fbsignup(HttpServletRequest request, String password)
	*/
	//페이스북 가입 
	@RequestMapping("/fbsignup.htm")
	public @ResponseBody void fbsignup(HttpServletRequest request, String password) throws Exception {
		
		UserSoloDTO dto = new UserSoloDTO();
		dto.setUsername(request.getParameter("username"));
		dto.setSolo_name(request.getParameter("solo_name"));
		dto.setSolo_gender(request.getParameter("solo_gender"));
		dto.setSolo_email(request.getParameter("solo_email"));
		password = this.bCryptPasswordEncoder.encode("987654321");
		
		dto.setPassword(password);
		
		service.fbsignup(dto);
		es.sendToSolo(dto);
		
	}

	/*
	@class : JoinController
	@Date : 2017-11-29
	@Author : 강희창
	@Desc : View idCheckSolo(String username, ModelMap map)
	*/
	/*개인회원 아이디 중복체크*/
	@RequestMapping("/idCheckSolo.htm")
	public View idCheckSolo(String username, ModelMap map) {
		
		int result = 0;
		String msg;
		
		result = service.idCheckSolo(username);
		
		if(result > 0) {
			msg="no";
		}else {
			msg="ok";
		}
		
		map.addAttribute("msg", msg);
		
		return jsonview;
		
	}

	/*
	@class : JoinController
	@Date : 2017-11-29
	@Author : 강희창
	@Desc : View idCheckComp(String username, ModelMap map)
	*/
	/*기업회원 아이디 중복체크*/
	@RequestMapping("/idCheckComp.htm")
	public View idCheckComp(String username, ModelMap map) {
		
		int result = 0;
		String msg;
		
		result = service.idCheckComp(username);
		
		if(result > 0) {
			msg="no";
		}else {
			msg="ok";
		}
		
		map.addAttribute("msg", msg);
		
		return jsonview;
		
	}
		

}
