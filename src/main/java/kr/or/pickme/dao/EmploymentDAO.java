package kr.or.pickme.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.UserComPpDTO;

public interface EmploymentDAO {
	
	//채용코드를 이용한 채용형태이름 뽑기
	public String hire_Field(int hire_code) throws ClassNotFoundException, SQLException;
	//직무코드를 이용한 직무이름 뽑기 
	public String job_Field(int job_code) throws ClassNotFoundException, SQLException;
	
	
	//채용필드를 이용한 채용코드 뽑기
	public int hire_Code(String hire_field) throws ClassNotFoundException, SQLException;
	//직무필드를 이용한 직무코드 뽑기 
	public int job_Code(String job_field) throws ClassNotFoundException, SQLException;
	
	
	//공고코드에 해당하는 내용들을 수정하기 위한 리스트  modal 띄우기(화면출력용)
	public CompPickInfoDTO employment_UpdatePrint(int pick_code) throws ClassNotFoundException, SQLException;
	
	
	//Modal에 자소서 항목 띄우기 (화면출력용)
	public List<CompPickInfoDTO> employment_Update_introPrint(int pick_code) throws ClassNotFoundException, SQLException;
	
	//기업회원 등록된 공고코드, 기업아이디, 직무코드, 채용형태코드 출력    ------->>>>> 개인공고리스트에서 공고코드에 대하여 화면에 띄워줄 정보 출력
	public List<CompPickInfoDTO> employment_pickcodePrint(String username) throws ClassNotFoundException, SQLException;
	
	
	
	//상세요강 페이지 기업정보 select
	public UserComPpDTO employmentDetail_Compinfo(String username) throws ClassNotFoundException, SQLException;
	//상세요강 페이지 기업회원 정보 select
	public UserComPpDTO employmentDetail_UserComp(String username) throws ClassNotFoundException, SQLException;
	//상세요강 페이지 기업아이디와 공고코드로 채용정보 select
	public CompPickInfoDTO employmentDetail_CompPick(String username, int pick_code) throws ClassNotFoundException, SQLException;
	
	
	
	
	
	//---------- <채용 정보 등록> --- <자소서 항목 등록> -------------------------------------------------//
	//채용정보 등록
	public int employmentInsert(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	//자소서항목 등록
	public int pickintro_Insert(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	//------------------------------------------------------------------------------------------//
	
	
	//---------- <채용정보 수정 > --- <공고코드에 대한 자소서번호를 전부다 delete 후 새로운 정보들을 insert >------------//
	//채용정보 수정
	public int employmentUpdate(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	//자소서항목 삭제
	public int pickintro_Delete(int pick_code) throws ClassNotFoundException, SQLException;	
	//자소서항목 등록
	public int pickintro_Update_Insert(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	//-------------------------------------------------------------------------------------------//
	
	
	//---------- <채용정보 등록> --- < DB에 있는 직무종류와 채용형태 의 리스트를 출력 > -----------------------------//
	//채용형태 리스트 출력
	public List<CompPickInfoDTO> hiredata_Print() throws ClassNotFoundException, SQLException;
	//직무종류 리스트 출력
	public List<CompPickInfoDTO> jobdata_Print() throws ClassNotFoundException, SQLException;
	//-------------------------------------------------------------------------------------------//
	
}
