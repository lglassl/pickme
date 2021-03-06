package kr.or.pickme.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.service.EmploymentService;

@Controller
public class CompanyPickController {

	@Autowired
	EmploymentService service;

	@Autowired
	public View JsonView;

	
	
	// 개인 공고 리스트 jsp 이동
	@RequestMapping(value = "employmentlist.htm", method = RequestMethod.GET)
	public String employmentlist(String username, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("개인 공고 리스트  jsp 이동");
		/*username = "abc";*/
		List<CompPickInfoDTO> list = service.employmentPrint(username);
		model.addAttribute("employmentlist", list);
		return "employment.employmentlist";
	}
	
	
	///////////////////////////////등록
	
	// 채용정보등록 jsp 이동
	@RequestMapping(value = "employmentinsert.htm", method = RequestMethod.GET)
	public String employmentinsert() {
		System.out.println("채용정보등록 jsp 이동");
		return "employment.employmentinsert";
	}

	// 채용정보 등록 컨트롤 post방식
	@RequestMapping(value = "employmentinsert.htm", method = RequestMethod.POST)
	public String employmentinsert(CompPickInfoDTO C_dto) throws Exception {
		String result = service.employmentInsert(C_dto);
		
		return result;
	}

	//////////////////////////////////////////////////////////
	
	//---------------------------------------------수정
	
	// 채용정보 수정화면에 기존에 등록되있던 리스트를 modal에 출력
	@RequestMapping(value = "employment_updateprint.htm", method = RequestMethod.POST)
	public View employment_updateprint(String s_pick_code, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("채용정보수정 modal 이동");
		int pick_code = Integer.parseInt(s_pick_code);
		System.out.println("pick_code : " + pick_code);
		
		CompPickInfoDTO dto = service.employment_updatePrint(pick_code);
		System.out.println("dto.pick_code : " + dto.getPick_code());
		model.addAttribute("pick_dtolist", dto);
		
		return JsonView;
	}

	// 채용정보 수정
	@RequestMapping(value = "employmentupdate.htm", method = RequestMethod.POST)
	public String employmentupdate(CompPickInfoDTO C_dto) throws Exception {
		System.out.println("----------employmentupdate.htm 컨트롤 탄다잉---------");
		System.out.println(C_dto.toString());
		
		service.employmentupdate(C_dto);
		
		return "redirect:/employmentlist.htm";
	}
	//--------------------------------------------------------------------------
	
	
	
	// 채용형태 리스트 출력 컨트롤
	@RequestMapping(value = "hirejob_print.htm", method = RequestMethod.GET)
	public View hiredate_print(Model model) throws ClassNotFoundException, SQLException {

		List<CompPickInfoDTO> hirelist = service.hiredata_print();
		List<CompPickInfoDTO> joblist = service.jobdata_print();
		
		System.out.println("컨트롤오냐");
		
		model.addAttribute("hirelist", hirelist);
		model.addAttribute("joblist", joblist);

		return JsonView;
	}

	
	
	
	// 기업 상세요강 페이지이동 부분
	@RequestMapping(value = "employmentdetail.htm", method = RequestMethod.POST)
	public String employmentdetail(String username, int pick_code, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("get 방식 탄다.");
		System.out.println("username : " + username + " pick_code : " + pick_code );
	
		List<UserComPpDTO> UserComp_list = service.employmentDetail_Compinfo(username);
		List<CompPickInfoDTO> CompPick_list = service.employmentDetail_CompDetail(username, pick_code);
		
		model.addAttribute("Detail_Compinfo", UserComp_list.get(0)); //기업정보 객체 
		model.addAttribute("Detail_UserComp", UserComp_list.get(1)); //기업 회원정보 객체
		
		
		model.addAttribute("Detail_CompPick", CompPick_list.get(0)); //채용정보 객체 
		
		return "employment.employmentdetail";
	}

	
	
	
	/*
	 * //?????????미정
	 * 
	 * @RequestMapping(value = "employmentdetail.htm", method=RequestMethod.POST)
	 * public String employmentdetail(CompPickInfoDTO C_dto) throws Exception {
	 * System.out.println("post 방식 탄다 "); String result =
	 * service.employmentInsert(C_dto); return result; }
	 */

}
