package kr.or.pickme.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dto.UserSoloDTO;
@Service
public class mailService {
	@Autowired
	private SqlSession sqlsession;

//	public static String send(UserSoloDTO soloDTO) {
//	MailDao mdao = SqlSession.getMapper(MailDao.class);
//	MailDao.send(soloDTO);
//		return "redirect:compResume.htm";
	}
