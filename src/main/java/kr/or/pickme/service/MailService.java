package kr.or.pickme.service;
/*
@class : MailService
@Date : 2017-12-01
@Author : 정수민
@Desc : 이메일 발송 처리
*/
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pickme.dto.UserSoloDTO;
@Service
public class MailService {
	@Autowired
	private SqlSession sqlsession;

//	public static String send(UserSoloDTO soloDTO) {
//	MailDao mdao = SqlSession.getMapper(MailDao.class);
//	MailDao.send(soloDTO);
//		return "redirect:compResume.htm";
	}
