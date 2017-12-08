package kr.or.pickme.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.View;

import kr.or.pickme.dao.CompPickInfoDAO;
import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.LikeCartDTO;
import kr.or.pickme.dto.UserComPpDTO;

@Service
public class CompanyPickBoardService {
	
	@Autowired
	private SqlSession sqlsession; 
	
	@Autowired
	private View jsonview;

	//채용공고 리스트(게시판)로 뽑아오기
	public String compList(Model model) {
		//채용공고 리스트 가져오기
		CompPickInfoDAO compPickInfoDAO = sqlsession.getMapper(CompPickInfoDAO.class);
		
		//채용정보, 채용상세정보, 자소서항목 리스트
		List <CompPickInfoDTO> compPickList = compPickInfoDAO.compList();
		System.out.println("comp : " + compPickList.get(1).toString());
		model.addAttribute("compPickList", compPickList);
		
		//기업정보 및 기업회원 리스트
		List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
		System.out.println("user : " + userComPpList.get(1).toString());
		model.addAttribute("userComPpList", userComPpList);
		return "comp_pick.comp_pick_list";
	}
	
	//채용공고 달력으로 뽑아오기
	public String compListCal(Model model) {
		//채용공고 리스트 가져오기
		CompPickInfoDAO compPickInfoDAO = sqlsession.getMapper(CompPickInfoDAO.class);
		JSONArray jsonarr = new JSONArray();
		
		//채용정보, 채용상세정보, 자소서항목 리스트
		List <CompPickInfoDTO> compPickList = compPickInfoDAO.compList();
		System.out.println("comp : " + compPickList.get(1).toString());
		System.out.println("compsize : "+ compPickList.size());
		//model.addAttribute("compPickList", compPickList);
		
		/*//list 뽑아오기
		for(CompPickInfoDTO compPick : compPickList) {
			jsonobj.put("title", compPick.get);
			jsonarr.add(compPick);
		}
		jsonobj.put("jsoncompPickList", jsonarr);
		model.addAttribute("jsonCompPickList", jsonobj);*/
		
		//기업정보 및 기업회원 리스트
		List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
		System.out.println("user : " + userComPpList.get(1).toString());
		System.out.println("usersize : " + userComPpList.size());
		//model.addAttribute("userComPpList", userComPpList);	
		/*
		for(UserComPpDTO usercompPick : userComPpList) {
			jsonobj.put("title", usercompPick.getComp_name());
			jsonobj.put("start", usercompPick.get)
			jsonarr2.add(usercompPick);
		}
		jsonobj2.put("jsonuserComPpList", jsonarr2);
		model.addAttribute("jsonUserComPpList", jsonobj2);*/
		
		
		for(int i=0; i<userComPpList.size()-1; i++) {
			for(int j=0; j<compPickList.size()-1; j++) {
				if(userComPpList.get(i).getUsername().equals(compPickList.get(j).getUsername())) {
					JSONObject jsonobj = new JSONObject();
					System.out.println(userComPpList.get(i).getComp_name());
					jsonobj.put("title", userComPpList.get(i).getComp_name()+ "("+compPickList.get(j).getJob_field()+")");
					jsonobj.put("start", compPickList.get(j).getPick_start());
					jsonobj.put("end", compPickList.get(j).getPick_end());
					jsonarr.add(jsonobj);
				}
			}
		}
		model.addAttribute("compInfo", jsonarr);
		return "comp_pick.comp_pick_cal";
	}
	
	public View filterSearch(String job_field, String username, String comp_name, Model model) {
		CompPickInfoDAO compPickInfoDAO = sqlsession.getMapper(CompPickInfoDAO.class);
		if(job_field.equals("나의 채용공고")) {
			//기업정보 및 기업회원 리스트
			List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
			System.out.println("user : " + userComPpList.size());
			model.addAttribute("userComPpList", userComPpList);
			
			//기업 공고 리스트
			List <CompPickInfoDTO> compPickLikeList = compPickInfoDAO.compLikeList(username);
			System.out.println("comp : " + compPickLikeList.get(1).toString());
			model.addAttribute("filterCompPickInfoList", compPickLikeList);
			
			
		}else if(comp_name.equals("")) {	//필터 공고 리스트
			//직무 필터 공고 리스트
			List <CompPickInfoDTO> filterCompPickInfoList = compPickInfoDAO.filterCompList(job_field);
			System.out.println("filter Length : " + filterCompPickInfoList.size());
			if(filterCompPickInfoList.size() == 0) {	//필터링 처리 시 아무 값이 없을 시
				model.addAttribute("filterCompPickInfoList", null);
			}else {	//하나의 값이라도 있을 시
				model.addAttribute("filterCompPickInfoList", filterCompPickInfoList);
			}
			
			//기업정보 및 기업회원 리스트
			List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
			System.out.println("user : " + userComPpList.size());
			model.addAttribute("userComPpList", userComPpList);
			
		}else {	//사용자 기업 검색 공고 리스트
			System.out.println("comp_name : " + comp_name);
			//기업 공고 리스트
			List <CompPickInfoDTO> compPickList = compPickInfoDAO.compList();
			System.out.println("comp : " + compPickList.get(1).toString());
			model.addAttribute("filterCompPickInfoList", compPickList);
			
			//기업정보 및 기업회원 리스트
			List <UserComPpDTO> userComPpNameList = compPickInfoDAO.userCompNameList(comp_name);
			System.out.println("123");
			System.out.println("comp_name_user : " + userComPpNameList.size());
			model.addAttribute("userComPpList", userComPpNameList);
			
		}
		//좋아요
		//로그인한 유저가 좋아요를 눌렀는지 확인
		List <LikeCartDTO> listLike = compPickInfoDAO.likeList(username);
		System.out.println("listLike : ");
		model.addAttribute("listLike", listLike);
		
		return jsonview;
	}
	
}
