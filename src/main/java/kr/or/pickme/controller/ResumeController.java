/*
@class : ResumeController.java
@Date : 2017-11-29
@Author : 박현지
@Desc : 이력서등록, 제출, 저장에 관한 front controller
*/

package kr.or.pickme.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.buf.UEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.dto.SoloAwardDTO;
import kr.or.pickme.dto.SoloCareerDTO;
import kr.or.pickme.dto.SoloEduDTO;
import kr.or.pickme.dto.SoloEduDTO2;
import kr.or.pickme.dto.SoloLangDTO;
import kr.or.pickme.dto.SoloLicenseDTO;
import kr.or.pickme.dto.SoloPortpolioDTO;
import kr.or.pickme.dto.SoloSkillDTO;
import kr.or.pickme.dto.UserSoloDTO;
import kr.or.pickme.service.ResumeService;

@Controller
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;

	/*	
	    * @Method Name : insertBasicResume
	    * @작성일 : 2017. 11. 28.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **초기 이력서 등록 화면이동
	    * @param : UserSoloDTO
	    * @return : String 
	*/	
	@RequestMapping(value="resume.htm")
	public String resume(UserSoloDTO usersoloDTO, Model model) throws ClassNotFoundException, SQLException {     // 파라미터 username가져가야한다.
		System.out.println("resume.htm탄다");
		usersoloDTO.setUsername("guswl4"); //임시로 username set 해주기 
		System.out.println(usersoloDTO.getUsername());
		
		/*username에 해당하는 인적사항 화면에 뿌리기*/
		UserSoloDTO userDTO = resumeService.getUserSoloInfo(usersoloDTO.getUsername());
		System.out.println("userinfo : "+userDTO.getSolo_birth());
		model.addAttribute("user", userDTO);
		
		return "resume.resume_form";
	}
	
	
	/*	
	    * @Method Name : insertBasicResume()
	    * @작성일 : 2017. 12. 02.
	    * @작성자 : 박현지
	    * @변경이력 : 포트폴리오는 UserSoloDTO에서 바로 insert 처리. 나머지는 각 객체로 insert처리함!
	    * @Method 설명 : **초기 이력서 등록 처리 
	    * @param : UserSoloDTO,  @RequestParam("file") MultipartFile file
	    * @return : String 
	*/
	@RequestMapping(value="resume/insert.htm", method=RequestMethod.POST)
	public String insertBasicResume(UserSoloDTO usersoloDTO, @RequestParam("file") MultipartFile file, Model model) throws ClassNotFoundException, SQLException, IOException {
		
		System.out.println("resume_insert.htm탄다");
		usersoloDTO.setUsername("guswl4"); //임시로 username set 해주기
		System.out.println("set 해준 username : "+ usersoloDTO.getUsername());
		
		//포트폴리오 파일 업로드
		String savedName= resumeService.uploadFile(file.getOriginalFilename(), file.getBytes());//return originalname
		System.out.println("파일이름  :" + savedName);
		usersoloDTO.setPortpolio_file(savedName);
		System.out.println("set되냐? "+ usersoloDTO.getPortpolio_file());
		
		String url=resumeService.insertBasicResume(usersoloDTO);
		
		//service에서 dao insert시켜야되는것만큼 다 시키고, transaction걸어야한다
		return url;
	}
	
	
	/*	
	    * @Method Name : updateBasicResume()
	    * @작성일 : 2017. 12. 05.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : ** 초기이력서 수정 시, 저장되어있는 이력서  select하고, 화면에 보여주기
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	@RequestMapping(value="resume/update.htm", method=RequestMethod.GET)
	public String updateBasicResume(UserSoloDTO userDTO, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("apply.htm탄다");
		//userDTO.setUsername(pc.getName());  principal쓸때 username쓰는 방법!!!
		userDTO.setUsername("guswl2");  //임시로 username set!
		System.out.println("받아오는 username : "+userDTO.getUsername());
		
		/*username에 해당하는 인적사항*/
		UserSoloDTO usersoloDTO = resumeService.getUserSoloInfo(userDTO.getUsername());
		System.out.println("userinfo : "+usersoloDTO.getSolo_birth());
		model.addAttribute("user", usersoloDTO);
		
		/*초기이력서 -학력 list 뽑는 service*/
		List<SoloEduDTO> soloeduDTO = resumeService.getBasicResume_edu(userDTO.getUsername());
		model.addAttribute("eduList", soloeduDTO);
		
		/*초기이력서 -경력 list 뽑는 service*/
		List<SoloCareerDTO> solocareerDTO = resumeService.getBasicResume_career(userDTO.getUsername());
		model.addAttribute("careerList", solocareerDTO);
		
		/*초기이력서 -어학 list 뽑는 service*/
		List<SoloLangDTO> sololangDTO = resumeService.getBasicResume_lang(userDTO.getUsername());
		model.addAttribute("langList", sololangDTO);
		
		/*초기이력서 -자격증 list 뽑는 service*/
		List<SoloLicenseDTO> soloLicenseDTO = resumeService.getBasicResume_license(userDTO.getUsername());
		model.addAttribute("licenseList", soloLicenseDTO);
		
		/*초기이력서 -포트폴리오 뽑는 service*/
		UserSoloDTO portpolioDTO = resumeService.getBasicResume_portpolio(userDTO.getUsername());
		model.addAttribute("portpolio", portpolioDTO);
		
		/*초기이력서 - 보유기술 list 뽑는 service*/
		List<SoloSkillDTO> soloskillDTO = resumeService.getBasicResume_skill(userDTO.getUsername());
		model.addAttribute("skillList", soloskillDTO);
		
		/*초기이력서 - 수상 list 뽑는 service*/
		List<SoloAwardDTO> soloawardDTO = resumeService.getBasicResume_award(userDTO.getUsername());
		model.addAttribute("awardList", soloawardDTO);
		
		return "resume.updateBasicResume";
	}
	
	
	/*	
	    * @Method Name : applyCompany()
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : ** 특정 공고 게시물의 '지원하기'시, 초기 이력서& 자기소개서 항목 select 하고, 화면에 보여주기
	    * @param : int pick_code, UserSoloDTO userDTO, Model model
	    * @return : String 
	*/	
	@RequestMapping(value="apply.htm", method=RequestMethod.GET)
	public String applyCompany(int pick_code, UserSoloDTO userDTO, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("apply.htm탄다");
		userDTO.setUsername("guswl2");  //임시로 username set!
		System.out.println("받아오는 pick_code : "+pick_code);
		System.out.println("받아오는 username : "+userDTO.getUsername());
		
		String url="";
		
		/*username에 해당하는 pick_code가 존재하는지 확인 - 존재하면 빠꾸*/
		String isPickCode= resumeService.getUsernamePerPickCode(userDTO);
		System.out.println("username이 pick_code를 갖고있니? "+isPickCode );
		if(isPickCode==null ) {
			url="resume.apply";
		}else {
			url="redirect:/home.htm";
		}
		
		/*username에 해당하는 인적사항*/
		UserSoloDTO usersoloDTO = resumeService.getUserSoloInfo(userDTO.getUsername());
		System.out.println("userinfo : "+usersoloDTO.getSolo_birth());
		model.addAttribute("user", usersoloDTO);
		
		/*초기이력서 -학력 list 뽑는 service*/
		List<SoloEduDTO> soloeduDTO = resumeService.getBasicResume_edu(userDTO.getUsername());
		model.addAttribute("eduList", soloeduDTO);
		
		/*초기이력서 -경력 list 뽑는 service*/
		List<SoloCareerDTO> solocareerDTO = resumeService.getBasicResume_career(userDTO.getUsername());
		model.addAttribute("careerList", solocareerDTO);
		
		/*초기이력서 -어학 list 뽑는 service*/
		List<SoloLangDTO> sololangDTO = resumeService.getBasicResume_lang(userDTO.getUsername());
		model.addAttribute("langList", sololangDTO);
		
		/*초기이력서 -자격증 list 뽑는 service*/
		List<SoloLicenseDTO> soloLicenseDTO = resumeService.getBasicResume_license(userDTO.getUsername());
		model.addAttribute("licenseList", soloLicenseDTO);
		
		/*초기이력서 -포트폴리오 뽑는 service*/
		UserSoloDTO portpolioDTO = resumeService.getBasicResume_portpolio(userDTO.getUsername());
		model.addAttribute("portpolio", portpolioDTO);
		
		/*초기이력서 - 보유기술 list 뽑는 service*/
		List<SoloSkillDTO> soloskillDTO = resumeService.getBasicResume_skill(userDTO.getUsername());
		model.addAttribute("skillList", soloskillDTO);
		
		/*초기이력서 - 수상 list 뽑는 service*/
		List<SoloAwardDTO> soloawardDTO = resumeService.getBasicResume_award(userDTO.getUsername());
		model.addAttribute("awardList", soloawardDTO);
		
		/*채용공고 code에 따른 자기소개서 질문 갯수와 항목 뽑는 service*/
		List<CompPickInfoDTO> compPickinfoDTO = resumeService.getCompQuestion(pick_code);
		System.out.println("채용공고 자소사 항목뽑을때 pick_code뽑냐?:"+compPickinfoDTO.get(0).getPick_code());
		model.addAttribute("questionList", compPickinfoDTO);

		
		
		
		
		return url;
	}
	
	
	/*	
	    * @Method Name : applyCompany()
	    * @작성일 : 2017. 12. 05.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **이력서 & 자기소개서 작성 후 '임시저장', '제출'버튼 누름!! 
	    * @param : UserSoloDTO
	    * @return : String 
	*/	
	@RequestMapping(value="apply.htm", method=RequestMethod.POST)
	public String applyinsertCompany(ResumeDTO resumeDTO, @RequestParam("file2") MultipartFile file, Model model) throws IOException, ClassNotFoundException, SQLException {
									// principal 추가!!
		
		System.out.println("apply.htm / POST");
		// principal로 바꾸기  => username 설정 =>  resumeDTO.setUsername(pc.getName());
		resumeDTO.setUsername("guswl2"); //임시로 username set
		System.out.println("controller에 pick_code 불러와?? : "+resumeDTO.getPick_code());
		
		/*username과 pick_code로 생기는 resume table에 insert*/
		resumeService.insertResumeCoverletter(resumeDTO);
		
		/*포트폴리오 파일 업로드*/
		if(file==null) {
			resumeDTO.setPortpolio_file(resumeDTO.getPortpolio_update());
		}else {
			String savedName= resumeService.uploadFile(file.getOriginalFilename(), file.getBytes());//return originalname
			System.out.println("파일이름  :" + savedName);
			resumeDTO.setPortpolio_file(savedName);
		}
		System.out.println("포트폴리오2 set되냐? "+ resumeDTO.getPortpolio_file());
				
		/*이력서 코드로 입력하는 coverletter2 & 각 이력서항목 table에 insert*/
		String url = resumeService.insertResumeItem(resumeDTO);
		
		return url;
	
	}
	
	

	

}
