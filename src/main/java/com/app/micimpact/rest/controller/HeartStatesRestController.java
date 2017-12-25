/*
 * Created on 9 12월 2015 ( Time 16:26:41 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.rest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.app.micimpact.bean.HeartStates;
import com.app.micimpact.bean.IntialTags;
import com.app.micimpact.business.service.HeartStatesService;
import com.app.micimpact.rest.common.AbstractRestController;

/**
 * Spring MVC controller for 'HeartStates' management.
 */
@RequestMapping("/heart_states")
@Controller
public class HeartStatesRestController extends AbstractRestController{
	
	@Resource
	private HeartStatesService heartStatesService;
	
	@RequestMapping( value="",
			method = {RequestMethod.GET, RequestMethod.POST},
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public HashMap<String, Object> findAll() {
		
		HashMap<String, Object> ret = new HashMap<String, Object> ();
		ret.put("heart_states", heartStatesService.findAll());
		
		return SUCCESS(ret);
	}
	
}