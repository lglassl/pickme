package kr.or.pickme.service;
/*
@class : ResumeService.java
@Date : 2017-11-28
@Author : 박현지
@Desc : 이력서등록, 제출, 저장에 관한 service
*/

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javafx.scene.control.ListCell;
import kr.or.pickme.dao.ResumeBasicDAO;
import kr.or.pickme.dao.ResumeDAO;
import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.CoverletterDTO2;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.dto.SoloAwardDTO;
import kr.or.pickme.dto.SoloAwardDTO2;
import kr.or.pickme.dto.SoloCareerDTO;
import kr.or.pickme.dto.SoloCareerDTO2;
import kr.or.pickme.dto.SoloEduDTO;
import kr.or.pickme.dto.SoloEduDTO2;
import kr.or.pickme.dto.SoloLangDTO;
import kr.or.pickme.dto.SoloLangDTO2;
import kr.or.pickme.dto.SoloLicenseDTO;
import kr.or.pickme.dto.SoloLicenseDTO2;
import kr.or.pickme.dto.SoloPortpolioDTO;
import kr.or.pickme.dto.SoloPortpolioDTO2;
import kr.or.pickme.dto.SoloSkillDTO;
import kr.or.pickme.dto.SoloSkillDTO2;
import kr.or.pickme.dto.UserSoloDTO;

@Service
public class ResumeService {

	@Autowired
	private SqlSession session;
	
	@Resource(name="uploadPath")   //서버의 파일 저장 경로
	private String uploadPath;
	
	/*	
	    * @Method Name : insertBasicResume
	    * @작성일 : 2017. 12. 02.
	    * @작성자 : 박현지
	    * @변경이력 : 1. 포트폴리오는 1개만 받아와서 DB에 insert -> for문 안돌린다.
	    * 		   2. 이력서 각 DTO에 username set한다
	    * @Method 설명 : **초기 이력서 등록 처리 
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	@Transactional
	public String insertBasicResume(UserSoloDTO usersoloDTO) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		System.out.println("controller에서 받아오는 username : "+usersoloDTO.getUsername());
		
		try {
			/*학력 list로 insert*/
			if(usersoloDTO.getEduList()==null) {
				System.out.println("어학 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getEduList().size(); i++) {
					usersoloDTO.getEduList().get(i).setUsername(usersoloDTO.getUsername());  //eduDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_edu(usersoloDTO.getEduList().get(i));
					System.out.println("학력 : "+usersoloDTO.getEduList().get(i).toString());
				}System.out.println("학력 다중insert 성공!");
			}
			
			/*경력 list로 insert*/		
			if(usersoloDTO.getCareerList()==null) {
				System.out.println("경력 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getCareerList().size(); i++) {
					usersoloDTO.getCareerList().get(i).setUsername(usersoloDTO.getUsername());  //careerDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_career(usersoloDTO.getCareerList().get(i));
					System.out.println("경력 : "+usersoloDTO.getCareerList().get(i).toString());
				}System.out.println("경력 다중insert 성공!");
			}
			
			/*어학 list로 insert*/
			if(usersoloDTO.getLangList()==null) {
				System.out.println("어학 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getLangList().size(); i++) {
					usersoloDTO.getLangList().get(i).setUsername(usersoloDTO.getUsername());   //langDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_lang(usersoloDTO.getLangList().get(i));
					System.out.println("어학 :" + usersoloDTO.getLangList().get(i).toString());
				}System.out.println("어학 다중 insert 성공!");
			}
			
			/*자격증 list로 insert*/
			if(usersoloDTO.getLicenseList()==null) {
				System.out.println("자격증 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getLicenseList().size(); i++) {
					usersoloDTO.getLicenseList().get(i).setUsername(usersoloDTO.getUsername());   //licenseDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_license(usersoloDTO.getLicenseList().get(i));
					System.out.println("자격증 : "+ usersoloDTO.getLicenseList().get(i).toString());
				}System.out.println("자격증 다중 insert 성공!");
				
			}
			
			/*포트폴리오 list로 insert -> 1개밖에 안넣어서 usersoloDTO에 아예 넣어버림*/
			if(usersoloDTO.getPortpolio_file()=="") {
				System.out.println("포트폴리오 받아오는 값X insert 패스");
			}else {
				SoloPortpolioDTO portpolio =new SoloPortpolioDTO();
				portpolio.setUsername(usersoloDTO.getUsername()); //portpolioDTO의 username에 set해주기
				resumebasicDAO.insertBasicResume_portpolio(usersoloDTO);
				System.out.println("포트폴리오 : "+ usersoloDTO.getPortpolio_file());
			}
			
			/*보유기술 list로 insert*/ 
			if(usersoloDTO.getSkillList()==null) {
				System.out.println("보유기술 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getSkillList().size(); i++) {
					usersoloDTO.getSkillList().get(i).setUsername(usersoloDTO.getUsername());   //skillDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_skill(usersoloDTO.getSkillList().get(i));
					System.out.println("보유기술 :"+usersoloDTO.getSkillList().get(i).toString());
				}System.out.println("보유기술 다중 insert성공!");
			}
			
			/*수상내역 list로 insert*/
			if(usersoloDTO.getAwardList()==null) {
				System.out.println("수상내역 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<usersoloDTO.getAwardList().size(); i++) {
					usersoloDTO.getAwardList().get(i).setUsername(usersoloDTO.getUsername());   //awardDTO의 username에 set해주기
					resumebasicDAO.insertBasicResume_award(usersoloDTO.getAwardList().get(i));
					System.out.println("수상내역 :"+usersoloDTO.getAwardList().get(i).toString());
				}System.out.println("슈상내역 다중 insert성공!");
			}
			
		}catch(Exception e) {
			System.out.println("서비스 catch로 빠진다.");
			System.out.println(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return "redirect:/home.htm";
	}
	
	
	/*	
	    * @Method Name : uploadFile
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **포트폴리오 파일 업로드 savedName & 실제 파일 업로드 처리
	    * @param : String, byte
	    * @return : String 
	*/
	public String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uid= UUID.randomUUID();  //중복되지않는 고유한 키 값을 설정 -> 동일한 경로에 동일한이름의 파일을 업로드 할때도 문제가 되지 않도록!
		String savedName= uid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);  //하드디스크 저장경로 (uploadPath)에 파일이름(savedName)
		FileCopyUtils.copy(fileData, target);  // 데이터가 담긴 바이트의 배열(fileData)을  파일(target)에 기록 out >> 실제 파일 처리하는것!
		return originalName;
	}
	
	
	
	/*	
	    * @Method Name : getUserSoloInfo
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **초기이력서 등록, 초기이력서 수정, 지원이력서 등록, 지원이력서 수정 페이지에 뜨는 username의 인적사항
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	public UserSoloDTO getUserSoloInfo(String username) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		UserSoloDTO usersoloDTO= resumebasicDAO.getUserSoloInfo(username);
		return usersoloDTO;
	}
	
	
	
	/*	
	    * @Method Name : getBasicResume_____
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **초기이력서 수정, 지원이력서 등록 페이지에 뜨는 username의 이력서 항목들 뽑기!!
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	/* @Method 설명 : **username에 해당하는 학력 list 뽑기*/
	public List<SoloEduDTO> getBasicResume_edu(String username) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloEduDTO> soloeduDTO= resumebasicDAO.getBasicResume_edu(username);
		for(int i =0; i<soloeduDTO.size(); i++) {
			System.out.println("학력 :"+i+"번째 값 : "+ soloeduDTO.get(i));
		}
		return soloeduDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 경력 list 뽑기*/
	public List<SoloCareerDTO> getBasicResume_career(String username) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloCareerDTO> solocareerDTO=resumebasicDAO.getBasicResume_career(username);
		for(int i =0; i<solocareerDTO.size(); i++) {
			System.out.println("경력 :"+i+"번째 값 : "+ solocareerDTO.get(i));
		}
		return solocareerDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 어학 list 뽑기*/
	public List<SoloLangDTO> getBasicResume_lang(String username) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloLangDTO> sololangDTO = resumebasicDAO.getBasicResume_lang(username);
		for(int i=0; i<sololangDTO.size(); i++ ) {
			System.out.println("어학 :"+i+"번째 값 : "+sololangDTO.get(i));
		}
		return sololangDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 자격증 list 뽑기*/
	public List<SoloLicenseDTO> getBasicResume_license(String username) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloLicenseDTO> sololicenseDTO = resumebasicDAO.getBasicResume_license(username);
		for(int i=0; i<sololicenseDTO.size(); i++ ) {
			System.out.println("자격증 :"+i+"번째 값 : "+ sololicenseDTO.get(i));
		}
		return sololicenseDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 포트폴리오 1개 뽑기 - usersoloDTO에 portpolio변수있다!*/
	public UserSoloDTO getBasicResume_portpolio(String username) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		UserSoloDTO portpolioDTO= resumebasicDAO.getBasicResume_portpolio(username);
		System.out.println("포트폴리오 : "+portpolioDTO.getPortpolio_file());
		return portpolioDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 보유기술 list 뽑기*/
	public List<SoloSkillDTO> getBasicResume_skill(String username) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloSkillDTO> soloskillDTO= resumebasicDAO.getBasicResume_skill(username);
		for(int i=0; i<soloskillDTO.size(); i++ ) {
			System.out.println("보유기술 :"+i+"번째 값 : "+ soloskillDTO.get(i));
		}
		return soloskillDTO;
	}
	
	/* @Method 설명 : **username에 해당하는 수상내역 list 뽑기*/
	public List<SoloAwardDTO> getBasicResume_award(String username) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<SoloAwardDTO> soloawardDTO = resumebasicDAO.getBasicResume_award(username);
		for(int i=0; i<soloawardDTO.size(); i++ ) {
			System.out.println("수상내역 :"+i+"번째 값 : "+ soloawardDTO.get(i));
		}
		return soloawardDTO;
	}
	
	
	/*	
	    * @Method Name : getBasicResume~~~~
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 :  ** 지원이력서 페이지에서 보여지는 pick_code에 해당하는 자소서 항목내용, 자소서 글자수 뽑기
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	public List<CompPickInfoDTO> getCompQuestion(int pick_code) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<CompPickInfoDTO> compPickinfoDTO = resumebasicDAO.getCompQuestion(pick_code);
		for(int i=0; i<compPickinfoDTO.size(); i++) {
			System.out.println("자소서  항목 : "+i+"번째 자소서 항목 : "+compPickinfoDTO.get(i).getIntro_no()
								+"//"+ i+"번째 자소서 글자수 : "+compPickinfoDTO.get(i).getIntro_lim()
								+"//"+ i+"번재  pick_code : "+compPickinfoDTO.get(i).getPick_code()
								);
		}
		return compPickinfoDTO;
	}

	
	
	
	/*	
	    * @Method Name : deleteOriginResumeListForUpdatingBasicResume
	    * @작성일 : 2017. 12. 09
	    * @작성자 : 박현지
	    * @변경이력 : **포트폴리오는 삭제하지않는다!!!!!!!
	    * @Method 설명 : **초기이력서 수정 처리 >> 기존의 초기 이력서 내용 전부 delete한다 
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	public void deleteOriginResumeListForUpdatingBasicResume(String username) throws ClassNotFoundException, SQLException {
		
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		System.out.println("controller에서 받아오는 username : "+ username);

		//학력 list 삭제
		resumebasicDAO.deleteBasicResume_edu(username);
		//경력 list 삭제
		resumebasicDAO.deleteBasicResume_career(username);
		//어학 list 삭제
		resumebasicDAO.deleteBasicResume_lang(username);
		//자격증 list 삭제
		resumebasicDAO.deleteBasicResume_license(username);
		//보유기술 list 삭제
		resumebasicDAO.deleteBasicResume_skill(username);
		//수상 list 삭제
		resumebasicDAO.deleteBasicResume_award(username);
		// 프토폴리오 삭제
		resumebasicDAO.deleteBasicResume_portpolio(username);
		
		 
	}
	
	
	
	
	/*	
	    * @Method Name : getUsernamePerPickCode()
	    * @작성일 : 2017. 12. 06.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **채용공고에 지원 시, username에 해당하는 pick_code가 존재하는지 확인
	    * 				pick_code존재하면 "이미 작성중이거나 제출완료했습니다."
	    * 				pick_code 존재하지 않으면, 작성할 수 있으니, 페이지 전환!
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	public String getUsernamePerPickCode(UserSoloDTO userSoloDTO) throws ClassNotFoundException, SQLException {
		System.out.println("서비스 들어옴");
		ResumeDAO resumeDAO = session.getMapper(ResumeDAO.class);
		String isPickCode=resumeDAO.getUsernamePerPickCode(userSoloDTO);
		System.out.println("매퍼타고 서비스타고 나온 결과값 :"+isPickCode);
		return isPickCode;
	}
	
	
	
	/*	
	    * @Method Name : insertResumeCoverletter
	    * @작성일 : 2017. 12. 05.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **채용공고에 지원 시, 이력서 코드를 발생시키는 resume table에 insert
	    * @param : ResumeDTO
	    * @return : String 
	*/
	public void insertResumeCoverletter(ResumeDTO resumeDTO) throws ClassNotFoundException, SQLException {
		ResumeDAO resumeDAO = session.getMapper(ResumeDAO.class);
		
		System.out.println("service 탄다");
		System.out.println("username : "+resumeDTO.getUsername());
		
		/* username과 pick_code로 생기는 resume table에 insert*/
		int result =resumeDAO.insertResumeTable(resumeDTO);
		if(result >0) {
				System.out.println("resume 테이블에 입력 성공!");
		}
	}
	
	
	
	/*	
	    * @Method Name : insertResumeItem
	    * @작성일 : 2017. 12. 06.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **채용공고에 지원 시, 이력서 코드를 가지고 각 이력서 항목에 insert
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	public String insertResumeItem(ResumeDTO resumeDTO) throws ClassNotFoundException, SQLException {
		ResumeDAO resumeDAO = session.getMapper(ResumeDAO.class);
		System.out.println("이력서 각 항목에 insert 시작 / username="+resumeDTO.getUsername());
		System.out.println("insertResumeItem서비스에 pick_code 불러와?? : "+resumeDTO.getPick_code());
		
		try {
			/* 학력2 list로 insert */
			if(resumeDTO.getEduList2()==null) {
				System.out.println("어학2 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<resumeDTO.getEduList2().size(); i++ ) {
					resumeDTO.getEduList2().get(i).setUsername(resumeDTO.getUsername());  //soloEduDTO2의 username을 set
					System.out.println("학력2 : "+i+"번째 값 =>"+resumeDTO.getEduList2().get(i).toString());
					resumeDAO.insertResumeCoverletter_edu(resumeDTO.getEduList2().get(i));
				}System.out.println("학력2 다중insert 성공!");
			}
			
			/* 경력2 list로 insert */
			if(resumeDTO.getCareerList2()==null) {
				System.out.println("경력2 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<resumeDTO.getCareerList2().size(); i++) {
					resumeDTO.getCareerList2().get(i).setUsername(resumeDTO.getUsername());  //getCareerList2의 username을 set
					System.out.println("경력2 : "+i+"번째 값 =>"+resumeDTO.getCareerList2().get(i).toString());
					resumeDAO.insertResumeCoverletter_career(resumeDTO.getCareerList2().get(i));
				}System.out.println("경력2 다중insert 성공!");
			}
			
			/* 어학2 list로 insert */
			if(resumeDTO.getLangList2()==null) {
				System.out.println("어학2 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<resumeDTO.getLangList2().size(); i++) {
					resumeDTO.getLangList2().get(i).setUsername(resumeDTO.getUsername());  //getLangList2의 username을 set
					System.out.println("lang2에 username set한거 : "+resumeDTO.getLangList2().get(i).getUsername());
					resumeDAO.insertResumeCoverletter_lang(resumeDTO.getLangList2().get(i));
					System.out.println("어학2 : "+i+"번째 값 =>"+resumeDTO.getLangList2().get(i).toString());
				}System.out.println("어학2 다중insert 성공!");
			}
			
			/* 자격증2 list로 insert */
			if(resumeDTO.getLicenseList2() ==null) {
				System.out.println("자격증2 받아오는 값X insert 패스");
			}else {
				for(int i=0; i<resumeDTO.getLicenseList2().size(); i++) {
					resumeDTO.getLicenseList2().get(i).setUsername(resumeDTO.getUsername());  //getLicenseList2의 username을 set
					System.out.println("자격증2 : "+i+"번째 값 =>"+resumeDTO.getLicenseList2().get(i).toString());
					resumeDAO.insertResumeCoverletter_license(resumeDTO.getLicenseList2().get(i));
				}System.out.println("자격증2 다중insert 성공!");
			}
			
			/* 포트폴리오2 list로 insert -> 1개밖에 안넣어서 resumeDTO에 아예 넣어버림*/
			if(resumeDTO.getPortpolio_file()=="") {
				System.out.println("포트폴리오2 받아오는 값X insert 패스");
			}else {
				SoloPortpolioDTO2 portpolio= new SoloPortpolioDTO2();
				portpolio.setUsername(resumeDTO.getUsername()); //SoloPortpolioDTO2의 username을 set
				System.out.println("포트폴리오 table에 username줘야되는거,, resumeDTO의 name값 준다:"+portpolio.getUsername());
				System.out.println("포트폴리오 : "+ resumeDTO.getPortpolio_file());
				resumeDAO.insertResumeCoverletter_portpolio(resumeDTO);
			}
			
			/* 보유기술2 list로 insert */
			if(resumeDTO.getSkillList2()==null) {
				System.out.println("보유기술2 받아오는 값X insert 패스");
			}else {	
				for(int i=0; i<resumeDTO.getSkillList2().size(); i++) {
					resumeDTO.getSkillList2().get(i).setUsername(resumeDTO.getUsername());  //getSkillList2의 username을 set
					System.out.println("보유기술2 : "+i+"번째 값 =>"+resumeDTO.getSkillList2().get(i).toString());
					resumeDAO.insertResumeCoverletter_skill(resumeDTO.getSkillList2().get(i));
				}System.out.println("보유기술2 다중insert 성공!");
			}
			
			/* 수상2 list로 insert */
			if(resumeDTO.getAwardList2()==null) {
				System.out.println("수상2 받아오는 값X insert 패스");
			}else {	
				for(int i=0; i<resumeDTO.getAwardList2().size(); i++) {
					resumeDTO.getAwardList2().get(i).setUsername(resumeDTO.getUsername());  //getAwardList2의 username을 set
					System.out.println("수상2 : "+i+"번째 값 =>"+resumeDTO.getAwardList2().get(i).toString());
					resumeDAO.insertResumeCoverletter_award(resumeDTO.getAwardList2().get(i));
				}System.out.println("수상2 다중insert 성공!");
			}
			
			/* 자기소개서 coverletter2 list로 insert */
			for(int i=0; i<resumeDTO.getCoverletterList2().size(); i++) {
				resumeDTO.getCoverletterList2().get(i).setUsername(resumeDTO.getUsername()); //getCoverletterList2의 username을 set
				// pick_code는 jsp에서 name값으로 아예 set해서 보내준다 --따로 set안해도 된다!!
				System.out.println("자기소개서 '"+i+"'번째 값 : "+ resumeDTO.getCoverletterList2().get(i).toString());
				resumeDAO.insertCoverletter2Table(resumeDTO.getCoverletterList2().get(i));
			}System.out.println("자기소개서2 다중 insert 성공!!");
			
			
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "resume.userResume";  //개인 이력서 LIST 게시판으로!!!!!!
	}
	
	
	
	
	/*	
	    * @Method Name : getResumeCoverletterForUpdating
	    * @작성일 : 2017. 12. 09.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **개인 이력서 list 에 작성중인 이력서 click하면 보이는 화면 (각 이력서 항목에서 select 해오기)
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	public ResumeDTO getResumeCoverletterForUpdating(String username, int resu_code) throws ClassNotFoundException, SQLException{
		ResumeDAO resumeDAO = session.getMapper(ResumeDAO.class);
		
		System.out.println("서비스 탄다");
		System.out.println("서비스에서의 username : "+ username + " / 서비스에서 resu_cdoe"+ resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 포트폴리오2 list 뽑기*/
		ResumeDTO resumeDTO= resumeDAO.getResumeCoverletter_portpolio(username, resu_code);

		System.out.println("1.포트폴리오 뽑아옴? : "+ resumeDTO.getPortpolio_file());
		System.out.println("2.포트폴리오 ");
		/* @Method 설명 : **username, resu_code에 해당하는 어학2 list 뽑기*/
		List<SoloEduDTO2> soloEduDTO2s= resumeDAO.getResumeCoverletter_edu(username, resu_code);

		/* @Method 설명 : **username, resu_code에 해당하는 경력2 list 뽑기*/
		List<SoloCareerDTO2> soloCareerDTO2s= resumeDAO.getResumeCoverletter_career(username, resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 어학2 list 뽑기*/
		List<SoloLangDTO2> soloLangDTO2s = resumeDAO.getResumeCoverletter_lang(username, resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 자격증2 list 뽑기*/
		List<SoloLicenseDTO2> soloLicenseDTO2s= resumeDAO.getResumeCoverletter_license(username, resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 보유기술2 list 뽑기*/
		List<SoloSkillDTO2> soloSkillDTO2s= resumeDAO.getResumeCoverletter_skill(username, resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 수상내역2 list 뽑기*/
		List<SoloAwardDTO2> soloAwardDTO2s= resumeDAO.getResumeCoverletter_award(username, resu_code);
		
		/* @Method 설명 : **username, resu_code에 해당하는 자기소개서2 list 뽑기*/
		List<CoverletterDTO2> coverletterDTO2s= resumeDAO.getResumeCoverletter_list(username, resu_code);
		
		resumeDTO.setEduList2(soloEduDTO2s);
		resumeDTO.setCareerList2(soloCareerDTO2s);
		resumeDTO.setLangList2(soloLangDTO2s);
		resumeDTO.setLicenseList2(soloLicenseDTO2s);
		resumeDTO.setSkillList2(soloSkillDTO2s);
		resumeDTO.setAwardList2(soloAwardDTO2s);
		resumeDTO.setCoverletterList2(coverletterDTO2s);
		
		return resumeDTO;
	}
	
	
	/*	
	    * @Method Name : deleteOriginResumeCoverletterForUpdatingResumeToComp
	    * @작성일 : 2017. 12. 10
	    * @작성자 : 박현지
	    * @변경이력 :
	    * @Method 설명 : **지원이력서 수정 처리 >> 기존의 지원 이력서 내용 전부 delete한다 
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	public void deleteOriginResumeCoverletterForUpdatingResumeToComp(String username, int resu_code) throws ClassNotFoundException, SQLException {
		
		ResumeDAO resumeDAO = session.getMapper(ResumeDAO.class);
		System.out.println("지원이력서 수정 처리 service 탄다");
		System.out.println("controller에서 받아오는 username : "+ username);
		System.out.println("controller에서 받아오는 resu_code : "+resu_code);

		//학력2 list 삭제
		resumeDAO.deleteResumeCoverletter_edu(username, resu_code);
		//경력 list 삭제
		resumeDAO.deleteResumeCoverletter_career(username, resu_code);
		//어학 list 삭제
		resumeDAO.deleteResumeCoverletter_lang(username, resu_code);
		//자격증 list 삭제
		resumeDAO.deleteResumeCoverletter_license(username, resu_code);
		//보유기술 list 삭제
		resumeDAO.deleteResumeCoverletter_skill(username, resu_code);
		//수상 list 삭제
		resumeDAO.deleteResumeCoverletter_award(username, resu_code);
		// 프토폴리오 삭제
		resumeDAO.deleteResumeCoverletter_portpolio(username, resu_code);
		// 자기소개서2 삭제
		resumeDAO.deleteResumeCoverletter_coverletter(username, resu_code);
		
		System.out.println("삭제완료!!");
		 
	}	
	
	

	
	
	
	
	
	
}
