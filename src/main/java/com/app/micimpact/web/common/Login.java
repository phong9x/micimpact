package com.app.micimpact.web.common;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.business.service.UsersService;

public class Login {

	String password;
	String username;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public static String checkLogin(HttpSession session) {
		if (session.getAttribute("login") != null && session.getAttribute("login")!="" ) {
			return "1";
		} 
			return "0";
	}
	


	public static void  saveAdmin(Users user,HttpSession session) {
		session.setAttribute("admin", user);
	}
	
	public static String checkAdminLogin(HttpSession session) {
		if (session.getAttribute("admin") != null && session.getAttribute("admin")!="") {
			return "1";
		} 
			return "0";
	}

	public static void  save(Users user,HttpSession session) {
		session.setAttribute("login", user);
	}

	
	public static Users  getUserLogin(HttpSession session) {
		Users user =(Users) session.getAttribute("login");
		return user;
	}
	
	public static Users  getAdminLogin(HttpSession session) {
		Users user =(Users) session.getAttribute("admin");
		return user;
	}
	public static String checkLogin() {
			return "0";
	}
	
	
	
	
	
}