package kr.or.pickme.dao;
/*
@class : ResumeDAO.java
@Date : 2017-11-29
@Author : 박현지
@Desc : 지원 이력서/자기소개서 등록 DAO
*/

import java.sql.SQLException;
import java.util.List;

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
import kr.or.pickme.dto.SoloSkillDTO;
import kr.or.pickme.dto.SoloSkillDTO2;
import kr.or.pickme.dto.UserSoloDTO;

public interface ResumeDAO {
	
	/*-------- 채용공고에 이력서 및 자기소개서 등록-------------*/
	//username에 해당하는 pick_code가 존재하는지 확인 -> 존재하면 지원하기 페이지 진입금지!
	public String getUsernamePerPickCode(UserSoloDTO userSoloDTO)throws ClassNotFoundException, SQLException;
	//username으로 생기는 resume table에 insert
	public int insertResumeTable(ResumeDTO resumeDTO) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 학력2 등록
	public int insertResumeCoverletter_edu(SoloEduDTO2 soloEduDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 경력2 등록
	public int insertResumeCoverletter_career(SoloCareerDTO2 soloCareerDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 어학2 등록
	public int insertResumeCoverletter_lang(SoloLangDTO2 soloLangDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 자격증 등록
	public int insertResumeCoverletter_license(SoloLicenseDTO2 soloLicenseDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 포트폴리오 등록
	public int insertResumeCoverletter_portpolio(ResumeDTO resumeDTO)  throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 보유기술 등록
	public int insertResumeCoverletter_skill(SoloSkillDTO2 soloSkillDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 수상 등록
	public int insertResumeCoverletter_award(SoloAwardDTO2 soloAwardDTO2) throws ClassNotFoundException, SQLException;
	//채용공고 이력서 - 자기소개서 등록
	public int insertCoverletter2Table (CoverletterDTO2 coverletterDTO2) throws ClassNotFoundException, SQLException;
	
	
	//---------------------------------------------------------------------------------------/
	
	/* 지원 이력서 정보 불러오기(수정 화면에 뿌릴 정보 얻어오는거) & 채용공고 코드에 해당하는 자소서 항목 불러오기*/
	//지원이력서에서 - 학력 뽑기
	public List<SoloEduDTO2> getResumeCoverletter_edu(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 경력 뽑기
	public List<SoloCareerDTO2> getResumeCoverletter_career(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 어학 뽑기
	public List<SoloLangDTO2> getResumeCoverletter_lang(String username, int resu_code)throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 자격증뽑기
	public List<SoloLicenseDTO2> getResumeCoverletter_license(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 포트폴리오 뽑기 (1개뿐이어서 list로 안뽑는다)
	public ResumeDTO getResumeCoverletter_portpolio(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 보유기술 뽑기
	public List<SoloSkillDTO2> getResumeCoverletter_skill(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원이력서에서 - 수상내역 뽑기
	public List<SoloAwardDTO2> getResumeCoverletter_award(String username, int resu_code) throws ClassNotFoundException, SQLException;
	// 지원이력서에서 - coverletter 자기소개서 부분 뽑기
	public List<CoverletterDTO2> getResumeCoverletter_list(String username, int resu_code) throws ClassNotFoundException, SQLException;
		
		
	//-------------------------------------------------------------------------------------/	
	
	
	/* 지원 이력서 수정을 위한 기존 데이터 delete*/
	//지원 이력서에서 - 학력 삭제
	public int deleteResumeCoverletter_edu(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 경력 삭제
	public int deleteResumeCoverletter_career(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 어학 삭제
	public int deleteResumeCoverletter_lang(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 자격증 삭제
	public int deleteResumeCoverletter_license(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 포트폴리오 삭제
	public int deleteResumeCoverletter_portpolio(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 보유기술 삭제
	public int deleteResumeCoverletter_skill(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 수상 삭제
	public int deleteResumeCoverletter_award(String username, int resu_code) throws ClassNotFoundException, SQLException;
	//지원 이력서에서 - 자기소개서 삭제
	public int deleteResumeCoverletter_coverletter(String username, int resu_code) throws ClassNotFoundException, SQLException;

	
	
	
	
}
