/*
 * gmail을 이용한 메일보내기.
 * 
 */
package com.app.micimpact.mail;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

import com.app.micimpact.web.common.AmazonS3FileManager;
import com.app.micimpact.web.common.AmazonSES;

import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;



public class SendMail {
	private JavaMailSender mailSender;

	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	
	public void SendMail(String from, String to, String subject, String msg) {
		try {
			System.out.println(msg);
			
            MimeMessage message = mailSender.createMimeMessage();
            String encodingOptions = "text/html; charset=UTF-8";
            message.setHeader("Content-Type", encodingOptions);
            message.setSubject(subject, "UTF-8");
            MimeMessageHelper helper;
            helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(from);
            helper.setTo(to);
            
            helper.setText(msg, true);
            mailSender.send(message);
            
        } catch (MessagingException ex) {
            Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
	
	
}
