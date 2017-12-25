package com.app.micimpact.web.common;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
 
@Component
public class MailServiceImpl implements MailService
{
 /**
  *
  */
	private static final long serialVersionUID = 6775482277311239787L;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MessageSource messageSource;
	
	@Override
	public void sendMail(String subject, String text, String toUser, String[] toCC) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			if (toCC != null) {
				messageHelper.setCc(toCC);
			}
			messageHelper.setSubject(subject);
			messageHelper.setFrom(toUser);
			messageHelper.setTo(toUser);
			messageHelper.setText(text, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
