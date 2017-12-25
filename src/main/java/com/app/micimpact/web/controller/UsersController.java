package com.app.micimpact.web.controller;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.micimpact.bean.UserRoles;
import com.app.micimpact.bean.UserTags;
//--- Entities
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.ChannelEntity;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.business.service.CardsService;
import com.app.micimpact.business.service.ChannelService;
import com.app.micimpact.business.service.UserRolesService;
import com.app.micimpact.business.service.UserTagsService;
//--- Services 
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.data.repository.jpa.UsersJpaRepository;
import com.app.micimpact.security.SecurityUserService;
//--- Common classes
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.FormMode;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
import com.app.micimpact.web.common.Pager;
//--- List Items 
import com.app.micimpact.web.listitem.UserRolesListItem;

/**
 * Spring MVC controller for 'Users' management.
 */
@Secured("ROLE_ADMIN")
@Controller
@RequestMapping("/admin/manage_users")
public class UsersController extends AbstractController {
	
	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "users";
	private static final String MAIN_ENTITY_NAME_ADMIN = "admin/manage_users";
	private static final String MAIN_LIST_NAME   = "list";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "users/form";
	private static final String JSP_LIST   = "users/list";

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_CREATE   = "/admin/manage_users/create";
	private static final String SAVE_ACTION_UPDATE   = "/admin/manage_users/update";

	//--- Main entity service
	@Resource
    private UsersService usersService; // Injected by Spring
	
	@Resource
    private UserTagsService userTagsService; // Injected by Spring
	
	@Resource
    private UserRolesService userRolesService; // Injected by Spring
	
	@Resource
	private SecurityUserService securityService;
	
	@Resource
	private UsersJpaRepository usersJpaRepository;
	
	@Resource
    private ChannelService channelService; // Injected by Spring
	@Resource
    private CardsService cardsService;
	
	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public UsersController() {
		super(UsersController.class, MAIN_ENTITY_NAME );
		log("UsersController created.");
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

	private void populateListOfUserTags(Users users, Model model) {

		StringBuffer sb_tags = new StringBuffer();
		
		List<UserTags> tags = userTagsService.findByUserId(users.getId());
		for (UserTags tag : tags)
		{
			sb_tags.append(tag.getName());
			sb_tags.append(", ");
		}
		
		if (sb_tags.length() > 0)
			sb_tags.delete(sb_tags.length()-2, sb_tags.length());
		
		model.addAttribute("users_tags", sb_tags.toString()) ;
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
			//populateListOfUserTags(users, model);
		}
		else if ( formMode == FormMode.UPDATE ) {
			model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_UPDATE); 			
			//--- Other data useful in this screen in "update" mode (only non-pk fields)
			populateListOfUserRolesItems(model);
			populateListOfUserTags(users, model);
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
	
	@RequestMapping()
	public String manageUsersPage(Model model,
			@RequestParam(value="state", defaultValue="1") Integer state,
			@RequestParam(value="page", defaultValue="1") Integer pageNumber) {
		log("Action 'manageUsersPage'");

		// 160104 pjh : 회원관리 리스트
		
		Page<UsersEntity> list = usersService.findAll(pageNumber, state);
		String path = "/admin/manage_users";
		new Pager<UsersEntity>(list, model).pageSetting(path);
		model.addAttribute("state", state);
		
		return JSP_LIST;
	}
	
	@RequestMapping(value="/search")
	public String manageUsersSearchPage(Model model, 
						 @RequestParam(value="page", defaultValue="1") Integer pageNumber,
						 @RequestParam(value="option", defaultValue="1") int option, 
						 @RequestParam(value="keyword") String  keyword,
						 HttpServletRequest request) {
		log("Action 'manageUsersSearchPage'");
		
		// 160104 pjh : 회원관리 검색 리스트
		
		System.out.println("get current page : " + pageNumber);
		Page<UsersEntity> list = usersService.findSearchAll(pageNumber, option, keyword);//"+ $("#options").val() + "&keyword="
		new Pager<UsersEntity>(list, model).pageSetting("/admin/manage_users/search?page="+ pageNumber + "&option="+option+ "&keyword="+keyword);		
		model.addAttribute("keyword", keyword);
		return JSP_LIST;
	}
	
	
	@RequestMapping("/search/{user_id}")
	public String list(
			@RequestParam(value="page", defaultValue="1") Integer page,
			@RequestParam(value="delete_channel", defaultValue="") Integer[] delete_channel,
			@RequestParam(value="delete", defaultValue="0") Integer delete,
			@PathVariable("user_id") Integer user_id,
			Model model) {
		if(delete>0){
			for (Integer id : delete_channel) {
				channelService.delete(id);
			}
		}
		Page<ChannelEntity> list = channelService.getBy_UserId(user_id, page, 10);
		model.addAttribute(MAIN_LIST_NAME, list);
		String path = "/admin/user/chanel";
		new Pager<ChannelEntity>(list, model).pageSetting(path);
		return JSP_LIST;
	}
	
	
	@RequestMapping(value="/{id}")
	public String manageUsersDetailPage(Model model,
			@PathVariable("id") Integer id ) {
		log("Action 'manageUsersDetailPage'");
		
		// 160104 pjh : 회원관리 상세화면
		
		Users user = usersService.findById(id);
		
		populateModel( model, user, FormMode.UPDATE);
		
		return JSP_FORM;
	}

//	@RequestMapping(value="/update")
//	public RedirectView manageUsersUpdate(Model model, HttpServletRequest request, Users users) {
//		log("Action 'manageUsersUpdate'");
////		PrintWriter out = response.getWriter();
//		
//		System.out.println("user.getId() : "+users.getId());
//		System.out.println("user.getName() : "+users.getName());
//		System.out.println("user.getEmail() : "+users.getEmail());
//		System.out.println("user.getSex() : "+users.getSex());
//		System.out.println("user.getSex() : "+users.getRoleId());
//		
////		UsersEntity usersEntity = usersJpaRepository.findById(users.getId());
//		
////		usersService.update(users);
////		populateModel(model, users, FormMode.UPDATE);
//		
//		RedirectView rv = new RedirectView("/admin/manage_users/"+users.getId());
//		return rv;
//		
//	}

	/**
	 * Shows a form page in order to create a new Users
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping("/form")
	public String formForCreate(Model model) {
		log("Action 'formForCreate'");
		//--- Populates the model with a new instance
		Users users = new Users();	
		populateModel( model, users, FormMode.CREATE);
		return JSP_FORM;
	}

	/**
	 * Shows a form page in order to update an existing Users
	 * @param model Spring MVC model
	 * @param id  primary key element
	 * @return
	 */
	@RequestMapping(value = "/form/{id}")
	public String formForUpdate(Model model, @PathVariable("id") Integer id ) {
		log("Action 'formForUpdate'");
		//--- Search the entity by its primary key and stores it in the model 
		Users users = usersService.findById(id);
		populateModel( model, users, FormMode.UPDATE);		
		return JSP_FORM;
	}

	/**
	 * 'CREATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param users  entity to be created
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/create" ) // GET or POST
	public String create_admin(@Valid Users users, 
			BindingResult bindingResult, 
			Model model, 
			RedirectAttributes redirectAttributes,
			@RequestParam(value="users_tags") String hash_tags,
			HttpServletRequest httpServletRequest) {
		
		users.setId(0);
		users.setRoleId(2);
		Date now = new Date();
		users.setCreatedAt(now);
		log("Action 'admin create'");
		try {
			if (!bindingResult.hasErrors()) {
				users = usersService.create(users); 
				model.addAttribute(MAIN_ENTITY_NAME, users);

				//---
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				return redirectToForm_users(httpServletRequest, users.getId() );
			} else {
				populateModel( model, users, FormMode.CREATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			log("Action 'create' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "users.error.create", e);
			populateModel( model, users, FormMode.CREATE);
			return JSP_FORM;
		}
	}
	
	/**
	 * 'UPDATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param users  entity to be updated
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/update" ) // GET or POST
	public String update(@Valid Users users, 
			BindingResult bindingResult, 
			Model model, 
			RedirectAttributes redirectAttributes, 
			@RequestParam(value="users_tags") String hash_tags,
			HttpServletRequest httpServletRequest) {
		log("Action 'update'");
		String name = users.getName();
		String email = users.getEmail();
		String birthyear = users.getBirthyear();
		String sex = users.getSex();
		String job = users.getJob();
		String city = users.getCity();
		users = usersService.findById(users.getId());
		users.setName(name);
		users.setEmail(email);
		users.setBirthyear(birthyear);
		users.setSex(sex);
		users.setJob(job);
		users.setCity(city);
		
		try {
			
			if (hash_tags!=null)
			{
				String tags[] = hash_tags.split(",");
				userTagsService.deleteByUserId(users.getId());
				for (String tag : tags)
				{
					UserTags userTags = new UserTags();
					userTags.setUserId(users.getId());
					userTags.setName(tag.trim());
					userTagsService.create(userTags);
				}
			}
			
			
			if (!bindingResult.hasErrors()) {
				//--- Perform database operations
				Users usersSaved = usersService.update(users);
				model.addAttribute(MAIN_ENTITY_NAME, usersSaved);
				//--- Set the result message
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				log("Action 'update' : update done - redirect");
//				return redirectToForm(httpServletRequest, users.getId());
				return "redirect:/admin/manage_users/"+users.getId();
			} else {
				log("Action 'update' : binding errors");
				populateModel( model, users, FormMode.UPDATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			messageHelper.addException(model, "users.error.update", e);
			log("Action 'update' : Exception - " + e.getMessage() );
			populateModel( model, users, FormMode.UPDATE);
			return JSP_FORM;
		}
	}
	

	/**
	 * 'DELETE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param redirectAttributes
	 * @param id  primary key element
	 * @return
	 */
	
	@RequestMapping(value = "/delete/{id}") // GET or POST
	public String delete(RedirectAttributes redirectAttributes, @PathVariable("id") Integer id) {
		log("Action 'delete'" );
		Users users = usersService.findById(id);
		users.setFag(0);
		try {
			usersService.update(users);
			//--- Set the result message
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"delete.ok"));	
		} catch(Exception e) {
			messageHelper.addException(redirectAttributes, "users.error.delete", e);
		}
		return users_redirectToList();
	}

	protected String users_redirectToList() {
		return "redirect:/" + MAIN_ENTITY_NAME_ADMIN ;
	}
	
	/**
	 * Returns "redirect:/admin/manage_users/form/id1/id2/..." 
	 * @param httpServletRequest
	 * @param idParts
	 * @return
	 */
	protected String redirectToForm_users(HttpServletRequest httpServletRequest, Object... idParts) {
		return "redirect:" + getFormURL_users(httpServletRequest, idParts);
	}

	/**
	 * Returns "/admin/manage_users/id1/id2/..." 
	 * @param httpServletRequest
	 * @param idParts
	 * @return
	 */
	protected String getFormURL_users(HttpServletRequest httpServletRequest, Object... idParts) {
		
		return "/" + MAIN_ENTITY_NAME_ADMIN + "/form/" + encodeUrlPathSegments(httpServletRequest, idParts );
	}

	public static void main(String[] args) {
		
	}
	
//	POSA 적용.
	@RequestMapping(value="/admin/users")
	public String list(Model model, @RequestParam(value="sort", defaultValue="id") String sort) {
		log("Action 'list'");
		
		
		System.out.println("adas : " + sort);
		
		List<Users> list = usersService.findAll();
		model.addAttribute(MAIN_LIST_NAME, list);		
		return JSP_LIST;
	}
	
	@RequestMapping(value="/admin/users/search")
	public String search1(Model model, 
			 @RequestParam(value="page", defaultValue="1") Integer pageNumber,
			 @RequestParam(value="terms") String term, 
			 @RequestParam(value="keyword") String  keyword,
			 HttpServletRequest request) {
		log("Action 'search list'");
		
		List<Users> list = usersService.findAll();
		model.addAttribute(MAIN_LIST_NAME, list);		
		return JSP_LIST;
	}
	
	@RequestMapping(value="/admin/users/form/{id}")
	public String form(Model model, @PathVariable("id") Integer id, @RequestParam(value="page", defaultValue="1") Integer pageNumber, @RequestParam(value="info", defaultValue="user") String info) {
		log("Action 'form'");
		
		System.out.println("asds : " + info);
		
		Users users = usersService.findById(id);
		
		
		if (info.equals("user")) {
			populateModel(model, users, FormMode.UPDATE);
		}else{
			model.addAttribute(MAIN_ENTITY_NAME, users);
		}
		
		model.addAttribute("info", info);
				
		return JSP_FORM;
	}
	
}
