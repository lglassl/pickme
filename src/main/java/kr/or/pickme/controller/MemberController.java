package kr.or.pickme.controller;

/*
@class : MemberController
@Date : 2017-12-03
@Author : 강희창
@Desc : 
*/

import java.io.FileOutputStream;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.email.emailSend;
import kr.or.pickme.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private MemberService service;
	
	@Autowired 
	private View jsonview;
	
	@Autowired
	private emailSend es;	



	/*
	@class : MemberController
	@Date : 2017-12-03
	@Author : 강희창
	@Desc : String idFind()
	*/
	/*개인회원아이디찾기*/
	@RequestMapping(value="/member_solo_find.htm", method=RequestMethod.GET)
	public String idFind() {
		
		return "member.member_id_find";
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-03
	@Author : 강희창
	@Desc : @ResponseBody View idFind(HttpServletRequest request, ModelMap map)
	*/
	/*개인회원아이디찾기기능*/
	@RequestMapping(value="/member_solo_find.htm", method=RequestMethod.POST)
	public @ResponseBody View idFind(HttpServletRequest request, ModelMap map) {
		
		String result;
		String msg;
		
		UserSoloDTO dto = new UserSoloDTO();
		
		dto.setSolo_name(request.getParameter("solo_name"));
		dto.setSolo_email(request.getParameter("solo_email"));
		
		result = service.idFind(dto);
		
		if(!result.equals("no")) {
			msg = "ok";
		}else {
			msg = "no";
		}

		map.addAttribute("msg", msg);
		map.addAttribute("result", result);
		
		return jsonview;
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-03
	@Author : 강희창
	@Desc : String pwdRe()
	*/
	/*개인회원비밀번호재설정*/
	@RequestMapping(value="/member_pwd_re.htm", method=RequestMethod.GET)
	public String pwdRe() {
		
		return "member.member_password";
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-03
	@Author : 강희창
	@Desc : @ResponseBody View pwdRe(HttpServletRequest request, ModelMap map)
	*/
	/*개인회원비밀번호재설정*/
	@RequestMapping(value="/member_pwd_re.htm", method=RequestMethod.POST)
	public @ResponseBody View pwdRe(HttpServletRequest request, ModelMap map) {
		
		int result;
		String msg = null;
		
		int newPwd = (int)(Math.random()*1000000+1);
		String pwd = Integer.toString(newPwd);
		System.out.println(newPwd);
		
		UserSoloDTO dto = new UserSoloDTO();
		
		dto.setUsername(request.getParameter("username"));
		dto.setSolo_email(request.getParameter("solo_email"));
		dto.setPassword(this.bCryptPasswordEncoder.encode(pwd));
		
		result = service.pwdRe(dto);

		if(result > 0) {
			result += service.newPwdUpdate(dto);
		}else {
			msg = "no";
			return jsonview;
		}
		
		if(result > 1) {
			es.sendToSoloPwd(dto, pwd);
			msg = "ok";
		}
		System.out.println(result);

		map.addAttribute("msg", msg);
		
		return jsonview;
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : @ResponseBody View idFindComp(HttpServletRequest request, ModelMap map)
	*/
	/*기업회원아이디찾기기능*/
	@RequestMapping(value="/member_comp_find.htm", method=RequestMethod.POST)
	public @ResponseBody View idFindComp(HttpServletRequest request, ModelMap map) {
		
		String result;
		String msg;
		
		UserComPpDTO dto = new UserComPpDTO();
		
		dto.setComp_num(request.getParameter("comp_num"));
		dto.setComp_name(request.getParameter("comp_name"));
		
		result = service.idFindComp(dto);
		
		if(!result.equals("no")) {
			msg = "ok";
		}else {
			msg = "no";
		}

		map.addAttribute("msg", msg);
		map.addAttribute("result", result);
		
		return jsonview;
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : @ResponseBody View pwdReComp(HttpServletRequest request, ModelMap map)
	*/
	/*기업회원비밀번호재설정*/
	@RequestMapping(value="/member_pwd_comp.htm", method=RequestMethod.POST)
	public @ResponseBody View pwdReComp(HttpServletRequest request, ModelMap map) {
		
		int result;
		String msg = null;
		
		int newPwd = (int)(Math.random()*1000000+1);
		String pwd = Integer.toString(newPwd);
		System.out.println(newPwd);
		
		UserComPpDTO dto = new UserComPpDTO();
		
		dto.setUsername(request.getParameter("username"));
		dto.setComp_pp_email(request.getParameter("comp_pp_email"));
		dto.setPassword(this.bCryptPasswordEncoder.encode(pwd));
		
		result = service.pwdReComp(dto);

		if(result > 0) {
			result += service.newPwdUpdateComp(dto);
		}else {
			msg = "no";
			return jsonview;
		}
		
		if(result > 1) {
			es.sendToCompPwd(dto, pwd);
			msg = "ok";
		}
		System.out.println(result);

		map.addAttribute("msg", msg);
		
		return jsonview;
		
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberLogin()
	*/
	/*회원정보확인 로그인페이지*/
	@RequestMapping(value="/member_confirm.htm", method=RequestMethod.GET)
	public String memberLogin() {
		
		return "member.member_confirm";
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberLogin(@RequestParam("password") String password, Principal prin)
	*/
	/*회원정보확인 로그인 작업*/
	@RequestMapping(value="/member_confirm.htm", method=RequestMethod.POST)
	public String memberLogin(@RequestParam("password") String password, Principal prin) {
		
		String viewpage;
		
		UserSoloDTO dto = service.getSoloInfo(prin.getName());
		String encodedPassword = dto.getPassword();
		
		boolean result = bCryptPasswordEncoder.matches(password, encodedPassword);
		
		if(result) {
			viewpage = "redirect:member_update.htm";
		}else {
			viewpage = "redirect:member_confirm.htm";
		}
		
		return viewpage;
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberSolo(Principal prin, Model model)
	*/
	/*회원정보페이지*/
	@RequestMapping(value="/member_update.htm", method=RequestMethod.GET)
	public String memberSolo(Principal prin, Model model) {
		
		UserSoloDTO dto = service.getSoloInfo(prin.getName());
		String email = dto.getSolo_email();
		
		String gender = dto.getSolo_gender().trim();
		
		int emailNm = email.indexOf("@");
		String email01 = email.substring(0, emailNm);
		String email02 = email.substring(emailNm+1);
		
		String address = dto.getSolo_addr();
		
		int addrNm01 = address.indexOf("/");
		int addrNm02 = address.indexOf("-");
		String zipcode = address.substring(0, addrNm01);
		String addr01 = address.substring(addrNm01 + 1, addrNm02);
		String addr02 = address.substring(addrNm02 + 1);
		
		model.addAttribute("dto", dto);
		model.addAttribute("email01", email01);
		model.addAttribute("email02", email02);
		
		model.addAttribute("zipcode", zipcode);
		model.addAttribute("addr01", addr01);
		model.addAttribute("addr02", addr02);
		
		return "member.member_update";
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : @ResponseBody View memberSolo(HttpServletRequest request, HttpServletResponse response, ModelMap map)
	*/
	/*회원정보수정*/
	@RequestMapping(value="/member_update.htm", method=RequestMethod.POST)
	public @ResponseBody View memberSolo(HttpServletRequest request, HttpServletResponse response, ModelMap map)  {
		
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
		
		result = service.soloUpdate(usersolo);
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		map.addAttribute("msg", msg);
		
		return jsonview;
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberLoginFb(Principal prin)
	*/
	/*회원정보확인 로그인 작업 - 페이스북*/
	@RequestMapping(value="/member_confirm_fb.htm", method=RequestMethod.POST)
	public String memberLoginFb(Principal prin) {
		
		String viewpage;
		
		UserSoloDTO dto = service.getSoloInfo(prin.getName());
		String password = "987654321";
		String encodedPassword = dto.getPassword();
		
		boolean result = bCryptPasswordEncoder.matches(password, encodedPassword);
		
		if(result) {
			viewpage = "redirect:member_update_fb.htm";
		}else {
			viewpage = "redirect:member_confirm.htm";
		}
		
		return viewpage;
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberSoloFb(Principal prin, Model model)
	*/
	/*회원정보페이지-페이스북*/
	@RequestMapping(value="/member_update_fb.htm", method=RequestMethod.GET)
	public String memberSoloFb(Principal prin, Model model) {
		
		UserSoloDTO dto = service.getSoloInfo(prin.getName());
		String email = dto.getSolo_email();
		
		int emailNm = email.indexOf("@");
		String email01 = email.substring(0, emailNm);
		String email02 = email.substring(emailNm+1);
		model.addAttribute("email01", email01);
		model.addAttribute("email02", email02);
		
		if(dto.getSolo_addr() != null) {
			String address = dto.getSolo_addr();
			
			int addrNm01 = address.indexOf("/");
			int addrNm02 = address.indexOf("-");
			String zipcode = address.substring(0, addrNm01);
			String addr01 = address.substring(addrNm01 + 1, addrNm02);
			String addr02 = address.substring(addrNm02 + 1);
			
			model.addAttribute("dto", dto);
			
			model.addAttribute("zipcode", zipcode);
			model.addAttribute("addr01", addr01);
			model.addAttribute("addr02", addr02);
		}else {
			model.addAttribute("dto", dto);			
		}
		return "member.member_update_fb";
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : @ResponseBody View memberSoloFb(HttpServletRequest request, HttpServletResponse response, ModelMap map)
	*/
	/*회원정보수정-페이스북*/
	@RequestMapping(value="/member_update_fb.htm", method=RequestMethod.POST)
	public @ResponseBody View memberSoloFb(HttpServletRequest request, HttpServletResponse response, ModelMap map)  {
		
		UserSoloDTO usersolo = new UserSoloDTO();
		usersolo.setSolo_name(request.getParameter("solo_name"));
		usersolo.setUsername(request.getParameter("username"));
		usersolo.setSolo_gender(request.getParameter("solo_gender"));
		usersolo.setSolo_email(request.getParameter("solo_email"));
		usersolo.setSolo_addr(request.getParameter("solo_addr"));
		usersolo.setSolo_birth(request.getParameter("solo_birth"));
		usersolo.setSolo_cphone(request.getParameter("solo_cphone"));
		
		int result = 0;
		String msg = "";
		
		result = service.soloUpdateFb(usersolo);
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		map.addAttribute("msg", msg);
		
		return jsonview;
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberLoginComp()
	*/
	/*기업정보확인 로그인페이지*/
	@RequestMapping(value="/member_confirm_comp.htm", method=RequestMethod.GET)
	public String memberLoginComp() {
		
		return "member.member_confirm_comp";
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberLoginComp(@RequestParam("password") String password, Principal prin)
	*/
	/*기업정보확인 로그인 작업*/
	@RequestMapping(value="/member_confirm_comp.htm", method=RequestMethod.POST)
	public String memberLoginComp(@RequestParam("password") String password, Principal prin) {
		
		String viewpage;
		
		UserComPpDTO dto = service.getCompInfo(prin.getName());
		String encodedPassword = dto.getPassword();
		
		boolean result = bCryptPasswordEncoder.matches(password, encodedPassword);
		
		if(result) {
			viewpage = "redirect:member_update_comp.htm";
		}else {
			viewpage = "redirect:member_confirm_comp.htm";
		}
		
		return viewpage;
	}

	/*
	@class : MemberController
	@Date : 2017-12-04
	@Author : 강희창
	@Desc : String memberComp(Principal prin, Model model)
	*/
	/*기업정보페이지*/
	@RequestMapping(value="/member_update_comp.htm", method=RequestMethod.GET)
	public String memberComp(Principal prin, Model model) {
		
		UserComPpDTO dto = service.getCompInfo(prin.getName());
		String email = dto.getComp_pp_email();
		
		int emailNm = email.indexOf("@");
		String email01 = email.substring(0, emailNm);
		String email02 = email.substring(emailNm+1);
		model.addAttribute("dto", dto);
		model.addAttribute("email01", email01);
		model.addAttribute("email02", email02);
		
		String address = dto.getComp_addr();
		
		int addrNm01 = address.indexOf("/");
		int addrNm02 = address.indexOf("-");
		String zipcode = address.substring(0, addrNm01);
		String addr01 = address.substring(addrNm01 + 1, addrNm02);
		String addr02 = address.substring(addrNm02 + 1);
		
		model.addAttribute("dto", dto);
		model.addAttribute("email01", email01);
		model.addAttribute("email02", email02);
		
		model.addAttribute("zipcode", zipcode);
		model.addAttribute("addr01", addr01);
		model.addAttribute("addr02", addr02);
		
		return "member.member_update_comp";
	}

	/*
	@class : MemberController
	@Date : 2017-12-05
	@Author : 강희창
	@Desc : String memberComp(HttpServletRequest request, UserComPpDTO dto)
	*/
	/*기업정보수정*/
	@RequestMapping(value="/member_update_comp.htm", method = RequestMethod.POST)
	public String memberComp(HttpServletRequest request, UserComPpDTO dto)  {
		
		dto.setPassword(this.bCryptPasswordEncoder.encode(request.getParameter("password")));
		
		if(dto.getComp_logo() != null) {
			//파일업로드를 했을경우
			//단일 파일
			CommonsMultipartFile imagefile = dto.getFile();
			
			String file = imagefile.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/resources/bootstrap/upload/images");
			
			String fpath = path + "\\" + file;
			
			dto.setComp_logo(file);
			
			try {
				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(imagefile.getBytes());
				fs.close();
				
				service.compUpdate(dto);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			//파일업로드 안했을경우
			service.compUpdateNf(dto);
		}
		
		
		
		return "redirect:home.htm";
	}

	/*
	@class : MemberController
	@Date : 2017-12-06
	@Author : 강희창
	@Desc : View memberDel(String username, ModelMap map)
	*/
	/*개인회원탈퇴*/
	@RequestMapping("/member_del.htm")
	public @ResponseBody View memberDel(String username, ModelMap map)  {
		
		int result = 0;
		String msg;
		
		result = service.memberDel(username);
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}

		map.addAttribute("msg", msg);
		
		return jsonview;
	}

	/*
	@class : MemberController
	@Date : 2017-12-06
	@Author : 강희창
	@Desc : View memberDelComp(String username, ModelMap map)
	*/
	/*기업회원탈퇴*/
	@RequestMapping("/member_del_comp.htm")
	public @ResponseBody View memberDelComp(String username, ModelMap map)  {
		
		int result = 0;
		String msg;
		
		result = service.memberDelComp(username);
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}

		map.addAttribute("msg", msg);
		
		return jsonview;
	}

}
