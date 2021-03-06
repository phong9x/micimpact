/*
 * Created on 9 12월 2015 ( Time 16:26:43 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.rest.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.app.micimpact.bean.UserTags;
import com.app.micimpact.bean.Users;
import com.app.micimpact.business.service.UserTagsService;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.rest.common.AbstractRestController;
import com.app.micimpact.web.common.Kakao;
import com.app.micimpact.web.common.Login;
import com.app.micimpact.web.common.Naver;

/**
 * Spring MVC controller for 'Users' management.
 */
@RequestMapping("/user")
@Controller
public class UsersRestController extends AbstractRestController {


	@Value("#{commonConfig['s3.profile.path']}")
	protected String profile_upload_path;
	
	@Resource
	private UsersService usersService;

	@Autowired
    private PasswordEncoder passwordEncoder;

	@Resource
	private UserTagsService userTagsService;


	@RequestMapping( value="/set_push",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> set_push(UsernamePasswordAuthenticationToken principal
			, @RequestParam("on") Integer on)
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		Users login_user = principal!=null ? (Users)principal.getPrincipal() : null;
		if (login_user==null || login_user.getId()==null)
		{
			return FAIL(ret, "비로그인 유저입니다.");
		}
		if (on==null)
		{
			return FAIL(ret, "인자 확인해주세요.");
		}
		 Users update_user = new Users();
		 update_user.setId(login_user.getId());
		 update_user.setPushState(on);
		 if (usersService.update(update_user)!=null)
				return SUCCESS(ret);
			else
				return FAIL(ret, "잠시후 다시 시도해주세요.");
	}
	
	
	
	@RequestMapping( value="/users/{id}",
			method = {RequestMethod.GET},
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Users findOne(@PathVariable("id") Integer id) {
		return usersService.findById(id);
	}
	
	@RequestMapping( value="/change_pw",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> changePassword(UsernamePasswordAuthenticationToken principal 
			, @RequestParam(value="current_password", required=false) String current_password
			, @RequestParam(value="new_password", required=false) String new_password)
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		Users login_user = principal!=null ? (Users)principal.getPrincipal() : null;
		if (login_user==null || login_user.getId()==null)
		{
			return FAIL(ret, "비로그인 유저입니다.");
		}
		
		if (current_password==null || new_password==null)
		{
			return FAIL(ret, "인자 확인해주세요.");
		}
		
		if (!passwordEncoder.encodePassword(current_password, null).equals(login_user.getPassword()))
		{
			return FAIL(ret, "현재 비밀번호가 일치하지 않습니다.");
		}
		
		 login_user.setPassword(passwordEncoder.encodePassword(new_password, null));
		
		 if (usersService.update(login_user)!=null)
				return SUCCESS(ret);
			else
				return FAIL(ret, "잠시후 다시 시도해주세요.");
		
	}
	
	@RequestMapping( value="/email_check",
			method = {RequestMethod.POST, RequestMethod.GET},
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> emailCheck(@RequestParam(value="email", required=false) String email)
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		if (email==null)
		{
			return FAIL(ret, "이메일이 인자가 없습니다.");
		}
		
		System.out.println("email:"+email);
		ret.put("duplicate", usersService.checkUser(email.trim())!=null);
		return SUCCESS(ret);
		
	}
	
	@RequestMapping( value="/create",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> create(
			@RequestParam(value="email", required=false)  String email 
			, @RequestParam(value="name", required=false) String name 
			, @RequestParam(value="hash_tags", required=false) String hash_tags 
			, @RequestParam(value="sex", required=false) String sex
			, @RequestParam(value="job", required=false) String job
			, @RequestParam(value="birthyear", required=false) String birthyear
			, @RequestParam(value="city", required=false) String city
			, @RequestParam(value="password", required=false) String password
			, @RequestParam(value="heart_state_id", required=false) Integer heartStateId
			, @RequestParam(value="kind", required=false) Integer kind
			, @RequestParam(value="token", required=false) String token)
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		if (kind==0 && password==null)
		{
			return FAIL(ret, "인풋 인자가 없습니다.");
		}
		
		if (kind==0 && email==null)
		{
			return FAIL(ret, "email 인자가 없습니다.");
		}
		
		if (kind!=0 && token==null)
		{
			return FAIL(ret, "token 인자가 없습니다.");
		}
		
		if (kind==0 && email!=null && usersService.checkUser(email)!=null)
		{
			return FAIL(ret, "이메일이 중복되었습니다.");
		}
		else if (kind!=0 && token!=null && usersService.checkSnsUser(token, kind.toString())!=null)
		{
			return FAIL(ret, "기존에 가입된 회원이 존재합니다.");
		}
		
		Users create_user = new Users();
		create_user.setFag(1);
		create_user.setRoleId(2);
		create_user.setEmail(email);
		create_user.setName(name);
		create_user.setSex(sex);
		create_user.setJob(job);
		create_user.setBirthyear(birthyear);
		create_user.setCity(city);
		create_user.setHeartStateId(heartStateId);
		create_user.setCreatedAt(new Date());
		create_user.setUpdatedAt(new Date());
		create_user.setLevel(1);
		create_user.setPoint(0);
		if (kind==0)
			create_user.setPassword(passwordEncoder.encodePassword(password, null));
		else if (kind==1) {
			create_user.setFacebookToken(token);
			create_user.setPassword("");
		}
		else if (kind==2) {
			try {
				Naver n =new Naver();
				String unix_id=n.getIdNaver(token);
				create_user.setLineToken(unix_id);
				create_user.setPassword("");
			} catch (Exception e) {
				System.out.println(e);
			}
			
		}
		else if (kind==3) {
			try {
				Kakao k =new Kakao();
				String unix_id= k.getUnixId_ByAccessToken(token);
				create_user.setKakaotalkToken(unix_id);
				create_user.setPassword("");
			} catch (Exception e) {
				System.out.println(e);
			}
			
		}
			
		
		create_user = usersService.create(create_user);
		if (create_user!=null)
		{
			System.out.println("creaet_user:"+create_user.toString());
			String tags[] = hash_tags.split(",");
			for (String tag : tags)
			{
				UserTags userTags = new UserTags();
				userTags.setUserId(create_user.getId());
				userTags.setName(tag);
				userTagsService.create(userTags);
			}
			
			return SUCCESS(ret);
		}
		
		return FAIL(ret, "잠시후 다시 시도해주세요.");
	}

	@RequestMapping( value="/modify",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> update(UsernamePasswordAuthenticationToken principal
			, @RequestParam(value="name", required=false) String name 
			, @RequestParam(value="hash_tags", required=false) String hash_tags 
			, @RequestParam(value="sex", required=false) String sex
			, @RequestParam(value="job", required=false) String job
			, @RequestParam(value="birthyear", required=false) String birthyear
			, @RequestParam(value="city", required=false) String city) 
			
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		Users login_user = principal!=null ? (Users)principal.getPrincipal() : null;
		if (login_user==null || login_user.getId()==null)
		{
			return FAIL(ret, "비로그인 유저입니다.");
		}
		
		if (name!=null)
			login_user.setName(name);
		
		if (sex!=null)
			login_user.setSex(sex);
		
		if (job!=null)
			login_user.setJob(job);
		
		if (birthyear!=null)
			login_user.setBirthyear(birthyear);
		
		if (city!=null)
			login_user.setCity(city);
		
		if (usersService.update(login_user)!=null)
		{
			if (hash_tags!=null)
			{
				String tags[] = hash_tags.split(",");
				userTagsService.deleteByUserId(login_user.getId());
				for (String tag : tags)
				{
					UserTags userTags = new UserTags();
					userTags.setUserId(login_user.getId());
					userTags.setName(tag);
					userTagsService.create(userTags);
				}
			}
			return SUCCESS(ret);
		}
		else
			return FAIL(ret, "잠시후 다시 시도해주세요.");
		
	}

	@RequestMapping( value="/info",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> info(UsernamePasswordAuthenticationToken principal) 
			
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		Users login_user = principal!=null ? (Users)principal.getPrincipal() : null;
		if (login_user==null || login_user.getId()==null)
		{
			return FAIL(ret, "비로그인 유저입니다.");
		}
		
		//ret.put("email", login_user.getEmail())
		ret.put("name", login_user.getName());
	
		List<UserTags> userTags = userTagsService.findByUserId(login_user.getId());
		String[] tags = new String[userTags.size()];
		int i=0;
		for (UserTags tag : userTags) {
			tags[i] = tag.getName();
			i++;
		}
		
		ret.put("hash_tags", tags);
		ret.put("birthyear", login_user.getBirthyear());
		ret.put("sex", login_user.getSex());
		ret.put("job", login_user.getJob());
		ret.put("city", login_user.getCity());
		ret.put("profile_url", login_user.getProfileUrl());
		
		return SUCCESS(ret);
	}
	
	@RequestMapping( value="/profileimage_upload",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> profileimage_upload(UsernamePasswordAuthenticationToken principal
			, @RequestParam(value="photo", required=false) MultipartFile imgPhoto)
	{
		HashMap<String, Object> ret = new HashMap<String, Object> ();
				
		Users login_user = principal!=null ? (Users)principal.getPrincipal() : null;
		if (login_user==null || login_user.getId()==null)
		{
			return FAIL(ret, "비로그인 유저입니다.");
		}
		
		if (imgPhoto==null)
		{
			return FAIL(ret, "인자 확인해주세요.");
		}
		System.out.println("file_name:"+imgPhoto.getName());
		System.out.println("file_ori_name:"+imgPhoto.getOriginalFilename());
		String[] extension = imgPhoto.getOriginalFilename().split("\\.");
		System.out.println("length:"+extension.length);
		if (extension.length < 2)
		{
			return FAIL(ret, "이미지 파일만 업로드 가능합니다.");
		}
		
		String profileUrl = uploadS3(profile_upload_path, imgPhoto, extension[1]);
		if (profileUrl==null)
			return FAIL(ret, "이미지 업로드에 실패하였습니다.");
		
		login_user.setProfileUrl(profileUrl);
		
		if (usersService.update(login_user)!=null)
		{
			ret.put("profile_url", profileUrl);
			return SUCCESS(ret);
		}
		else
			return FAIL(ret, "잠시후 다시 시도해주세요.");
	}
	
	@RequestMapping( value="/find_pw",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> find_password(UsernamePasswordAuthenticationToken principal,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="email", required=false) String email,
			HttpSession session)
	{
		
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		if (name==null || email==null)
		{
			return FAIL(ret, "인자 확인해주세요.");
		}
		
		Users user = usersService.findByEmailAndName(email, name);
		if (user==null)
		{
			return FAIL(ret, "이메일과 이름을 확인해주세요.");
		}
		
		UUID randomPassword = UUID.randomUUID();
		String password = randomPassword.toString().substring(0, 8);
		user.setPassword(passwordEncoder.encodePassword(password, null));
		
		usersService.update(user);
		HashMap<String, Object> emailParams = new HashMap<String, Object>();
		emailParams.put("name", user.getName());
		emailParams.put("password", password);
		
		try {
			sendMail("[MICIMPACT]비밀번호 찾기", user.getEmail(), "find_password.vm", emailParams);
			return SUCCESS(ret);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return FAIL(ret, "에러가 발생하였습니다.");

	}
}
