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
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.pickme.dao.ResumeBasicDAO;
import kr.or.pickme.dao.ResumeDAO;
import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.ResumeDTO;
import kr.or.pickme.dto.SoloAwardDTO;
import kr.or.pickme.dto.SoloCareerDTO;
import kr.or.pickme.dto.SoloEduDTO;
import kr.or.pickme.dto.SoloLangDTO;
import kr.or.pickme.dto.SoloLicenseDTO;
import kr.or.pickme.dto.SoloPortpolioDTO;
import kr.or.pickme.dto.SoloSkillDTO;
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
	    * @변경이력 : 포트폴리오는 1개만 받아와서 DB에 insert / for문 안돌린다.
	    * @Method 설명 : **초기 이력서 등록 처리 
	    * @param : UserSoloDTO
	    * @return : String 
	*/
	@Transactional
	public String insertBasicResume(UserSoloDTO usersoloDTO) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		
		try {/*학력 list로 insert*/
			for(int i=0; i<usersoloDTO.getEduList().size(); i++) {
				//resumebasicDAO.insertBasicResume_edu(usersoloDTO.getEduList().get(i));
				System.out.println("학력 : "+usersoloDTO.getEduList().get(i).toString());
			}System.out.println("학력 다중insert 성공!");
			
			/*경력 list로 insert*/			
			for(int i=0; i<usersoloDTO.getCareerList().size(); i++) {
				//resumebasicDAO.insertBasicResume_career(usersoloDTO.getCareerList().get(i));
				System.out.println("경력 : "+usersoloDTO.getCareerList().get(i).toString());
			}System.out.println("경력 다중insert 성공!");
			
			/*어학 list로 insert*/
			for(int i=0; i<usersoloDTO.getLangList().size(); i++) {
				//resumebasicDAO.insertBasicResume_lang(usersoloDTO.getLangList().get(i));
				System.out.println("어학 :" + usersoloDTO.getLangList().get(i).toString());
			}System.out.println("어학 다중 insert 성공!");
			
			/*자격증 list로 insert*/
			for(int i=0; i<usersoloDTO.getLicenseList().size(); i++) {
				resumebasicDAO.insertBasicResume_license(usersoloDTO.getLicenseList().get(i));
				System.out.println("자격증 : "+ usersoloDTO.getLicenseList().get(i).toString());
			}System.out.println("자격증 다중 insert 성공!");
			
			
			/*포트폴리오 list로 insert -> 1개밖에 안넣을건데, 서비스 파라미터 타입이 usersoloDTO여서.... list로 만들었다*/
			//resumebasicDAO.insertBasicResume_portpolio(usersoloDTO);
		
			
			/*보유기술 list로 insert*/ 
			for(int i=0; i<usersoloDTO.getSkillList().size(); i++) {
				resumebasicDAO.insertBasicResume_skill(usersoloDTO.getSkillList().get(i));
				System.out.println("보유기술 :"+usersoloDTO.getSkillList().get(i).toString());
			}System.out.println("보유기술 다중 insert성공!");
			
			/*수상내역 list로 insert*/
			for(int i=0; i<usersoloDTO.getAwardList().size(); i++) {
				//resumebasicDAO.insertBasicResume_award(usersoloDTO.getAwardList().get(i));
				System.out.println("수상내역 :"+usersoloDTO.getAwardList().get(i).toString());
			}System.out.println("슈상내역 다중 insert성공!");
			
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
	    * @Method Name : uploadFile
	    * @작성일 : 2017. 12. 04.
	    * @작성자 : 박현지
	    * @변경이력 : 
	    * @Method 설명 : **채용공고 이력서에 뜨는 개인정보 인적사항
	    * @param : String
	    * @return : UserSoloDTO 
	*/
	public UserSoloDTO getUserSoloInfo(String username) throws ClassNotFoundException, SQLException {
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		UserSoloDTO usersoloDTO= resumebasicDAO.getUserSoloInfo(username);
		return usersoloDTO;
	}
	
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
		UserSoloDTO portpolioDTO = resumebasicDAO.getBasicResume_portpolio(username);
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
	
	/* @Method 설명 : **pick_code에 해당하는 자소서 항목내용, 자소서 글자수 뽑기*/
	public List<CompPickInfoDTO> getCompQuestion(int pick_code) throws ClassNotFoundException, SQLException{
		ResumeBasicDAO resumebasicDAO = session.getMapper(ResumeBasicDAO.class);
		List<CompPickInfoDTO> compPickinfoDTO = resumebasicDAO.getCompQuestion(pick_code);
		for(int i=0; i<compPickinfoDTO.size(); i++) {
			System.out.println("자소서  항목 : "+i+"번째 자소서 항목 : "+compPickinfoDTO.get(i).getIntro_no()
								+"//"+ i+"번째 자소서 글자수 : "+compPickinfoDTO.get(i).getIntro_lim()
								+"//"+ i+"번재  pick_code : "+compPickinfoDTO.get(i).getPick_code());
		}
		return compPickinfoDTO;
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
		System.out.println(resumeDTO.getResu_code());
		System.out.println("username : "+resumeDTO.getUsername());
		System.out.println(resumeDTO.getPick_code());
		System.out.println(resumeDTO.getPaper_status());
		System.out.println(resumeDTO.getEdit_status());
		
		/* username과 pick_code로 생기는 resume table에 insert*/
		int result =resumeDAO.insertResumeTable(resumeDTO);
		/*	if(result >0) {
				System.out.println("resume 테이블에 입력 성공!");
			}*/
		
		
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
		
		int result=0;
		/* 학력2 list로 insert */
		for(int i=0; i<resumeDTO.getEduList2().size(); i++ ) {
			resumeDTO.getEduList2().get(i).setUsername(resumeDTO.getUsername());
			
			System.out.println("학력2 테이블에 set해준 username:"+resumeDTO.getEduList2().get(i).getUsername());
			
			result=resumeDAO.insertResumeCoverletter_edu(resumeDTO.getEduList2().get(i));
			
			System.out.println("map에서 받아오냐" + result);
			System.out.println("학력2 : "+resumeDTO.getEduList2().get(i).toString());
		}System.out.println("학력2 다중insert 성공!");
		
		
		
		return "redirect:/home.htm";
	}
	
}
