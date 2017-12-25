package com.app.micimpact.web.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import com.app.micimpact.bean.FileTransfer;
import com.app.micimpact.bean.Postings;
//--- Entities
import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.Users;
import com.app.micimpact.business.service.PostingsService;
//--- Services 
import com.app.micimpact.business.service.UploadFilesService;
//--- Common classes
import com.app.micimpact.web.common.AbstractController;
import com.app.micimpact.web.common.AmazonS3FileManager;
import com.app.micimpact.web.common.BasicEnvironment;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * Spring MVC controller for 'UploadFiles' management.
 */
@Controller
@RequestMapping()
public class UploadFilesController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "uploadFiles";
	public static final String DOMAIN_NOTICE = "notice";
	public static final String DOMAIN_FREE_BOARD = "free_board";
	
	private static final int FREE_BOARD_TYPE_ID   = 20;
	private static final int NOTICE_TYPE_ID   = 10;
	
	private static final String ADMIN_BOARDS_URL   = "/admin/manage_boards";
	private static final String USER_BOARDS_URL   = "/boards";
	
	private static final int ROLE_ADMIN = 1;
	private static final int ROLE_USER = 2;
//	private static final int ROLE_ADMIN = 3;
	//--- Main entity service
	
	@Value("#{commonConfig['cdn_url']}")
	protected String cdn_url;
	
	@Value("#{commonConfig['s3.board.path']}")
	protected String board_path;
	
	@Autowired
	private AmazonS3FileManager amazonS3FileManager;
	
	@Resource
    private UploadFilesService uploadFilesService; // Injected by Spring
	//--- Other service(s)
	@Resource
	private PostingsService postingsService;
	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public UploadFilesController() {
		super(UploadFilesController.class, MAIN_ENTITY_NAME );
		log("UploadFilesController created.");
	}

	@RequestMapping(value={"/admin/manage_boards/create_files/{id}","/boards/create_files/{id}"},
			method= RequestMethod.POST,
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String boardCreateFiles(
			HttpServletResponse response,
			Model model,
			@ModelAttribute("fileTransfer") FileTransfer fileTransfer,
			@PathVariable("id") int postingId) throws JsonProcessingException {
		log("Action 'boardCreateFiles'");
		List<MultipartFile> multipartFiles = fileTransfer.getFiles();
		Postings posting = postingsService.findById(postingId);
		String domain;
		int postingTypeId = posting.getTypeId();
		int boardType;
		if(postingTypeId/10 == 1){
			domain = DOMAIN_NOTICE;
			boardType = NOTICE_TYPE_ID;
		}else{
			domain = DOMAIN_FREE_BOARD;
			boardType = FREE_BOARD_TYPE_ID;
		}
		
		HashMap<String, Object> responseMap = new HashMap<String, Object>();
		
		List<UploadFiles> tempPDs = new ArrayList<UploadFiles>(); 
		int numOfFiles = 0;
		int numOfSucess = 0;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new Date());
		String DIRECTORY = domain+"/"+posting.getId()+"/";
		
		for (MultipartFile multipartFile : multipartFiles) {
			if(multipartFile != null){
				numOfFiles++;
				String originalFileName = multipartFile.getOriginalFilename();
				String tempFileName = today + originalFileName;
				String PATH = DIRECTORY + tempFileName;
	
				try {
					File newSave = File.createTempFile(originalFileName, null);
					multipartFile.transferTo(newSave);
					amazonS3FileManager.upload(PATH, newSave);
					
					log("Action 'notice file Save'" + "file created");
					UploadFiles postingData = new UploadFiles();
					postingData.setPath(tempFileName);
					postingData.setOwnerId(posting.getId());
					postingData.setDomain(domain);
					postingData.setExtra1(originalFileName);
					postingData = uploadFilesService.create(postingData);
					tempPDs.add(postingData);
					numOfSucess++;
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		if(numOfFiles == numOfSucess){
			responseMap.put("success", "true"); 
			responseMap.put("message", posting.getTypeId());
			Users user = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(user.getRoleId() == ROLE_ADMIN){
				responseMap.put("url", ADMIN_BOARDS_URL);
			}else if(user.getRoleId() == ROLE_USER ){
				responseMap.put("url", USER_BOARDS_URL);
			}
			responseMap.put("bType", boardType);
		}else {
			deleteFiles(tempPDs);
			postingsService.delete(posting.getId());
			responseMap.put("success", "false"); 
			responseMap.put("message", "파일 업로드에 실패했습니다.");
		}
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(responseMap);
	}
	
	public void deleteFiles(List<UploadFiles> postingDatas){
		String PATH = null;
		for(UploadFiles postingData : postingDatas){
			PATH = postingData.getDomain()+"/"+postingData.getOwnerId() +"/"+postingData.getPath();
			amazonS3FileManager.delete(PATH);
			uploadFilesService.delete(postingData.getId());
		}
	}
	
	@RequestMapping(value = {"/admin/manage_boards/uploadFiles/{id}","/boards/uploadFiles/{id}"}, 
			produces= MediaType.APPLICATION_OCTET_STREAM_VALUE,
			method = RequestMethod.GET)
	@ResponseBody
	public void uploadFilesDownload(@PathVariable("id") int uploadFileId,
			HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, UnsupportedEncodingException {
		
		log("Action 'uploadFilesDownload'");
		
		UploadFiles uploadFiles = uploadFilesService.findById(uploadFileId);
		
		String PATH = uploadFiles.getDomain()+"/"+uploadFiles.getOwnerId()+"/"+uploadFiles.getPath();
		
		String strFileName = uploadFiles.getExtra1();
		response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(strFileName, "UTF-8")+"\"");
//		response.setContentLength((int)file.length());
		OutputStream out;
		try {
			out = response.getOutputStream();
			S3ObjectInputStream fis = amazonS3FileManager.download(PATH);

			try {
				FileCopyUtils.copy(fis, out);
			}catch(IOException ioe){
				ioe.printStackTrace();
				ioe.getStackTrace() ;
			}finally{
				if(fis != null) fis.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/image_upload")
	@ResponseBody
	public RedirectView editorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam("Filedata") MultipartFile file) {
		log("Action 'editorImageUpload'");
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func="+ request.getParameter("callback_func");
		String return3 = "";
		String name = file.getOriginalFilename();
		String returnUrl = "";
		log("Action 'admin dataImage'"+return1);
		log("Action 'admin dataImage'"+return2);
		try{

//			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//			String today = formatter.format(new Date());
//			String realFileNm = today + UUID.randomUUID().toString()
//					+ name.substring(name.lastIndexOf("."));
//			String PATH = realFileNm;

//			log("Action 'admin dataImage' realFileNm:" + realFileNm);
//			File newSave = File.createTempFile(realFileNm, null);
//			file.transferTo(newSave);
//			amazonS3FileManager.upload(PATH, newSave);
			String boardImageUrl = uploadS3(board_path, file, name.substring(name.lastIndexOf(".")+1));
			log("Action 'editorImageUpload': " + boardImageUrl);
			return3 += "&bNewline=true";
			return3 += "&sFileName=" + name;
			return3 += "&sFileURL="+ cdn_url + boardImageUrl;
			returnUrl = return1 + return2 + return3;
			log("Action 'editorImageUpload' return url : " + returnUrl);
		}catch (Exception e){
			e.printStackTrace();
		}
			
//		return "redirect:"+returnUrl;
		RedirectView rv = new RedirectView(returnUrl);
		rv.setExposeModelAttributes(false);
		return rv;
	}
	
	@RequestMapping(value="/image_upload_html5", method = RequestMethod.POST)
	@ResponseBody
	public void editorImageUploadHTML5(HttpServletRequest request, HttpServletResponse response) {
		log("Action 'editorImageUploadHTML5'");
		try {
			log(request.getHeader("contentType"));
			log(request.getHeader("file-name"));
			log(request.getHeader("file-size"));
			log(request.getHeader("file-Type"));
			log(request.toString());
			// 파일정보
			String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			String realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String PATH = board_path + "/" + realFileNm;

			InputStream is = request.getInputStream();
			Long contentLength = Long.valueOf(request.getHeader("file-size"));

//			InputStream is = request.getInputStream();
//	        byte[] contentBytes = IOUtils.toByteArray(is);
//	        ByteArrayInputStream bis = new ByteArrayInputStream(contentBytes);
//	        Long contentLength = Long.valueOf(contentBytes.length);
	        
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setContentLength(contentLength);
			amazonS3FileManager.upload(PATH, is, metadata);
			log("Action 'admin dataImage' realFileNm:" + realFileNm	+ " file size:" + contentLength);

			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL="+ cdn_url + PATH;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
