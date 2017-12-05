package kr.or.pickme.controller;


import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.ui.velocity.VelocityEngineUtils;


public class Comp_email {

	@Autowired
	private VelocityEngine ve;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	public void sendMail() {
		System.out.println("여긴오니??????????????????");
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			System.out.println("여긴오니?1");
			//messageHelper.setSubject(user.getSolo_name() + "님께");
			messageHelper.setSubject("오영진님께");
			messageHelper.setFrom("50JIN");
			messageHelper.setTo("dydxk3@gmail.com");
			//아직 DB에 데이터가 없기 때문에
			//messageHelper.setTo(user.getSolo_email());
			System.out.println("여긴오니?2");
			Map model = new HashMap<>();
			model.put("name", "name");
			model.put("cname", "cname");
			
			String text = VelocityEngineUtils.mergeTemplateIntoString(
					ve, "kr/or/pickme/controller/email.vm", "UTF-8", model);
			
			messageHelper.setText(text, true);
			mailSender.send(message);
			
		} catch (Exception ex) {
			System.out.println("예외발생이요 ㅠㅠ");
			System.out.println(ex.getMessage());
		}

	}
	
}
