package com.app.micimpact.security;

import org.springframework.security.web.authentication.WebAuthenticationDetails;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    private final String m_strType;
    private final String device_ios;
    private final String applicant_android;

    public CustomWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        m_strType = request.getParameter("type");
        device_ios = request.getParameter("device_ios");
        applicant_android = request.getParameter("gcm_token");
        
    }

    public String getType() {
        return m_strType;
    }

	public String getDevice_ios() {
		return device_ios;
	}

	public String getApplicant_android() {
		return applicant_android;
	}
    
   
}