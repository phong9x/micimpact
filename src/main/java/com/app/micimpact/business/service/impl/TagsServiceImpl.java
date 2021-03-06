/*
 * Created on 9 12월 2015 ( Time 17:50:53 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.Tags;
import com.app.micimpact.bean.jpa.TagsEntity;
import com.app.micimpact.business.service.TagsService;
import com.app.micimpact.business.service.mapping.TagsServiceMapper;
import com.app.micimpact.data.repository.jpa.TagsJpaRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of TagsService
 */
@Component
@Transactional
public class TagsServiceImpl implements TagsService {

	@Resource
	private TagsJpaRepository tagsJpaRepository;

	@Resource
	private TagsServiceMapper tagsServiceMapper;
	
	@Override
	public Tags findById(String name) {
		TagsEntity tagsEntity = tagsJpaRepository.findOne(name);
		return tagsServiceMapper.mapTagsEntityToTags(tagsEntity);
	}

	@Override
	public List<Tags> findAll() {
		Iterable<TagsEntity> entities = tagsJpaRepository.findAll();
		List<Tags> beans = new ArrayList<Tags>();
		for(TagsEntity tagsEntity : entities) {
			beans.add(tagsServiceMapper.mapTagsEntityToTags(tagsEntity));
		}
		return beans;
	}

	@Override
	public Tags save(Tags tags) {
		return update(tags) ;
	}

	@Override
	public Tags create(Tags tags) {
		TagsEntity tagsEntity;
		if(tags.getName() != null){
			tagsEntity = tagsJpaRepository.findOne(tags.getName());
			if( tagsEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		tagsEntity = new TagsEntity();
		tagsServiceMapper.mapTagsToTagsEntity(tags, tagsEntity);
		TagsEntity tagsEntitySaved = tagsJpaRepository.save(tagsEntity);
		return tagsServiceMapper.mapTagsEntityToTags(tagsEntitySaved);
	}

	@Override
	public Tags update(Tags tags) {
		TagsEntity tagsEntity = tagsJpaRepository.findOne(tags.getName());
		tagsServiceMapper.mapTagsToTagsEntity(tags, tagsEntity);
		TagsEntity tagsEntitySaved = tagsJpaRepository.save(tagsEntity);
		return tagsServiceMapper.mapTagsEntityToTags(tagsEntitySaved);
	}

	@Override
	public void delete(String name) {
		tagsJpaRepository.delete(name);
	}

	public TagsJpaRepository getTagsJpaRepository() {
		return tagsJpaRepository;
	}

	public void setTagsJpaRepository(TagsJpaRepository tagsJpaRepository) {
		this.tagsJpaRepository = tagsJpaRepository;
	}

	public TagsServiceMapper getTagsServiceMapper() {
		return tagsServiceMapper;
	}

	public void setTagsServiceMapper(TagsServiceMapper tagsServiceMapper) {
		this.tagsServiceMapper = tagsServiceMapper;
	}

	@Override
	public Page<TagsEntity> findAll(Integer page, Integer size) {
		try {
			PageRequest request =  new PageRequest(page - 1, size, 
					 new Sort(new Order(Direction.DESC, "name")));
			return tagsJpaRepository.findByPage(request);
		} catch (Exception e) {
			System.err.println(e);
			return null;
		}
		
	}

}
