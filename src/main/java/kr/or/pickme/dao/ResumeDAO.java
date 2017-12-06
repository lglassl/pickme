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

public interface ResumeDAO {
	
	/*username으로 생기는 resume table에 insert*/
	public int insertResumeTable(ResumeDTO resumeDTO) throws ClassNotFoundException, SQLException;
	/*채용공고 이력서 - 학력2 등록*/
	public int insertResumeCoverletter_edu(SoloEduDTO2 soloEduDTO2) throws ClassNotFoundException, SQLException;
}
