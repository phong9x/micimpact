/*
 * Created on 30 Mar 2016 ( Time 17:33:44 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.Point;
import com.app.micimpact.bean.jpa.PointEntity;
import java.util.Date;
import com.app.micimpact.business.service.PointService;
import com.app.micimpact.business.service.mapping.PointServiceMapper;
import com.app.micimpact.data.repository.jpa.PointJpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of PointService
 */
@Component
@Transactional
public class PointServiceImpl implements PointService {

	@Resource
	private PointJpaRepository pointJpaRepository;

	@Resource
	private PointServiceMapper pointServiceMapper;
	
	@Override
	public Point findById(Integer id) {
		PointEntity pointEntity = pointJpaRepository.findOne(id);
		return pointServiceMapper.mapPointEntityToPoint(pointEntity);
	}

	@Override
	public List<Point> findAll() {
		Iterable<PointEntity> entities = pointJpaRepository.findAll();
		List<Point> beans = new ArrayList<Point>();
		for(PointEntity pointEntity : entities) {
			beans.add(pointServiceMapper.mapPointEntityToPoint(pointEntity));
		}
		return beans;
	}

	@Override
	public Point save(Point point) {
		return update(point) ;
	}

	@Override
	public Point create(Point point) {
		PointEntity pointEntity;
		if(point.getId() != null){
			pointEntity = pointJpaRepository.findOne(point.getId());
			if( pointEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		pointEntity = new PointEntity();
		pointServiceMapper.mapPointToPointEntity(point, pointEntity);
		PointEntity pointEntitySaved = pointJpaRepository.save(pointEntity);
		return pointServiceMapper.mapPointEntityToPoint(pointEntitySaved);
	}

	@Override
	public Point update(Point point) {
		PointEntity pointEntity = pointJpaRepository.findOne(point.getId());
		pointServiceMapper.mapPointToPointEntity(point, pointEntity);
		PointEntity pointEntitySaved = pointJpaRepository.save(pointEntity);
		return pointServiceMapper.mapPointEntityToPoint(pointEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		pointJpaRepository.delete(id);
	}

	public PointJpaRepository getPointJpaRepository() {
		return pointJpaRepository;
	}

	public void setPointJpaRepository(PointJpaRepository pointJpaRepository) {
		this.pointJpaRepository = pointJpaRepository;
	}

	public PointServiceMapper getPointServiceMapper() {
		return pointServiceMapper;
	}

	public void setPointServiceMapper(PointServiceMapper pointServiceMapper) {
		this.pointServiceMapper = pointServiceMapper;
	}

	@Override
	public List<PointEntity> findByUserIdAndCreatat(Integer user_id, Date date) {
		try {
			return pointJpaRepository.findByUserIdAndCreatat(user_id, date);
		} catch (Exception e) {
			System.err.println(e);
			return null;
		}
	}

}
