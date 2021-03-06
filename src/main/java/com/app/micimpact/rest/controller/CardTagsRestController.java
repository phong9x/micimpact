/*
 * Created on 21 12월 2015 ( Time 20:09:37 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.rest.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import com.app.micimpact.bean.CardTags;
import com.app.micimpact.business.service.CardTagsService;

/**
 * Spring MVC controller for 'CardTags' management.
 */
@Controller
public class CardTagsRestController {

	@Resource
	private CardTagsService cardTagsService;
	
	@RequestMapping( value="/items/cardTags",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<CardTags> findAllAsListItems() {
		List<CardTags> list = cardTagsService.findAll();
		return list;
	}
	
	@RequestMapping( value="/cardTags",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<CardTags> findAll() {
		return cardTagsService.findAll();
	}

	@RequestMapping( value="/cardTags/{id}",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public CardTags findOne(@PathVariable("id") Integer id) {
		return cardTagsService.findById(id);
	}
	
	@RequestMapping( value="/cardTags",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public CardTags create(@RequestBody CardTags cardTags) {
		return cardTagsService.create(cardTags);
	}

	@RequestMapping( value="/cardTags/{id}",
			method = RequestMethod.PUT,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public CardTags update(@PathVariable("id") Integer id, @RequestBody CardTags cardTags) {
		return cardTagsService.update(cardTags);
	}

	@RequestMapping( value="/cardTags/{id}",
			method = RequestMethod.DELETE,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public void delete(@PathVariable("id") Integer id) {
		cardTagsService.delete(id);
	}
	
}
