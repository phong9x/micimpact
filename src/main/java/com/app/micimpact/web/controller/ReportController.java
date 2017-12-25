/*
 * Created on 9 12월 2015 ( Time 16:26:42 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import com.app.micimpact.web.common.FormMode;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
import com.app.micimpact.web.common.Pager;
import com.app.micimpact.web.common.Utils;
import com.app.micimpact.bean.Cards;
import com.app.micimpact.bean.Categories;
import com.app.micimpact.bean.Channel;
import com.app.micimpact.bean.Comments;
import com.app.micimpact.bean.PageReport;
//--- Entities
import com.app.micimpact.bean.Report;
import com.app.micimpact.bean.jpa.ChannelEntity;
import com.app.micimpact.bean.jpa.ReportEntity;
import com.app.micimpact.business.service.CardTagsService;
import com.app.micimpact.business.service.CardsService;
import com.app.micimpact.business.service.ChannelService;
import com.app.micimpact.business.service.CommentsService;
//--- Services 
import com.app.micimpact.business.service.ReportService;


/**
 * Spring MVC controller for 'Report' management.
 */
@Controller
@RequestMapping("admin/report")
public class ReportController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "report";
	private static final String MAIN_LIST_NAME   = "list";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_FORM   = "report/form";
	private static final String JSP_LIST_COMMENT   = "admin/report/comment";
	private static final String JSP_LIST_CARD   = "admin/report/card";

	//--- SAVE ACTION ( in the HTML form )
	private static final String SAVE_ACTION_CREATE   = "/report/create";
	private static final String SAVE_ACTION_UPDATE   = "/report/update";

	//--- Main entity service
	@Resource
    private ReportService reportService; // Injected by Spring
	@Resource
    private CommentsService commentsService;
	@Resource
    private CardsService cardsService;
	@Resource
    private CardTagsService cardTagsService; // Injected by Spring
	
	@Resource
    private ChannelService channelService; // Injected by Spring
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public ReportController() {
		super(ReportController.class, MAIN_ENTITY_NAME );
		log("ReportController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------

	/**
	 * Populates the Spring MVC model with the given entity and eventually other useful data
	 * @param model
	 * @param report
	 */
	private void populateModel(Model model, Report report, FormMode formMode) {
		//--- Main entity
		model.addAttribute(MAIN_ENTITY_NAME, report);
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
	 * Shows a list with all the occurrences of Report found in the database
	 * @param model Spring MVC model
	 * @return
	 */
	
	@RequestMapping("/comment")
	public String list_comment(
			@RequestParam(value="page", defaultValue="1") Integer page,
			@RequestParam(value="delete", defaultValue="0") Integer delete,
			@RequestParam(value="hide", defaultValue="0") Integer hide,
			@RequestParam(value="show", defaultValue="0") Integer show,
			@RequestParam(value="name", defaultValue="") String name,
			Model model) {
		if(delete>0){
			try {
				commentsService.delete(delete);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(show>0){
			Comments c= commentsService.findById(Utils.parseInt(show) );
			c.setIsShow(1);
			commentsService.update(c);
		}
		if(hide>0){
			Comments c= commentsService.findById(hide);
			c.setIsShow(0);
			commentsService.update(c);
		}
		PageReport p =reportService.findReportComment(page, 10);
		int size;
		if(p.getList()==null){
			size=0;
		}else{
			size= p.getList().size();
		}
		model.addAttribute(MAIN_LIST_NAME, p.getList());
		model.addAttribute("currentIndex", page);
		model.addAttribute("beginIndex", 1);
		model.addAttribute("endIndex", p.getTotalPages());
		model.addAttribute("totalPages", p.getTotalPages());
		model.addAttribute("url", "/admin/report/comment");
		return JSP_LIST_COMMENT;
	}
	
	
	@RequestMapping("/card")
	public String list_card(
			@RequestParam(value="page", defaultValue="1") Integer page,
			@RequestParam(value="delete", defaultValue="0") Integer delete,
			@RequestParam(value="hide", defaultValue="0") Integer hide,
			@RequestParam(value="show", defaultValue="0") Integer show,
			@RequestParam(value="name", defaultValue="") String name,
			Model model) {
		if(delete>0){
			try {
				Cards c =cardsService.findById(delete);
				if(c.getChannelId()!=null){
					Channel channel = channelService.findById(c.getChannelId());
					if(channel.getCardsRecentId()!=null && channel.getCardsRecentId().equals(c.getId())){
						channel.setCardsRecentId(null);
						channelService.update(channel);
					}
				}
				cardTagsService.deleteByCardId(delete);
				cardsService.delete( delete );
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		if(show>0){
			Cards c= cardsService.findById(Utils.parseInt(show) );
			c.setIsShow(1);
			cardsService.update(c);
		}
		if(hide>0){
			Cards c= cardsService.findById(Utils.parseInt(hide) );
			c.setIsShow(0);
			cardsService.update(c);
		}
		PageReport p =reportService.findReportCard(page, 10);
		int size;
		if(p.getList()==null){
			size=0;
		}else{
			size= p.getList().size();
		}
		 
		model.addAttribute(MAIN_LIST_NAME, p.getList());
		model.addAttribute("currentIndex", page);
		model.addAttribute("beginIndex", 1);
		model.addAttribute("endIndex", p.getTotalPages());
		model.addAttribute("totalPages", p.getTotalPages());
		model.addAttribute("url", "/admin/report/card");
		return JSP_LIST_CARD;
	}
	
	/**
	 * Shows a form page in order to create a new Report
	 * @param model Spring MVC model
	 * @return
	 */
	@RequestMapping("/form")
	public String formForCreate(Model model) {
		log("Action 'formForCreate'");
		//--- Populates the model with a new instance
		Report report = new Report();	
		populateModel( model, report, FormMode.CREATE);
		return JSP_FORM;
	}

	/**
	 * Shows a form page in order to update an existing Report
	 * @param model Spring MVC model
	 * @param id  primary key element
	 * @return
	 */
	@RequestMapping(value = "/form/{id}")
	public String formForUpdate(Model model, @PathVariable("id") Integer id ) {
		log("Action 'formForUpdate'");
		//--- Search the entity by its primary key and stores it in the model 
		Report report = reportService.findById(id);
		populateModel( model, report, FormMode.UPDATE);		
		return JSP_FORM;
	}

	/**
	 * 'CREATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param report  entity to be created
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/create" ) // GET or POST
	public String create(@Valid Report report, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'create'");
		try {
			if (!bindingResult.hasErrors()) {
				Report reportCreated = reportService.create(report); 
				model.addAttribute(MAIN_ENTITY_NAME, reportCreated);

				//---
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				return redirectToForm(httpServletRequest, report.getId() );
			} else {
				populateModel( model, report, FormMode.CREATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			log("Action 'create' : Exception - " + e.getMessage() );
			messageHelper.addException(model, "report.error.create", e);
			populateModel( model, report, FormMode.CREATE);
			return JSP_FORM;
		}
	}

	/**
	 * 'UPDATE' action processing. <br>
	 * This action is based on the 'Post/Redirect/Get (PRG)' pattern, so it ends by 'http redirect'<br>
	 * @param report  entity to be updated
	 * @param bindingResult Spring MVC binding result
	 * @param model Spring MVC model
	 * @param redirectAttributes Spring MVC redirect attributes
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/update" ) // GET or POST
	public String update(@Valid Report report, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
		log("Action 'update'");
		try {
			if (!bindingResult.hasErrors()) {
				//--- Perform database operations
				Report reportSaved = reportService.update(report);
				model.addAttribute(MAIN_ENTITY_NAME, reportSaved);
				//--- Set the result message
				messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"save.ok"));
				log("Action 'update' : update done - redirect");
				return redirectToForm(httpServletRequest, report.getId());
			} else {
				log("Action 'update' : binding errors");
				populateModel( model, report, FormMode.UPDATE);
				return JSP_FORM;
			}
		} catch(Exception e) {
			messageHelper.addException(model, "report.error.update", e);
			log("Action 'update' : Exception - " + e.getMessage() );
			populateModel( model, report, FormMode.UPDATE);
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
		try {
			reportService.delete( id );
			//--- Set the result message
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"delete.ok"));	
		} catch(Exception e) {
			messageHelper.addException(redirectAttributes, "report.error.delete", e);
		}
		return redirectToList();
	}

}
