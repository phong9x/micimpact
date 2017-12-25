package com.app.micimpact.rest.common.notification;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.app.micimpact.rest.common.notification.android.POST2GCM;
import com.app.micimpact.rest.common.notification.android.vo.Content;
import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;

public class Notification {
	@Autowired
	static
	ServletContext servletContext;
	
	private static String API_KEY = "AIzaSyAPT9WP3DZjvDcOyRPxwXN3xh-3CeE_wMg";
	/**
	 * 
	 * @param token
	 * @param message
	 * @return
	 */
	public static String sendNoti(String regId,String title, String message,ServletContext servletContext){
			try {
				sendAndroid(regId,title,message);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			try {
				sendiOS(regId,title,message,servletContext);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		return "";
	}
	
	/**
	 * 
	 * @param token
	 * @param message
	 * @return
	 */
	public static String sendAndroid(String regId,String title, String message){
			try {

				Content c = new Content();
				
				c.addRegId(regId);
				c.createData(title, message);
				
				POST2GCM.post(API_KEY, c);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		return "";
	}
	/**
	 * 
	 * @param token
	 * @param message
	 * @return
	 */ 
		
	public static String sendiOS(String regId,String title, String message, ServletContext servletContext){
		try {
			
			String patch = servletContext.getRealPath("")+"/assets/cert/";
			System.out.println(servletContext.getRealPath(""));
			ApnsService service =
				    APNS.newService()
				    .withCert(patch+"micimpact_ios.p12", "12345678")
				    //.withCert("E:/Project/micimpact/src/main/webapp/assets/cert/micimpact_ios.p12", "12345678")
				    .withSandboxDestination()
				    .build();
			String payload = APNS.newPayload().alertBody(message).build();
			String token = regId;
			service.push(token, payload);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return "Success";
	}
	public static void main(String[] df){
		sendiOS("3f1255bb21c2f033a8ec6e21e7947f1a81b0e67609328e5b80e1b196169cc34c","Kenny Phong","Kenny Phong send $1.000S for you",servletContext);
		System.out.println("OK");
	}
}
