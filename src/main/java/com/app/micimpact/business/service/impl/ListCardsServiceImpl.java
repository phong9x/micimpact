/*
 * Created on 21 12월 2015 ( Time 20:29:14 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.ListCards;
import com.app.micimpact.bean.jpa.ListCardsEntity;
import com.app.micimpact.business.service.ListCardsService;
import com.app.micimpact.business.service.mapping.ListCardsServiceMapper;
import com.app.micimpact.data.repository.jpa.ListCardsJpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of ListCardsService
 */
@Component
@Transactional
public class ListCardsServiceImpl implements ListCardsService {

	@Resource
	private ListCardsJpaRepository listCardsJpaRepository;

	@Resource
	private ListCardsServiceMapper listCardsServiceMapper;
	
	@Override
	public ListCards findById(Integer id) {
		ListCardsEntity listCardsEntity = listCardsJpaRepository.findOne(id);
		return listCardsServiceMapper.mapListCardsEntityToListCards(listCardsEntity);
	}

	@Override
	public List<ListCards> findAll() {
		Iterable<ListCardsEntity> entities = listCardsJpaRepository.findAll();
		List<ListCards> beans = new ArrayList<ListCards>();
		for(ListCardsEntity listCardsEntity : entities) {
			beans.add(listCardsServiceMapper.mapListCardsEntityToListCards(listCardsEntity));
		}
		return beans;
	}

	@Override
	public ListCards save(ListCards listCards) {
		return update(listCards) ;
	}

	@Override
	public ListCards create(ListCards listCards) {
		ListCardsEntity listCardsEntity;
		if(listCards.getId() != null){
			listCardsEntity = listCardsJpaRepository.findOne(listCards.getId());
			if( listCardsEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		listCardsEntity = new ListCardsEntity();
		listCardsServiceMapper.mapListCardsToListCardsEntity(listCards, listCardsEntity);
		ListCardsEntity listCardsEntitySaved = listCardsJpaRepository.save(listCardsEntity);
		return listCardsServiceMapper.mapListCardsEntityToListCards(listCardsEntitySaved);
	}

	@Override
	public ListCards update(ListCards listCards) {
		ListCardsEntity listCardsEntity = listCardsJpaRepository.findOne(listCards.getId());
		listCardsServiceMapper.mapListCardsToListCardsEntity(listCards, listCardsEntity);
		ListCardsEntity listCardsEntitySaved = listCardsJpaRepository.save(listCardsEntity);
		return listCardsServiceMapper.mapListCardsEntityToListCards(listCardsEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		listCardsJpaRepository.delete(id);
	}

	public ListCardsJpaRepository getListCardsJpaRepository() {
		return listCardsJpaRepository;
	}

	public void setListCardsJpaRepository(ListCardsJpaRepository listCardsJpaRepository) {
		this.listCardsJpaRepository = listCardsJpaRepository;
	}

	public ListCardsServiceMapper getListCardsServiceMapper() {
		return listCardsServiceMapper;
	}

	public void setListCardsServiceMapper(ListCardsServiceMapper listCardsServiceMapper) {
		this.listCardsServiceMapper = listCardsServiceMapper;
	}

}
