/*
 * Created on 9 12월 2015 ( Time 17:41:16 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.Cards;
import com.app.micimpact.bean.Images;
import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.ImagesEntity;
import com.app.micimpact.business.service.ImagesService;
import com.app.micimpact.business.service.mapping.ImagesServiceMapper;
import com.app.micimpact.data.repository.jpa.ImagesJpaRepository;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of ImagesService
 */
@Component
@Transactional
public class ImagesServiceImpl implements ImagesService {

	@Resource
	private ImagesJpaRepository imagesJpaRepository;

	@Resource
	private ImagesServiceMapper imagesServiceMapper;
	
	@Override
	public Images findById(Integer id) {
		ImagesEntity imagesEntity = imagesJpaRepository.findOne(id);
		return imagesServiceMapper.mapImagesEntityToImages(imagesEntity);
	}

	@Override
	public List<Images> findAll() {
		Iterable<ImagesEntity> entities = imagesJpaRepository.findAll();
		List<Images> beans = new ArrayList<Images>();
		for(ImagesEntity imagesEntity : entities) {
			beans.add(imagesServiceMapper.mapImagesEntityToImages(imagesEntity));
		}
		return beans;
	}

	@Override
	public Images save(Images images) {
		return update(images) ;
	}

	@Override
	public Images create(Images images) {
		ImagesEntity imagesEntity;
		if(images.getId() != null){
			imagesEntity = imagesJpaRepository.findOne(images.getId());
			if( imagesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		imagesEntity = new ImagesEntity();
		imagesServiceMapper.mapImagesToImagesEntity(images, imagesEntity);
		ImagesEntity imagesEntitySaved = imagesJpaRepository.save(imagesEntity);
		return imagesServiceMapper.mapImagesEntityToImages(imagesEntitySaved);
	}

	@Override
	public Images update(Images images) {
		ImagesEntity imagesEntity = imagesJpaRepository.findOne(images.getId());
		imagesServiceMapper.mapImagesToImagesEntity(images, imagesEntity);
		ImagesEntity imagesEntitySaved = imagesJpaRepository.save(imagesEntity);
		return imagesServiceMapper.mapImagesEntityToImages(imagesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		imagesJpaRepository.delete(id);
	}

	public ImagesJpaRepository getImagesJpaRepository() {
		return imagesJpaRepository;
	}

	public void setImagesJpaRepository(ImagesJpaRepository imagesJpaRepository) {
		this.imagesJpaRepository = imagesJpaRepository;
	}

	public ImagesServiceMapper getImagesServiceMapper() {
		return imagesServiceMapper;
	}

	public void setImagesServiceMapper(ImagesServiceMapper imagesServiceMapper) {
		this.imagesServiceMapper = imagesServiceMapper;
	}

	public List<Images> findByCardIdIn(Integer card_ids[])
	{
		Iterable<ImagesEntity> entities = imagesJpaRepository.findByCardIdIn(card_ids);
		List<Images> beans = new ArrayList<Images>();
		for(ImagesEntity imagesEntity : entities) {
			beans.add(imagesServiceMapper.mapImagesEntityToImages(imagesEntity));
		}
		return beans;
	}

	@Override
	public List<Images> findByIdIn(Integer[] card_ids) {
		// TODO Auto-generated method stub
		Iterable<ImagesEntity> entities = imagesJpaRepository.findByIdIn(card_ids);
		List<Images> beans = new ArrayList<Images>();
		for(ImagesEntity imagesEntity : entities) {
			beans.add(imagesServiceMapper.mapImagesEntityToImages(imagesEntity));
		}
		return beans;
	}
}