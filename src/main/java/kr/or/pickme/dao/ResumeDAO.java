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
}
