package com.app.micimpact.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.micimpact.bean.UserRoles;
import com.app.micimpact.bean.Users;
import com.app.micimpact.business.service.UserRolesService;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.security.SecurityUserService;
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.FormMode;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
import com.app.micimpact.web.listitem.UserRolesListItem;

@Controller
public class MemberController extends AbstractController{
	
	//--- Variables names ( to be used in JSP with Expression Language )
		private static final String MAIN_ENTITY_NAME = "users";
	
	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_LOGIN_FORM   = "login/form";
	private static final String JSP_JOIN_FORM    = "join/form";
	private static final String JSP_RESERVED_FORM    = "reserved/form";
	private static final String JSP_CLAUSE    = "member/clause";
	

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_CREATE   = "/users/create";
	private static final String SAVE_ACTION_UPDATE   = "/users/update";
	
	//--- Main entity service
	@Resource
    private UsersService usersService; // Injected by Spring
	//--- Other service(s)
	@Resource
    private UserRolesService userRolesService; // Injected by Spring
	
	@Resource
	private SecurityUserService securityService;
	
	public MemberController() {
		super(MemberController.class, MAIN_ENTITY_NAME );
		log("MemberController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------
	/**
	 * Populates the combo-box "items" for the referenced entity "UserRoles"
	 * @param model
	 */
	private void populateListOfUserRolesItems(Model model) {
		List<UserRoles> list = userRolesService.findAll();
		List<UserRolesListItem> items = new LinkedList<UserRolesListItem>();
		for ( UserRoles userRoles : list ) {
			items.add(new UserRolesListItem( userRoles ) );
		}
		model.addAttribute("listOfUserRolesItems", items ) ;
	}


	/**
	 * Populates the Spring MVC model with the given entity and eventually other useful data
	 * @param model
	 * @param users
	 */
	private void populateModel(Model model, Users users, FormMode formMode) {
		//--- Main entity
		model.addAttribute(MAIN_ENTITY_NAME, users);
		if ( formMode == FormMode.CREATE ) {
			model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_CREATE); 			
			//--- Other data useful in this screen in "create" mode (all fields)
			populateListOfUserRolesItems(model);
		}
		else if ( formMode == FormMode.UPDATE ) {
			model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_UPDATE); 			
			//--- Other data useful in this screen in "update" mode (only non-pk fields)
			populateListOfUserRolesItems(model);
		}
	}

	//--------------------------------------------------------------------------------------
	// Request mapping
	//--------------------------------------------------------------------------------------
	/**
	 * Shows a list with all the occurrences of Users found in the database
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(Model model) {
//		log("Action 'list'");
		return JSP_LOGIN_FORM;
	}
	
	@RequestMapping(value="/clause")
	public String clause(Model model){
		log("Action 'clause'");
		return JSP_CLAUSE;
	}
	
	@RequestMapping(value="/join")
	public String join(Model model) {
//		log("Action 'list'");
		Users users = new Users();	
		populateModel(model, users, FormMode.CREATE);
		
		return JSP_JOIN_FORM;
	}
	
	@RequestMapping(value = "/users/create", method = RequestMethod.POST) // GET or POST
	public String create(@Valid Users users, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		users.setRoleId(2);
		
//		System.out.println("test : " + securityService.loadUserByUsername("test", "test").getPassword());
		users.setPassword(securityService.loadUserByUsername(users.getName(), users.getPassword()).getPassword());
		Date now = new Date();
		users.setCreatedAt(now);
		users.setFag(1);

		log("Action 'create'");
		try {
			if (!bindingResult.hasErrors()) {
				Users usersCreated = usersService.create(users); 
				model.addAttribute(MAIN_ENTITY_NAME, usersCreated);

				//---
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				
				
				Map<String, Object> textParams = new HashMap<String, Object>();
				textParams.put("productName", "dummy1");
		    	textParams.put("sampleDate", "dummy2");
		    	textParams.put("companyName", "dummy3");
		    	textParams.put("name", "dummy3");
		    	textParams.put("tel", "dummy4");
		    	textParams.put("email", "dummy5");
		    	textParams.put("companyUrl", "dummy6");
		    	textParams.put("content", "dummy7");
		    	
		    	sendMail("title", usersCreated.getEmail(), "email_C02.vm", textParams);
				return "redirect:/";
			} else {
				populateModel( model, users, FormMode.CREATE);
				return JSP_JOIN_FORM;
			}
		} catch(Exception e) {
			log("Action 'create' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "users.error.create", e);
			populateModel( model, users, FormMode.CREATE);
			return JSP_JOIN_FORM;
		}
	}
	
	@RequestMapping(value = "/users/update", method = RequestMethod.POST) // GET or POST
	public String update(@Valid Users users, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		
		UserRoles role = userRolesService.findById(users.getRoleId());
		users.setUserRoles(role);
		users.setPassword(securityService.loadUserByUsername(users.getName(), users.getPassword()).getPassword());
		users.setFag(1);
		
		
		log("Action 'update'");
		try {
			if (!bindingResult.hasErrors()) {
				Users usersUpdated = usersService.update(users); 
				model.addAttribute(MAIN_ENTITY_NAME, usersUpdated);
				//---
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				return "redirect:/";
			} else {
				populateModel( model, users, FormMode.UPDATE);
				return JSP_JOIN_FORM;
			}
		} catch(Exception e) {
			log("Action 'update' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "users.error.update", e);
			populateModel( model, users, FormMode.UPDATE);
			return JSP_JOIN_FORM;
		}
	}	
	
	@RequestMapping(value="/member/{id}")
	public String formMember(Model model,@PathVariable("id") int id, HttpServletRequest request) {
		log("Action 'list'");
		Users users = usersService.findById(id);
		users.setPassword("");
		populateModel(model, users, FormMode.UPDATE);
		securityCheck(model, request);
		return JSP_JOIN_FORM;
	}
	
	@RequestMapping(value="/reserved")
	public String reserved(Model model, HttpServletRequest request) {
		log("Action 'list'");
		securityCheck(model, request);

		return JSP_RESERVED_FORM;
	}
	
	@RequestMapping(value="/serarchId")
	public void searchUser(HttpServletResponse response, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
				
		Users users = new Users();
		users.setName(request.getParameter("name"));
		users.setEmail(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
		
		try {
			users = usersService.findUser(users, 1);
		} catch (Exception e) {
			// TODO: handle exception
			out.print("false");
		}
		
		
	}
	
	@RequestMapping(value="/changePassword")
	public void searchPassword(HttpServletResponse response, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
				
		Users users = new Users();
		users.setName(request.getParameter("name1"));
//		users.setUsername(request.getParameter("username"));
//		users.setPhone(request.getParameter("phone1"));
		users.setEmail(request.getParameter("mail11")+"@"+request.getParameter("mail21"));
		
		
		String data = "";
		
    	try {
    		
    		//유저 검색
    		users = usersService.findUser(users, 2);
						
			if (users != null) {
				//랜덤 패스워드 생성				
				String newPassword = ramdomPassword();
				
				Users su = securityService.loadUserByUsername(users.getName(), newPassword);
				users.setPassword(su.getPassword());
				
				users.setPassword(su.getPassword());
				try {
					usersService.update(users);
					
					Map<String, Object> textParams = new HashMap<String, Object>();
					textParams.put("password", newPassword);
					sendMail(users.getName(), users.getEmail(), "email_C02.vm", textParams);
					
					data = StringUtils.join(new String[] {"{\"success\":\"true\", \"message\":\"", users.getEmail() ,"\"}"});
					
				} catch (Exception e) {
					// TODO: handle exception
					log("changePassword pw : " + e.toString());
					data = StringUtils.join(new String[] {"{\"success\":\"false\", \"message\":\"가입되지않은 회원입니다.\"}"});
				}
			}else{
				data = StringUtils.join(new String[] {"{\"success\":\"false\", \"message\":\"가입되지않은 회원입니다.\"}"});
			}
			
            out.print(data);
			
		} catch (Exception e) {
			// TODO: handle exception
			log("changePassword Error : " + e.toString());
			data = StringUtils.join(new String[] {
					"{\"success\":\"false\", \"message\":\"가입되지않은 회원입니다.\"}"});
			out.print(data);
		}
		
		
		
		
	}
	
	
	/**
	 *  Gmail을 이용한 mail 보내기
	 * 	sendMamil('name', 'mail address', 'new pasword')
	 * 
	 * */
	@RequestMapping(value="/sendMail")
	public void testMail(HttpServletResponse response, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
			
		try {
//			sendMail("김선명", "naskm007@naver.com", "");
			out.print("true");
						
		} catch (Exception e) {
			// TODO: handle exception
			out.print("false");
		}
	}
	
	
	@RequestMapping(value="/userIdCheck", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> userIdCheck (@RequestBody Users user){
    	HashMap<String, Object> map = new HashMap<String, Object>();
    
		try {
			Users CheckUser = usersService.checkUser(user.getEmail());
			if (CheckUser == null) {
				map.put("message", "사용할 수 있는 아이디입니다.");
				map.put("success", true);
			}
			else {
				map.put("message", "이미 사용 중인 아이디입니다.");
				map.put("success", false);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			log(e.toString());
			map.put("message", "관리자에게 문의해주세요.");
			map.put("success", false);
		}
		
		return map;
    }
	
	@RequestMapping(value="/passwordReset", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> passwordReset (@RequestBody HashMap<String, Object> data){
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	Users users = usersService.findById(Integer.parseInt((String) data.get("user")));
    	String newPassword = "1q2w3e4r";
    	users.setPassword(securityService.loadUserByUsername(users.getName(), newPassword).getPassword());
    	
    
		try {
			usersService.update(users);
			String msg = users.getName() + "에게 새로운 비밀번호를 전송하였습니다.";
			Map<String, Object> textParams = new HashMap<String, Object>();
			textParams.put("password", newPassword);
			textParams.put("msg", msg);
			sendMail(users.getName(), users.getEmail(), "email_C02.vm", textParams);
			map.put("message", msg);
			map.put("success", true);
			
		} catch (Exception e) {
			// TODO: handle exception
			log(e.toString());
			map.put("message", "관리자에게 문의해주세요.");
			map.put("success", false);
		}
		
		return map;
    }
	
	private String ramdomPassword(){
		
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		 
		for(int i=0;i<8;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		
		return buf.toString();
	}
	
	
}



