package kr.or.pickme.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.pickme.controller.HomeController;
import kr.or.pickme.dao.CompPickInfoDAO;
import kr.or.pickme.dto.CompPickInfoDTO;
import kr.or.pickme.dto.LikeCartDTO;
import kr.or.pickme.dto.UserComPpDTO;

@Service
public class HomeService {
	@Autowired
	private SqlSession sqlsession; 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public String compList(Model model, Locale locale, HttpServletRequest request, String username) {
		//UI에서 처리
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		//채용공고 리스트 가져오기
		CompPickInfoDAO compPickInfoDAO = sqlsession.getMapper(CompPickInfoDAO.class);
		
		//채용정보, 채용상세정보, 자소서항목 리스트
		List <CompPickInfoDTO> compPickList = compPickInfoDAO.compList();
		System.out.println("comp : " + compPickList.size());
		System.out.println("comp : " + compPickList.get(1).toString());
		model.addAttribute("compPickList", compPickList);
		
		//기업정보 및 기업회원 리스트
		List <UserComPpDTO> userComPpList = compPickInfoDAO.userCompList();
		System.out.println("user : " + userComPpList.size());
		model.addAttribute("userComPpList", userComPpList);

		//로그인한 유저가 좋아요를 눌렀는지 확인
		List <LikeCartDTO> listLike = compPickInfoDAO.likeList(username);
		System.out.println("listLike : ");
		model.addAttribute("listLike", listLike);
		return "home.index";
	}
}
