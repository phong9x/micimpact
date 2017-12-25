package com.app.micimpact.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.app.micimpact.bean.Point;
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.PointEntity;
import com.app.micimpact.business.service.PointService;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.business.service.mapping.PointServiceMapper;
import com.app.micimpact.web.common.Login;
import com.app.micimpact.web.common.ProcessPoint;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory
			.getLogger(CustomAuthenticationProvider.class);

	
//	@Autowired
//	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();;
	
	@Autowired
    private PasswordEncoder passwordEncoder;

	@Autowired
	private SaltSource saltSource;
	
	@Resource
	private UsersService UsersService;
	
	@Resource
	private PointService pointService;
	
	@Resource
	private PointServiceMapper pointServiceMapper;
	
	@Autowired
	private SecurityUserService securityUserService;


	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		
		Users loginAttemptUser = securityUserService.loadUserByUsername(username, password);
		CustomWebAuthenticationDetails details = (CustomWebAuthenticationDetails)authentication.getDetails();
		
		
		Collection<? extends GrantedAuthority> authorities;
		Users userOrigin = null;
		
		System.out.println("enter password :  " + loginAttemptUser.getPassword());
		System.out.println("details.getType() :  " + details.getType());
		System.out.println("username :  " + username);
		
		if (details.getType()!=null && !details.getType().equals("0"))
		{
			userOrigin = UsersService.checkSnsUser(password, details.getType());
			if(userOrigin!=null){
			List<PointEntity> list_point=pointService.findByUserIdAndCreatat(userOrigin.getId(), new Date());
			if(list_point==null || list_point.size()==0){
				Point point =new Point();
				point.setCreatat(new Date());
				point.setCommentTimes(0);
				point.setLoginTimes(1);
				point.setSeeContentTimes(0);
				point.setShareTimes(0);
				point.setUserId(userOrigin.getId());
				pointService.create(point);
				if(userOrigin.getPoint()==null){
					userOrigin.setPoint(20);
					userOrigin.setLevel(1);
				}else{
					userOrigin.setPoint(userOrigin.getPoint()+ProcessPoint.POINT_LOGIN);
				}
				Integer level =ProcessPoint.level_up(userOrigin.getPoint(), userOrigin.getLevel());
				userOrigin.setLevel(level);
			}
			UsersService.update(userOrigin);
			}
			if(userOrigin==null)
				throw new BadCredentialsException("아이디가 존재하지 않습니다.");
			//유저의 role정보 저장.
			Role role = new Role();
			role.setName(userOrigin.getUserRoles().getRole());
			List<Role> roles = new ArrayList<Role>();
	        roles.add(role);
	        userOrigin.setAuthorities(roles);
	        
		}
		else
		{
			userOrigin = UsersService.checkUser(username);
			if(userOrigin!=null){
			List<PointEntity> list_point=pointService.findByUserIdAndCreatat(userOrigin.getId(), new Date());
			if(list_point==null || list_point.size()==0){
				Point point =new Point();
				point.setCreatat(new Date());
				point.setCommentTimes(0);
				point.setLoginTimes(1);
				point.setSeeContentTimes(0);
				point.setShareTimes(0);
				point.setUserId(userOrigin.getId());
				pointService.create(point);
				if(userOrigin.getPoint()==null){
					userOrigin.setPoint(20);
					userOrigin.setLevel(1);
				}else{
					userOrigin.setPoint(userOrigin.getPoint()+ProcessPoint.POINT_LOGIN);
				}
				Integer level =ProcessPoint.level_up(userOrigin.getPoint(), userOrigin.getLevel());
				userOrigin.setLevel(level);
			}
			UsersService.update(userOrigin);
			}
			try {
				
				String hashedPassword = null;
				if(userOrigin==null){
					throw new BadCredentialsException("아이디가 존재하지 않습니다.");
				}else{
					hashedPassword = userOrigin.getPassword();
				}

				// 패스워드 비교
				if (!hashedPassword.equals(loginAttemptUser.getPassword())) {
					throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
				} else {
					
					//유저의 role정보 저장.
					Role role = new Role();
					role.setName(userOrigin.getUserRoles().getRole());
					List<Role> roles = new ArrayList<Role>();
	    	        roles.add(role);
	    	        userOrigin.setAuthorities(roles);
				}
				
			} catch (UsernameNotFoundException e) {
				logger.info(e.toString());
				throw new UsernameNotFoundException(e.getMessage());
			} catch (BadCredentialsException e) {
				logger.info(e.toString());
				throw new BadCredentialsException(e.getMessage());
			} catch (Exception e) {
				logger.info(e.toString());
				throw new RuntimeException(e.getMessage());
			}
		}
			
		authorities = userOrigin.getAuthorities();
		return new UsernamePasswordAuthenticationToken(userOrigin, password, authorities);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}
}
