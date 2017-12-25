package com.app.micimpact.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.app.micimpact.bean.Users;

@Service
public class SecurityUserService implements UserDetailsService {
	
    private static final Logger logger = LoggerFactory.getLogger(SecurityUserService.class);
    
//	@Autowired
//    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    

    public Users loadUserByUsername(String email, String password) throws UsernameNotFoundException {


        String hashedPassword = passwordEncoder.encodePassword(password, null);

        Users admin = new Users();
        admin.setEmail(email);
        admin.setPassword(hashedPassword);
        System.out.println("username");
        // 만약 데이터가 없을 경우 익셉션
        //if (user == null) throw new UsernameNotFoundException("접속자 정보를 찾을 수 없습니다.");
        return admin;
    }

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}
