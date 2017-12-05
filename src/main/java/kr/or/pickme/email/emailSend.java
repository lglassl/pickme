package kr.or.pickme.email;

/*
@class : emailSend
@Date : 2017-11-30
@Author : 강희창
@Desc : 
*/

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

import kr.or.pickme.dto.UserComPpDTO;
import kr.or.pickme.dto.UserSoloDTO;

public class emailSend {

	@Autowired
	private VelocityEngine ve;
	
	@Autowired
	private JavaMailSender mailSender;

	/*개인회원 권한이메일 발송*/
	public void sendToSolo(UserSoloDTO solo) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(solo.getSolo_name() + "님 회원가입을 축하드립니다.");
			messageHelper.setFrom("510jin@gmail.com","Pick Me");
			messageHelper.setTo(solo.getSolo_email());
			
			Map model = new HashMap<>();
			model.put("name", solo.getSolo_name());
			model.put("username", solo.getUsername());
			
			String text = VelocityEngineUtils.mergeTemplateIntoString(
					ve, "kr/or/pickme/email/email.vm", "UTF-8",model);
			
			messageHelper.setText(text, true);	
			mailSender.send(message);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	
	/*개인회원 비밀번호 재설정*/
	public void sendToSoloPwd(UserSoloDTO solo, String pwd) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(solo.getUsername() + "님 비밀번호입니다.");
			messageHelper.setFrom("510jin@gmail.com","Pick Me");
			messageHelper.setTo(solo.getSolo_email());
			
			Map model = new HashMap<>();
			model.put("username", solo.getUsername());
			model.put("password", pwd);
			
			String text = VelocityEngineUtils.mergeTemplateIntoString(
					ve, "kr/or/pickme/email/newPwd.vm", "UTF-8",model);
			
			messageHelper.setText(text, true);	
			mailSender.send(message);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	
	/*기업회원 비밀번호 재설정*/
	public void sendToCompPwd(UserComPpDTO dto, String pwd) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(dto.getUsername() + "님 비밀번호입니다.");
			messageHelper.setFrom("510jin@gmail.com","Pick Me");
			messageHelper.setTo(dto.getComp_pp_email());
			
			Map model = new HashMap<>();
			model.put("username", dto.getUsername());
			model.put("password", pwd);
			
			String text = VelocityEngineUtils.mergeTemplateIntoString(
					ve, "kr/or/pickme/email/newPwd.vm", "UTF-8",model);
			
			messageHelper.setText(text, true);	
			mailSender.send(message);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
