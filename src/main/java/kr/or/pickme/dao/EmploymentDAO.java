package kr.or.pickme.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.pickme.dto.CompPickInfoDTO;

public interface EmploymentDAO {
	
	//채용코드를 이용한 채용형태이름 뽑기
	public String hire_Field(int hire_code) throws ClassNotFoundException, SQLException;
	
	//직무코드를 이용한 직무이름 뽑기 
	public String job_Field(int job_code) throws ClassNotFoundException, SQLException;
	
	//채용필드를 이용한 채용코드 뽑기
	public int hire_Code(String hire_field) throws ClassNotFoundException, SQLException;
		
	//직무필드를 이용한 직무코드 뽑기 
	public int job_Code(String job_field) throws ClassNotFoundException, SQLException;
	
	
	//공고코드에 해당하는 내용들 수정하려고 리스트  modal 띄우기(화면출력용)
	public CompPickInfoDTO employment_UpdatePrint(int pick_code) throws ClassNotFoundException, SQLException;
	
	//Modal에 자소서 항목 띄우기 (화면출력용)
	public List<CompPickInfoDTO> employment_Update_introPrint(int pick_code) throws ClassNotFoundException, SQLException;
	
	
	
	//기업회원 등록된 공고코드, 기업아이디, 직무코드, 채용형태코드 출력
	public List<CompPickInfoDTO> employment_pickcodePrint(String username) throws ClassNotFoundException, SQLException;
	
	//채용정보 등록
	public int employmentInsert(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	
	//채용정보 수정
	public List<CompPickInfoDTO> employmentUpdate(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	
	//자소서항목 등록
	public int pickintro_Insert(CompPickInfoDTO C_dto) throws ClassNotFoundException, SQLException;
	
	//채용형태 리스트 출력
	public List<CompPickInfoDTO> hiredata_Print() throws ClassNotFoundException, SQLException;
	
	//직무종류 리스트 출력
	public List<CompPickInfoDTO> jobdata_Print() throws ClassNotFoundException, SQLException;
}
