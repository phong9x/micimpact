/*
 * Created on 9 12월 2015 ( Time 17:41:16 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.HeartStates;
import com.app.micimpact.bean.jpa.HeartStatesEntity;
import com.app.micimpact.business.service.HeartStatesService;
import com.app.micimpact.business.service.mapping.HeartStatesServiceMapper;
import com.app.micimpact.data.repository.jpa.HeartStatesJpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of HeartStatesService
 */
@Component
@Transactional
public class HeartStatesServiceImpl implements HeartStatesService {

	@Resource
	private HeartStatesJpaRepository heartStatesJpaRepository;

	@Resource
	private HeartStatesServiceMapper heartStatesServiceMapper;
	
	@Override
	public HeartStates findById(Integer id) {
		HeartStatesEntity heartStatesEntity = heartStatesJpaRepository.findOne(id);
		return heartStatesServiceMapper.mapHeartStatesEntityToHeartStates(heartStatesEntity);
	}

	@Override
	public List<HeartStates> findAll() {
		Iterable<HeartStatesEntity> entities = heartStatesJpaRepository.findAll();
		List<HeartStates> beans = new ArrayList<HeartStates>();
		for(HeartStatesEntity heartStatesEntity : entities) {
			beans.add(heartStatesServiceMapper.mapHeartStatesEntityToHeartStates(heartStatesEntity));
		}
		return beans;
	}

	@Override
	public HeartStates save(HeartStates heartStates) {
		return update(heartStates) ;
	}

	@Override
	public HeartStates create(HeartStates heartStates) {
		HeartStatesEntity heartStatesEntity;
		if(heartStates.getId() != null){
			heartStatesEntity = heartStatesJpaRepository.findOne(heartStates.getId());
			if( heartStatesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		heartStatesEntity = new HeartStatesEntity();
		heartStatesServiceMapper.mapHeartStatesToHeartStatesEntity(heartStates, heartStatesEntity);
		HeartStatesEntity heartStatesEntitySaved = heartStatesJpaRepository.save(heartStatesEntity);
		return heartStatesServiceMapper.mapHeartStatesEntityToHeartStates(heartStatesEntitySaved);
	}

	@Override
	public HeartStates update(HeartStates heartStates) {
		HeartStatesEntity heartStatesEntity = heartStatesJpaRepository.findOne(heartStates.getId());
		heartStatesServiceMapper.mapHeartStatesToHeartStatesEntity(heartStates, heartStatesEntity);
		HeartStatesEntity heartStatesEntitySaved = heartStatesJpaRepository.save(heartStatesEntity);
		return heartStatesServiceMapper.mapHeartStatesEntityToHeartStates(heartStatesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		heartStatesJpaRepository.delete(id);
	}

	public HeartStatesJpaRepository getHeartStatesJpaRepository() {
		return heartStatesJpaRepository;
	}

	public void setHeartStatesJpaRepository(HeartStatesJpaRepository heartStatesJpaRepository) {
		this.heartStatesJpaRepository = heartStatesJpaRepository;
	}

	public HeartStatesServiceMapper getHeartStatesServiceMapper() {
		return heartStatesServiceMapper;
	}

	public void setHeartStatesServiceMapper(HeartStatesServiceMapper heartStatesServiceMapper) {
		this.heartStatesServiceMapper = heartStatesServiceMapper;
	}

}