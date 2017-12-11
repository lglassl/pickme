package kr.or.pickme.dao;
/*
@class : ResumeBasicDAO.java
@Date : 2017-11-29
@Author : 박현지
@Desc : 초기 이력서 등록  DAO
*/

import java.sql.SQLException;
import java.util.List;

import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.SoloAwardDTO;
import kr.or.pickme.dto.SoloCareerDTO;
import kr.or.pickme.dto.SoloEduDTO;
import kr.or.pickme.dto.SoloLangDTO;
import kr.or.pickme.dto.SoloLicenseDTO;
import kr.or.pickme.dto.SoloPortpolioDTO;
import kr.or.pickme.dto.SoloSkillDTO;
import kr.or.pickme.dto.UserSoloDTO;

public interface ResumeBasicDAO {

	/*초기이력서 등록*/
	//초기 이력서-학력 등록
	public int insertBasicResume_edu(SoloEduDTO soloEduDTO ) throws ClassNotFoundException, SQLException;
	//초기 이력서-경력 등록
	public int insertBasicResume_career(SoloCareerDTO soloCareerDTO) throws ClassNotFoundException, SQLException;
	//초기 이력서-어학 등록
	public int insertBasicResume_lang(SoloLangDTO soloLangDTo) throws ClassNotFoundException, SQLException;
	//초기이력서 - 자격증 등록
	public int insertBasicResume_license(SoloLicenseDTO soloLicenseDTO)throws ClassNotFoundException, SQLException;
	//초기이력서 -포트폴리오 등록
	public int insertBasicResume_portpolio(UserSoloDTO usersoloDTO)throws ClassNotFoundException, SQLException;
	//초기이력서 -보유기술 등록
	public int insertBasicResume_skill(SoloSkillDTO soloSkillDTO)throws ClassNotFoundException, SQLException;
	//초기이력서 - 수상 등록
	public int insertBasicResume_award(SoloAwardDTO soloAwardDTO)throws ClassNotFoundException, SQLException;
	
//---------------------------------------------------------------------------------------/
	
	/*초기 이력서 정보 불러오기(수정 화면에 뿌릴 정보 얻어오는거) & 채용공고 코드에 해당하는 자소서 항목 불러오기*/
	// 개인정보 가져오기
	public UserSoloDTO getUserSoloInfo(String username)throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 학력 뽑기
	public List<SoloEduDTO> getBasicResume_edu(String username) throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 경력 뽑기
	public List<SoloCareerDTO> getBasicResume_career(String username) throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 어학 뽑기
	public List<SoloLangDTO> getBasicResume_lang(String username)throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 자격증뽑기
	public List<SoloLicenseDTO> getBasicResume_license(String username) throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 포트폴리오 뽑기 (1개뿐이어서 list로 안뽑는다)
	public UserSoloDTO getBasicResume_portpolio(String username) throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 보유기술 뽑기
	public List<SoloSkillDTO> getBasicResume_skill(String username) throws ClassNotFoundException, SQLException;
	//초기이력서에서 - 수상내역 뽑기
	public List<SoloAwardDTO> getBasicResume_award(String username) throws ClassNotFoundException, SQLException;
	//채용공고코드에 해당하는 자소서 질문/글자수 뽑기
	public List<CompPickInfoDTO> getCompQuestion(int pick_code) throws ClassNotFoundException, SQLException;
	
	
//-------------------------------------------------------------------------------------/	
	
	/*초기이력서 수정을 위한 기존 데이터 delete*/
	// 초기이력서에서 - 학력 삭제
	public int deleteBasicResume_edu(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 경력 삭제
	public int deleteBasicResume_career(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 어학 삭제
	public int deleteBasicResume_lang(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 자격증 삭제
	public int deleteBasicResume_license(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 포트폴리오 삭제
	public int deleteBasicResume_portpolio(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 보유기술 삭제
	public int deleteBasicResume_skill(String username) throws ClassNotFoundException, SQLException;
	// 초기이력서에서 - 수상 삭제
	public int deleteBasicResume_award(String username) throws ClassNotFoundException, SQLException;

	
	
	
}
