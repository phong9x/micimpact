package com.app.micimpact.web.controller;

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
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.business.service.UserRolesService;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.security.SecurityUserService;
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.FormMode;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
import com.app.micimpact.web.common.Pager;
import com.app.micimpact.web.listitem.UserRolesListItem;

/**
 * Spring MVC controller for 'Users' management.
 */

@Controller
@Secured("ROLE_RESU")
public class ResourceUserController extends AbstractController{
	
	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "users";
	private static final String MAIN_ENTITY_NAME_RES = "res/manage_users";
	private static final String MAIN_LIST_NAME   = "list";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "res/users/form";
	private static final String JSP_LIST   = "res/users/list";

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_UPDATE   = "/res/manage_users/update";

	//--- Main entity service
	@Resource
    private UsersService usersService; // Injected by Spring
	//--- Other service(s)
	@Resource
    private UserRolesService userRolesService; // Injected by Spring
	
	@Resource
	private SecurityUserService securityService;
	
	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public ResourceUserController() {
		super(ResourceUserController.class, MAIN_ENTITY_NAME );
		log("ResourceUserController created.");
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
		
		if ( formMode == FormMode.UPDATE ) {
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
	@RequestMapping(value="/res/manage_users")
	public String list(Model model, @RequestParam(value="page", defaultValue="1") Integer pageNumber, HttpServletRequest request) {
		log("Action 'list'");
		System.out.println("get page : " + pageNumber);
		Page<UsersEntity> list = usersService.findAll(pageNumber, 1);
		new Pager<UsersEntity>(list, model).pageSetting("/res/manage_users");		
		return JSP_LIST;
	}
	
	@RequestMapping(value="/res/manage_users/search")
	public String search(Model model, 
						 @RequestParam(value="page", defaultValue="1") Integer pageNumber,
						 @RequestParam(value="option", defaultValue="1") int option, 
						 @RequestParam(value="keyword") String  keyword,
						 HttpServletRequest request) {
		log("Action 'list'");
		System.out.println("get page : " + pageNumber);
		Page<UsersEntity> list = usersService.findSearchAll(pageNumber, option, keyword);//"+ $("#options").val() + "&keyword="
		new Pager<UsersEntity>(list, model).pageSetting("/res/manage_users/search?page="+ pageNumber + "&option="+option+ "&keyword="+keyword);		
		return JSP_LIST;
	}
	
	

	/**
	 * Shows a form page in order to create a new Users
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping(value="/res/manage_users/form")
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
	@RequestMapping(value = "/res/manage_users/form/{id}")
	public String formForUpdate(Model model, @PathVariable("id") Integer id ) {
		log("Action 'formForUpdate'");
		//--- Search the entity by its primary key and stores it in the model 
		Users users = usersService.findById(id);
		populateModel( model, users, FormMode.UPDATE);		
		return JSP_FORM;
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
	@RequestMapping(value = "/res/manage_users/update" ) // GET or POST
	public String update(@Valid Users users, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'update'");
		int role = users.getRoleId();
		System.out.println("role : " + users.getRoleId());
		users = usersService.findById(users.getId());
		users.setRoleId(role);
		
		try {
			//--- Perform database operations
			users = usersService.update(users);
			model.addAttribute(MAIN_ENTITY_NAME, users);
			//--- Set the result message
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
			log("Action 'update' : update done - redirect");
			return redirectToForm_users(httpServletRequest, users.getId());
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
	@RequestMapping(value = "/res/manage_users/delete/{id}") // GET or POST
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
		return "redirect:/" + MAIN_ENTITY_NAME_RES ;
	}
	
	/**
	 * Returns "redirect:/res/manage_users/form/id1/id2/..." 
	 * @param httpServletRequest
	 * @param idParts
	 * @return
	 */
	protected String redirectToForm_users(HttpServletRequest httpServletRequest, Object... idParts) {
		System.out.println("?? : " + getFormURL_users(httpServletRequest, idParts));
		return "redirect:" + getFormURL_users(httpServletRequest, idParts);
	}

	/**
	 * Returns "/res/manage_users/id1/id2/..." 
	 * @param httpServletRequest
	 * @param idParts
	 * @return
	 */
	protected String getFormURL_users(HttpServletRequest httpServletRequest, Object... idParts) {
		
		return "/" + MAIN_ENTITY_NAME_RES + "/form/" + encodeUrlPathSegments(httpServletRequest, idParts );
	}

	public static void main(String[] args) {
		
	}
}