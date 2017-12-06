package kr.or.pickme.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.pickme.dao.EmploymentDAO;
import kr.or.pickme.dto.CompPickInfoDTO;

@Service
public class EmploymentService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//채용정보 등록 서비스
	@Transactional
	public String employmentInsert(CompPickInfoDTO C_dto) throws Exception {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		String result = "employment.employmentinsert";
		try {
			System.out.println("before : ");
			C_dto.setHire_code(dao.hire_Code(C_dto.getHire_field()));
			System.out.println(C_dto.getHire_code());
			C_dto.setJob_code(dao.job_Code(C_dto.getJob_field()));
			System.out.println(C_dto.getJob_code());
			int a = dao.employmentInsert(C_dto);
			
			for(int i=0; i<C_dto.getList().size(); i++) {
				dao.pickintro_Insert(C_dto.getList().get(i));
			}
			
			System.out.println("여기타면 인서트 전부 다 완료 !" + a);
			result = "employment.employmentlist";
			
		 } catch(Exception e) {
			 System.out.println("Transaction 예외 발생 " + e.getMessage());
			 System.out.println("여기타면  뭐가 안됬을거다잉");
			 throw e; //예외 발생 시기면  : 자동 rollback
		 }
		
		return result;
	}

	//기업회원 공고리스트 출력
	public List<CompPickInfoDTO> employmentPrint(String username) throws SQLException, ClassNotFoundException {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		
		System.out.println("username = " + username);
		List<CompPickInfoDTO> list = dao.employment_pickcodePrint(username);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setHire_field(dao.hire_Field(list.get(i).getHire_code()));
			list.get(i).setJob_field(dao.job_Field(list.get(i).getJob_code()));
		}
		return list;
	}

	
	// 채용정보 수정화면에 기존에 등록되있던 리스트를 modal에 출력하는 서비스
	public CompPickInfoDTO employment_updatePrint(int pick_code) throws SQLException, ClassNotFoundException {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		
		System.out.println("serviceeeeee : " + pick_code);
		
		CompPickInfoDTO dto = dao.employment_UpdatePrint(pick_code);
		dto.setHire_field(dao.hire_Field(dto.getHire_code()));
		dto.setJob_field(dao.job_Field(dto.getJob_code()));
		
		List<CompPickInfoDTO> list = dao.employment_Update_introPrint(pick_code);
		
		dto.setList(list);
		
		System.out.println(dto.toString());
		
		return dto;
	}
	
	
	
	//채용형태 출력 서비스
	public List<CompPickInfoDTO> hiredata_print() throws SQLException, ClassNotFoundException {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		List<CompPickInfoDTO> list = dao.hiredata_Print();
		return list;
	}
	
	//직무종류 출력 서비스
	public List<CompPickInfoDTO> jobdata_print() throws SQLException, ClassNotFoundException {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		List<CompPickInfoDTO> list = dao.jobdata_Print();
		return list;
	}
}
