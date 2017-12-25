package com.app.micimpact.security;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.app.micimpact.bean.Users;
import com.app.micimpact.web.common.Login;
import com.app.micimpact.web.common.ProcessPoint;

public class SigninSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
     private static final Logger logger = LoggerFactory.getLogger(SigninSuccessHandler.class);

     @Override
     public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
          String accept = request.getHeader("accept");
         int userType = 0;
         Users user = (Users)auth.getPrincipal();
         Collection<? extends GrantedAuthority> g = auth.getAuthorities();
         String role = "";
		for (GrantedAuthority grantedAuthority : g) {
			role = grantedAuthority.getAuthority();
		}   
		if (role.equals("ROLE_ADMIN")) {
			userType = 1;
			HttpSession session = request.getSession(true);
			Login.saveAdmin(user, session);
		}
		else if(role.equals("ROLE_RESU")){
			userType = 2;
		}
		else if(role.equals("ROLE_USER")){
			userType = 3;
		}
		
          logger.info("onAuthenticationSuccess : " + StringUtils.indexOf(accept, "html"));

          if( StringUtils.indexOf(accept, "html") > -1 ) {
        	  logger.info("SigninSuccessHandler get Request");
               super.onAuthenticationSuccess(request, response, auth);

          } else if( StringUtils.indexOf(accept, "xml") > -1 ) {
               response.setContentType("application/xml");
               response.setCharacterEncoding("utf-8");

               String data = StringUtils.join(new String[] {
                    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>",
                    "<response>",
                    "<error>false</error>",
                    "<type>"+userType+"</type>",
                    "<message>로그인하였습니다.</message>",
                    "</response>"
               });

               PrintWriter out = response.getWriter();
               out.print(data);
               out.flush();
               out.close();

          } else {
               response.setContentType("application/json");
               response.setCharacterEncoding("utf-8");
               String profileUrl = user.getProfileUrl();
               if (profileUrl!=null)
            	   profileUrl="\""+profileUrl+"\"";
               String data = StringUtils.join(new String[] {
                    " { " +
                    " \"type\" : "+ userType + " , ",
                    " \"user_id\" : "+ user.getId() + " , ",
                    " \"name\" : \""+ user.getName() + "\" , ",
                    " \"profile_url\":"+ profileUrl + ", ",
                    " \"level\" : "+ user.getLevel() + " , ",
                    " \"point\" : "+ user.getPoint() + " , ",
                    " \"message\" : \"로그인하였습니다.\" ,",
                    " \"success\" : true " ,
                    "} "
               });
               System.out.println("login data:"+data);
               PrintWriter out = response.getWriter();
               out.print(data);
               out.flush();
               out.close();

          }
     }
}