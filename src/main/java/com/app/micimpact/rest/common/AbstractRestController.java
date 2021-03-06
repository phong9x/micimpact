/*
 * Created on 4 May 2015 ( Time 15:47:17 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.rest.common;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.util.IOUtils;
import com.app.micimpact.web.common.AmazonS3FileManager;
import com.app.micimpact.web.common.AmazonSES;


public abstract class AbstractRestController {
	
	
	@Autowired
    private  VelocityConfig velocityConfig;
	
	@Autowired
	private AmazonS3FileManager amazonS3FileManager;
	
	  public   void main(String[] args) throws AddressException, MessagingException{
		  HashMap<String, Object> emailParams = new HashMap<String, Object>();
			emailParams.put("name", "Kenny Phong");
			emailParams.put("password", "122345");
			//sendMail("[MICIMPACT]비밀번호 찾기", "kennyphong2811@gmail.com", "find_password.vm", emailParams);
		  
	  }

	public  void sendMail(String title, String recvMail, String velocityid, Map<String, Object> params) throws AddressException, MessagingException {
		try {
			String body =  VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.getVelocityEngine(), velocityid, "UTF-8", params);
			AmazonSES ses = new AmazonSES(title, body, recvMail);
			ses.sendMail();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	
	public HashMap<String, Object> SUCCESS(HashMap<String, Object> ret)
	{
		ret.put("success", true);
		ret.put("message", "정상처리 되었습니다.");
		System.out.println("success:"+ret.toString());
		return ret;
	}
	
	public HashMap<String, Object> FAIL(HashMap<String, Object> ret, String message)
	{
		ret.put("success", false);
		ret.put("message", message);
		System.out.println("fail:"+ret.toString());
		return ret;
	}
	
	public String uploadS3(String prefix, MultipartFile file, String extension)
	{
		String fileName = UUID.randomUUID().toString()+"."+extension;		 
		String path = prefix+"/"+fileName;
		
		System.out.println("upload file:"+fileName);
		System.out.println("oke:"+fileName);
	    try {
	        InputStream is = file.getInputStream();
	        byte[] contentBytes = IOUtils.toByteArray(is);
	        ByteArrayInputStream bis = new ByteArrayInputStream(contentBytes);
	        Long contentLength = Long.valueOf(contentBytes.length);
	        
	        System.out.println("contentLength:"+contentLength);
	        ObjectMetadata metadata = new ObjectMetadata();
		    metadata.setContentLength(contentLength);
		    
		    
		    if (amazonS3FileManager.upload(path, bis, metadata)){
		    	System.out.println("amazonS3FileManager upload");
		    	return path;
		    }
		    	
		    else{
		    	System.out.println("amazonS3FileManager null");
		    	return null;
		    }
		    	
		     
	    } 
	    catch (IOException e) 
	    {
	        System.err.printf("Failed while reading bytes from %s", e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	    	System.out.println("Exception:"+e);
	    	e.printStackTrace();
	    }
	    return null;
	}
	
	public boolean deleteS3(String filePath)
	{
		System.out.println("delete file:"+filePath);
	    return amazonS3FileManager.delete(filePath);	
	}
	
}