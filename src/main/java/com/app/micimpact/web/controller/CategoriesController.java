/*
 * Created on 9 12월 2015 ( Time 16:26:40 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.web.controller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//--- Common classes
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.FileUtils;
import com.app.micimpact.web.common.FormMode;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
import com.app.micimpact.web.common.Pager;
//--- Entities
import com.app.micimpact.bean.Categories;
import com.app.micimpact.bean.jpa.CategoriesEntity;
import com.app.micimpact.bean.jpa.ChannelEntity;
//--- Services 
import com.app.micimpact.business.service.CategoriesService;


/**
 * Spring MVC controller for 'Categories' management.
 */
@Controller
@RequestMapping("admin/category")
public class CategoriesController extends AbstractController {
	@Value("#{commonConfig['s3.category.path']}")
	protected String thumbnail_path;
	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "categories";
	private static final String MAIN_LIST_NAME   = "list";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "admin/category/create";
	private static final String JSP_LIST   = "admin/category";

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_CREATE   = "/categories/create";
	private static final String SAVE_ACTION_UPDATE   = "/categories/update";

	//--- Main entity service
	@Resource
    private CategoriesService categoriesService; // Injected by Spring
	@Autowired
	private ServletContext servletContext;
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public CategoriesController() {
		super(CategoriesController.class, MAIN_ENTITY_NAME );
		log("CategoriesController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------

	/**
	 * Populates the Spring MVC model with the given entity and eventually other useful data
	 * @param model
	 * @param categories
	 */
	private void populateModel(Model model, Categories categories, FormMode formMode) {
		//--- Main entity
		model.addAttribute(MAIN_ENTITY_NAME, categories);
		if ( formMode == FormMode.CREATE ) {
			model.addAttribute(MODE, MODE_CREATE); // The form is in "create" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_CREATE); 			
			//--- Other data useful in this screen in "create" mode (all fields)
		}
		else if ( formMode == FormMode.UPDATE ) {
			model.addAttribute(MODE, MODE_UPDATE); // The form is in "update" mode
			model.addAttribute(SAVE_ACTION, SAVE_ACTION_UPDATE); 			
			//--- Other data useful in this screen in "update" mode (only non-pk fields)
		}
	}

	//--------------------------------------------------------------------------------------
	// Request mapping
	//--------------------------------------------------------------------------------------
	/**
	 * Shows a list with all the occurrences of Categories found in the database
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping(value="",method = RequestMethod.GET)
	public String list_get(
			@RequestParam(value="page", defaultValue="1") Integer pageNumber,
			Model model) {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute(MAIN_LIST_NAME, list);		
		return JSP_LIST;
	}
	
	
	@RequestMapping(value="",method = RequestMethod.POST)
	public String list(
			@RequestParam(value="edit", defaultValue="0") Integer edit,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="file") MultipartFile file,
			Model model) {
		if(edit>0){
			Categories c =categoriesService.findById(edit);
			c.setName(name);
			String[] extension = file.getOriginalFilename().split("\\.");
			String verticalThumbnailUrl = uploadS3(thumbnail_path, file, extension[1]);
			c.setImageUrl(verticalThumbnailUrl);
			categoriesService.update(c);
		}
		
		return "redirect:/admin/category";
	}
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public String create_get(
			@RequestParam(value="page", defaultValue="1") Integer pageNumber,
			Model model) {
		return JSP_FORM;
	}
	
	@RequestMapping(value="/create",method = RequestMethod.POST)
	public String create_post(
			@RequestParam(value="edit", defaultValue="0") Integer edit,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="file") MultipartFile file,
			Model model) {
		try {
			if(name!=null && file.getSize()>0){
				Categories c =new Categories();
						c.setName(name);
						String[] extension = file.getOriginalFilename().split("\\.");
						String verticalThumbnailUrl = uploadS3(thumbnail_path, file, extension[1]);
						c.setImageUrl(verticalThumbnailUrl);
						categoriesService.create(c);
						return "redirect:/admin/category";
			}else{
				return "redirect:/admin/category/create";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/admin/category/create";
		}
		
	}


}
