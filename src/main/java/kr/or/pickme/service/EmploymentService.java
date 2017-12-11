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
import kr.or.pickme.dto.UserComPpDTO;

@Service
public class EmploymentService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//채용정보 등록 서비스
	@Transactional
	public String employmentInsert(CompPickInfoDTO C_dto) throws Exception {
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		String result = "employment.employmentinsert";
		System.out.println("c_dto : " + C_dto.toString());
		try {
			System.out.println("before : ");
			C_dto.setHire_code(dao.hire_Code(C_dto.getHire_field()));
			System.out.println(C_dto.getHire_code());
			C_dto.setJob_code(dao.job_Code(C_dto.getJob_field()));
			System.out.println(C_dto.getJob_code());
			int a = dao.employmentInsert(C_dto);
			System.out.println("채용정보 인서트" + a);
			
			for(int i=0; i<C_dto.getList().size(); i++) {
				int aaa=dao.pickintro_Insert(C_dto.getList().get(i));
				System.out.println("자소서 인서트 : " + aaa);
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
	
	// 채용정보 수정 Modal내용을 수정하기 위한 메소드
	public void employmentupdate(CompPickInfoDTO C_dto) throws SQLException, ClassNotFoundException {
		System.out.println("update service 탑니다.");
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		
		C_dto.setHire_code(dao.hire_Code(C_dto.getHire_field()));
		C_dto.setJob_code(dao.job_Code(C_dto.getJob_field()));
		
		int compUpdateResult = dao.employmentUpdate(C_dto);
		System.out.println("채용정보 업데이트 성공여부 : " + compUpdateResult);
		int introDeleteResult = dao.pickintro_Delete(C_dto.getPick_code());
		System.out.println("채용정보 자소서 공고코드에 대한 정보 삭제 성공여부 : " + introDeleteResult);
		
		int introReInsertResult = 0;
		
		for(int i=0; i<C_dto.getList().size(); i++) {
			C_dto.getList().get(i).setPick_code(C_dto.getPick_code());
			introReInsertResult = dao.pickintro_Update_Insert(C_dto.getList().get(i));
			System.out.println("채용정보 자소서 공고코드에 대한 정보 삭제 후  재등록 성공여부 : " + introReInsertResult);
		}
		
		if(compUpdateResult == 0 && introDeleteResult == 0 && introReInsertResult == 0) {
			System.out.println("수정실패");
		} else {
			System.out.println("올 성공");
		}
		
	}
	
	public List<UserComPpDTO> employmentDetail_Compinfo(String username) throws SQLException, ClassNotFoundException {
		
		System.out.println("service 탄다");
		
		EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
		UserComPpDTO CompinfoDto = dao.employmentDetail_Compinfo(username);
		UserComPpDTO UserComPpDto = dao.employmentDetail_UserComp(username);
		
		List<UserComPpDTO> list = new ArrayList<UserComPpDTO>();
		list.add(CompinfoDto);
		list.add(UserComPpDto);
		//list.add(CompPickInfoDto);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("service return 하기 전  " + i + "번째 방 객체  "+ list.get(i).toString());
		}
		
		return list;
	}
		
	public List<CompPickInfoDTO> employmentDetail_CompDetail(String username, int pick_code) throws SQLException, ClassNotFoundException {
			
			System.out.println("service 탄다");
			
			EmploymentDAO dao = sqlsession.getMapper(EmploymentDAO.class);
			CompPickInfoDTO CompPickInfoDto = dao.employmentDetail_CompPick(username, pick_code);
			CompPickInfoDto.setHire_field(dao.hire_Field(CompPickInfoDto.getHire_code()));
			CompPickInfoDto.setJob_field(dao.job_Field(CompPickInfoDto.getJob_code()));
			CompPickInfoDto.setPick_start(CompPickInfoDto.getPick_start().substring(0, 10));
			CompPickInfoDto.setPick_end(CompPickInfoDto.getPick_end().substring(0, 10));
			
			List<CompPickInfoDTO> list = new ArrayList<CompPickInfoDTO>();
			list.add(CompPickInfoDto);
			
			for(int i=0; i<list.size(); i++) {
				System.out.println("service return 하기 전  " + i + "번째 방 객체  "+ list.get(i).toString());
			}
			
			return list;
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
