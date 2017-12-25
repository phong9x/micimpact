/*
 * Created on 28 Apr 2015 ( Time 15:46:44 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.web.controller;


import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.app.micimpact.aws.services.elastictranscoder.JobStatusNotificationsSample;
import com.app.micimpact.bean.Cards;
import com.app.micimpact.bean.Channel;
import com.app.micimpact.bean.Locales;
import com.app.micimpact.bean.Popups;
import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.PopupsEntity;
import com.app.micimpact.business.service.CardTagsService;
import com.app.micimpact.business.service.CardsService;
import com.app.micimpact.business.service.ChannelService;
import com.app.micimpact.business.service.LocalesService;
import com.app.micimpact.business.service.PopupsService;
import com.app.micimpact.business.service.PostingTypesService;
import com.app.micimpact.business.service.PostingsService;
import com.app.micimpact.business.service.StatsService;
import com.app.micimpact.business.service.UploadFilesService;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.data.repository.jpa.PostingsJpaRepository;
//--- Common classes
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.AmazonS3FileManager;
import com.app.micimpact.web.common.BasicEnvironment;
import com.app.micimpact.web.common.Message;
import com.app.micimpact.web.common.MessageType;
//--- Services 
//--- Entities
//--- List Items 
import com.app.micimpact.web.common.Pager;
import com.app.micimpact.web.common.Utils;


@Controller
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "posting";
	private static final String MAIN_LIST_NAME   = "list";

	private static final String JSP_MAIN   = "admin_main";//posa
	
	private static final String JSP_MANAGE_USERS   = "manage_users";
	private static final String JSP_GOOGLE_ANAL   = "google_anal";
	private static final String JSP_STATISTICS_1	= "statistics_1";
	private static final String JSP_STATISTICS_2	= "statistics_2";
	private static final String JSP_STATISTICS_3	= "statistics_3";
	
	private static final String JSP_POPUP = "popup_list";
	private static final String JSP_POPUP_REGISTER = "popup_form";
	private static final String JSP_POPUP_SHOW = "popup_show";
	private static final String JSP_STATS = "admin/stats";
	
	
	private static final String POPUP_URL = "/admin/popup";
	//--- Main entity service
	
	@Value("#{commonConfig['s3.stream_input.path']}")
	protected String input_stream_upload_path;
	
	@Value("#{commonConfig['s3.stream_output.path']}")
	protected String output_stream_upload_prefix;
	
	@Value("#{commonConfig['cdn_url']}")
	protected String cdnUrl;
	
	@Resource
    private UsersService usersService; // Injected by Spring
	
	@Resource
	private PostingsService postingsService;
	
	@Resource
	private PostingTypesService postingTypesService;
	
	@Resource
	private PostingsJpaRepository postingsJpaRepository;
	
	@Resource
	private PopupsService popupsService;
	
	@Resource
	private LocalesService localesService;
	
	@Resource
    private UploadFilesService uploadFilesService; 
	
	@Resource
    private CardsService cardsService;
	
	@Resource
    private StatsService statsService;
	
	@Resource
    private ChannelService channelService;
	
	@Resource
    private CardTagsService cardTagsService;
	
	@Autowired
	private AmazonS3FileManager amazonS3FileManager;
	
	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public AdminController() {
		super(AdminController.class, MAIN_ENTITY_NAME );
		log("PostingController created.");
	}

	@RequestMapping()
	public String mainPage(Model model) {
		log("Action 'main page'");
		
		//신규회원목록
		List<Users> user1 = usersService.findByListLimit(1);
		
		//탈퇴회원목록
		List<Users> user2 = usersService.findByListLimit(0);
		
		model.addAttribute("list1", user1);
		model.addAttribute("list2", user2);
		
		return JSP_MAIN;
	}
	@RequestMapping(value = "/stats/delete/{id}") // GET or POST
	public String delete(RedirectAttributes redirectAttributes, @PathVariable("id") Integer id) {
		log("Action 'delete'" );
		try {
			cardsService.delete( id );
			//cardTagsService.deleteByCardId(id);
			//--- Set the result message
			messageHelper.addMessage(redirectAttributes, new Message(MessageType.SUCCESS,"delete.ok"));	
		} catch(Exception e) {
			messageHelper.addException(redirectAttributes, "cards.error.delete", e);
		}
		return "redirect:/admin/channel/card";
	}
	
	
	@RequestMapping(value="/stats",
			method = RequestMethod.GET)
	public String stats(
			@RequestParam(value="page", defaultValue="1") Integer page,
			@RequestParam(value="delete", defaultValue="0") Integer delete,
			@RequestParam(value="day", defaultValue="") String day,
			@RequestParam(value="startDate", defaultValue="") String endDate,
			@RequestParam(value="endDate", defaultValue="") String startDate,
			@RequestParam(value="month", defaultValue="") String month,
			@RequestParam(value="year", defaultValue="") String year,
			@RequestParam(value="order", defaultValue="view") String order,
			Model model){
		if(day!=null){
			Date date =Utils.convertStringtoUtilDate(day, "MM/dd/yyyy");
			model.addAttribute("title","[일간통계] "+date.getDate()+"월"+(date.getMonth()+1)+"일" );
			model.addAttribute("header_table",date.getDate()+"-"+(date.getMonth()+1) );
			model.addAttribute("active_day", "active");
			model.addAttribute("count_join", usersService.countJoinUser_ByDay(date));
			model.addAttribute("count_view", statsService.statsCard_ByDate(1, date));
			model.addAttribute("day", day);
		}else if(startDate != null && endDate != null){
			Date start =Utils.convertStringtoUtilDate(startDate, "MM/dd/yyyy");
			Date end =Utils.convertStringtoUtilDate(endDate, "MM/dd/yyyy");
			model.addAttribute("title","[주간통계] "+start.getDate()+"월"+(start.getMonth()+1)+"일 ~"+end.getDate()+"월"+(end.getMonth()+1) );
			model.addAttribute("header_table",start.getDate()+"-"+(start.getMonth()+1)+"~"+end.getDate()+"-"+(end.getMonth()+1) );
			model.addAttribute("active_week", "active");
			model.addAttribute("count_join", usersService.countJoinUser_ByWeek(start, end));
			model.addAttribute("count_view", statsService.statsCard_ByWeek(1, start, end));
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}else if(month!=null){
			//Date monthly =Utils.convertStringtoUtilDate(month, "dd/MM/yyyy");
			model.addAttribute("title","[월간통계] "+month+"/"+year) ;
			model.addAttribute("header_table",month+"/"+year );
			model.addAttribute("active_month", "active");
			Integer select_month= Utils.parseInt(month);
			Integer select_year= Utils.parseInt(year);
			model.addAttribute("count_join", usersService.countJoinUser_ByMonth(select_month, select_year));
			model.addAttribute("count_view", statsService.statsCard_ByMonth(1, select_month, select_year));
			model.addAttribute("month", month);
			model.addAttribute("year", year);
		}else{
			model.addAttribute("active_day", "active");
			model.addAttribute("count_join", usersService.totalJoinUsery());
			model.addAttribute("count_view", statsService.total_statsCard(1));
		}
		String oder_by="hitCount";
		if(order.equalsIgnoreCase("like")){
			oder_by="countLike";
		}else if(order.equalsIgnoreCase("comment")){
			oder_by="commentCount";
		}else if(order.equalsIgnoreCase("share")){
			oder_by="share";
		}else {
			oder_by="hitCount";
		}
		if(day==null){
			day="";
		}
		if(startDate==null){
			startDate="";
		}
		if(endDate==null){
			endDate="";
		}
		if(month==null){
			month="";
		}
		if(year==null){
			year="";
		}
		if(order==null){
			order="";
		}
		model.addAttribute("order", order);
		Page<CardsEntity> list = cardsService.findAll(page, 10, oder_by);
		String path = "/admin/stats";
		String param_url="day="+day+"&startDate="+startDate+"&endDate="+endDate+"&month="+month+"&year="+year+"&order="+order;;
		model.addAttribute("param_url", param_url);
		new Pager<CardsEntity>(list, model).pageSetting(path);
		return JSP_STATS;
	}
	
	
	
	@RequestMapping(value="/stats",
			method = RequestMethod.POST)
	public String stats_post(
			@RequestParam(value="page", defaultValue="1") Integer page,
			@RequestParam(value="delete", defaultValue="0") Integer delete,
			@RequestParam(value="day", defaultValue="") String day,
			@RequestParam(value="startDate", defaultValue="") String startDate,
			@RequestParam(value="endDate", defaultValue="") String endDate,
			@RequestParam(value="month", defaultValue="") String month,
			@RequestParam(value="year", defaultValue="") String year,
			@RequestParam(value="order", defaultValue="view") String order,
			Model model){
		if(delete>0){
			Cards c =cardsService.findById(delete);
			if(c.getChannelId()!=null){
				Channel channel = channelService.findById(c.getChannelId());
				if(channel.getCardsRecentId()!=null && channel.getCardsRecentId().equals(c.getId())){
					channel.setCardsRecentId(null);
					channelService.update(channel);
				}
			}
			cardTagsService.deleteByCardId(delete);
			cardsService.delete(delete);
		}
		if(day==null){
			day="";
		}
		if(startDate==null){
			startDate="";
		}
		if(endDate==null){
			endDate="";
		}
		if(month==null){
			month="";
		}
		if(year==null){
			year="";
		}
		if(order==null){
			order="";
		}
		return "redirect:/admin/stats?page="+page+"&day="+day+"&startDate="+startDate+"&endDate="+endDate+"&month="+month+"&year="+year+"&order="+order;
	}
	
	
	
	@RequestMapping("/google_analytics")
	public String googleAnalyticsPage(Model model) {
		log("Action 'google_analytics page'");
		
		return JSP_GOOGLE_ANAL;
	}
	
	@RequestMapping("/statistics_1")
	public String statisticsPage(Model model) {
		log("Action 'statistics1 page'");
		
		return JSP_STATISTICS_1;
	}
	 
	@RequestMapping("/statistics_2")
	public String statistics2Page(Model model) {
		log("Action 'statistics2 page'");
		
		return JSP_STATISTICS_2;
	}
	
	@RequestMapping("/statistics_3")
	public String statistics3Page(Model model) {
		log("Action 'statistics3 page'");
		
		return JSP_STATISTICS_3;
	}
	
	@RequestMapping("/popup")
	public String popupPage(Model model,
			@RequestParam(value="page", defaultValue="1") Integer pageNumber) {
		log("Action 'popup page'");
		
		Page<PopupsEntity> popups = popupsService.findAll(pageNumber);
		new Pager<PopupsEntity>(popups, model).pageSetting(POPUP_URL);
		
		return JSP_POPUP;
	}
	
	@RequestMapping("/popup/delete/{id}")
	public RedirectView popupDeletePage(
			Model model, 
			@PathVariable("id") int id) {
		log("Action 'popupDelete'");
		popupsService.delete(id);
		
		String path = POPUP_URL;
		
		RedirectView rv = new RedirectView(path);
		rv.setExposeModelAttributes(false);
		return rv;
	}

	@RequestMapping("/popup/search")
	public String popupSearchPage(
			Model model, 
			@RequestParam(value="page", defaultValue="1") Integer pageNumber,
			@RequestParam(value="option", defaultValue="1") int option, 
			@RequestParam(value="keyword") String keyword) {
		log("Action 'popup/search page'");
		
		System.out.println("get page : " + pageNumber);
		Page<PopupsEntity> list = popupsService.findSearchAll(pageNumber, option, keyword);//"+ $("#options").val() + "&keyword="
		new Pager<PopupsEntity>(list, model).pageSetting("/admin/popup/search?page="+ pageNumber + "&option="+option+ "&keyword="+keyword);
		
		return JSP_POPUP;
	}

	@RequestMapping("/popup/register")
	public String popupRegisterPage(Model model) {
		log("Action 'popup/register page'");

		Popups popup = new Popups();
		model.addAttribute("popup", popup);
		
		List<Locales> locales = localesService.findAll();
		model.addAttribute("locales", locales);
		
		return JSP_POPUP_REGISTER;
	}

	@RequestMapping("/popup/register/complete")
	public RedirectView popupRegisterCompletePage(
			Model model, 
			Popups popup,
			@RequestParam(value="popup_image") MultipartFile popupImage,
			@RequestParam(value="start_date", defaultValue="") String startDate,
			@RequestParam(value="end_date", defaultValue="") String endDate) {
		log("Action 'popup/register/complete page'");

		// Popups 생성
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Popups newPopup = null;
		try {
			Date tempStartDate = sdFormat.parse(startDate);
			Date tempEndDate = sdFormat.parse(endDate);
			popup.setStartAt(tempStartDate);
			popup.setEndAt(tempEndDate);
			
			newPopup = popupsService.create(popup);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Amazon S3 파일 저장
		String domain = "popup";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new Date());
		String DIRECTORY = domain+"/"+newPopup.getId()+"/";
		
		if(popupImage != null){
			String originalFileName = popupImage.getOriginalFilename();
			String tempFileName = today + originalFileName;
			String PATH = DIRECTORY + tempFileName;

			try {
				File newSave = File.createTempFile(originalFileName, null);
				popupImage.transferTo(newSave);
				amazonS3FileManager.upload(PATH, newSave);
				
				log("Action 'notice file Save'" + "file created");
				UploadFiles postingData = new UploadFiles();
				postingData.setPath(tempFileName);
				postingData.setOwnerId(newPopup.getId());
				postingData.setDomain(domain);
				postingData = uploadFilesService.create(postingData);
				
				newPopup.setImageUrl(cdnUrl+"/" +PATH);
				popupsService.update(newPopup);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		

		String path = POPUP_URL;
		
		RedirectView rv = new RedirectView(path);
		rv.setExposeModelAttributes(false);
		
		return rv;
	}

	@RequestMapping("/popup/show")
	public String popupShowPage(Model model,
			@RequestParam(value="id", defaultValue="1") int id) {
		log("Action 'popup/show page'");

		Popups popup = popupsService.findById(id);
		model.addAttribute("popup", popup);
		
		return JSP_POPUP_SHOW;
	}
	
	@RequestMapping("/movie_register")
	public String movieRegister(Model model, @RequestParam(value="message", required=false) String message) {
		log("Action 'movie movie_register page':"+message);
		
		if (message!=null)
			model.addAttribute("message", message);
		return "admin/movie/write.tiles";
	}

	
	@RequestMapping("/movie_list")
	public String movieList(Model model) {
		log("Action 'movie movie_list page'");
		
		try {
			model.addAttribute("jobs", JobStatusNotificationsSample.getElasticTranscoderJob());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/movie/list.tiles";
	}
	
	@RequestMapping("/movie_create")
	public String movieCreate(RedirectAttributes redirectAttributes, Model model, @RequestParam(value="movie", required=false) MultipartFile movie) {
		log("Action 'movie conveter creation process page'");
		System.out.println("Movie begin upload");
		if (movie==null)
		{
			log("Movie null");
			redirectAttributes.addFlashAttribute("message", "인자 확인해주세요.");
//			RedirectView rv = new RedirectView("/admin/movie_register");
//			rv.addStaticAttribute(");
//			rv.
//			rv.setExposeModelAttributes(false);
			return "redirect:/admin/movie_register";
		}
		System.out.println("file_name:"+movie.getName());
		System.out.println("file_ori_name:"+movie.getOriginalFilename());
		String[] extension = movie.getOriginalFilename().split("\\.");
		System.out.println("length:"+extension.length);
		if (extension.length < 2
				|| (!extension[1].equals("3GP")
				&& !extension[1].equals("AAC")
				&& !extension[1].equals("AVI")
				&& !extension[1].equals("FLV")
				&& !extension[1].equals("mp4")
				&& !extension[1].equals("MPEG-2")
				&& !extension[1].equals("wmv")))
		{
			System.out.println("Movie type invalid");
			redirectAttributes.addFlashAttribute("message", "동영상 파일만 업로드가 가능합니다.");
			return "redirect:/admin/movie_register";
		}
		try {
			System.out.println("Movie begin upload in Amazon Service");
			String directoryPath = uploadS3_Movie(input_stream_upload_path, movie, movie.getOriginalFilename());
			if (directoryPath==null)
			{
				System.out.println("Path null");
				redirectAttributes.addFlashAttribute("message", "업로드에 실패하였습니다. 확인해주세요.");
				return "redirect:/admin/movie_register";
			}

			try {
				System.out.println("movieUrl");
				String movieUrl = input_stream_upload_path +"/"+ directoryPath+"/"+movie.getOriginalFilename();
				JobStatusNotificationsSample.createElasticTranscoderJob(movieUrl, output_stream_upload_prefix+directoryPath+"/");
			} catch (Exception e) {

				e.printStackTrace();
				redirectAttributes.addFlashAttribute("message", "변환 등록에 실패하였습니다. 확인해주세요.");
				return "redirect:/admin/movie_register";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error upload video:"+ e);
		}
		
		
		RedirectView rv = new RedirectView("/admin/movie_list");
		rv.setExposeModelAttributes(false);
		
		return "redirect:/admin/movie_list";
	}
}
