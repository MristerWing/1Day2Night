package com.odtn.member.service;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.odtn.aop.LogAspect;

public class MailUtils {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailUtils(JavaMailSender mailSender) throws MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.MU OK");
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	public void setSubject(String subject) throws MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.sSubj OK");
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.sTxt OK");
		messageHelper.setText(htmlContent, true);
	}
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.sFrom OK");
		messageHelper.setFrom(email, name);
	}
	public void setTo(String email) throws MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.sTo OK");
		messageHelper.setTo(email);
	}
	public void addInline(String contentId, DataSource dataSource) throws MessagingException{
		LogAspect.logger.info(LogAspect.logMsg+"MailU.aIn OK");
		messageHelper.addInline(contentId, dataSource);
	}
	public void send() {
		LogAspect.logger.info(LogAspect.logMsg+"MailU.send OK");
		mailSender.send(message);
	}
}
