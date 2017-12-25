
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.Errors;
import com.app.micimpact.bean.jpa.ErrorsEntity;
import com.app.micimpact.business.service.ErrorsService;
import com.app.micimpact.business.service.mapping.ErrorsServiceMapper;
import com.app.micimpact.data.repository.jpa.ErrorsJpaRepository;
import com.app.micimpact.web.common.BasicEnvironment;

/**
 * Implementation of ErrorsService
 */
@Component
@Transactional
public class ErrorsServiceImpl implements ErrorsService {

	@Resource
	private ErrorsJpaRepository errorsJpaRepository;

	@Resource
	private ErrorsServiceMapper errorsServiceMapper;
	
	@Override
	public Errors findById(Integer id) {
		ErrorsEntity errorsEntity = errorsJpaRepository.findOne(id);
		return errorsServiceMapper.mapErrorsEntityToErrors(errorsEntity);
	}

	@Override
	public List<Errors> findAll() {
		Iterable<ErrorsEntity> entities = errorsJpaRepository.findAll();
		List<Errors> beans = new ArrayList<Errors>();
		for(ErrorsEntity errorsEntity : entities) {
			beans.add(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntity));
		}
		return beans;
	}

	@Override
	public Errors save(Errors errors) {
		return update(errors) ;
	}

	@Override
	public Errors create(Errors errors) {
		ErrorsEntity errorsEntity;
		if(errors.getId() != null){
			errorsEntity = errorsJpaRepository.findOne(errors.getId());
			if( errorsEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		errorsEntity = new ErrorsEntity();
		errorsServiceMapper.mapErrorsToErrorsEntity(errors, errorsEntity);
		ErrorsEntity errorsEntitySaved = errorsJpaRepository.save(errorsEntity);
		return errorsServiceMapper.mapErrorsEntityToErrors(errorsEntitySaved);
	}

	@Override
	public Errors update(Errors errors) {
		ErrorsEntity errorsEntity = errorsJpaRepository.findOne(errors.getId());
		errorsServiceMapper.mapErrorsToErrorsEntity(errors, errorsEntity);
		ErrorsEntity errorsEntitySaved = errorsJpaRepository.save(errorsEntity);
		return errorsServiceMapper.mapErrorsEntityToErrors(errorsEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		errorsJpaRepository.delete(id);
	}

	public ErrorsJpaRepository getErrorsJpaRepository() {
		return errorsJpaRepository;
	}

	public void setErrorsJpaRepository(ErrorsJpaRepository errorsJpaRepository) {
		this.errorsJpaRepository = errorsJpaRepository;
	}

	public ErrorsServiceMapper getErrorsServiceMapper() {
		return errorsServiceMapper;
	}

	public void setErrorsServiceMapper(ErrorsServiceMapper errorsServiceMapper) {
		this.errorsServiceMapper = errorsServiceMapper;
	}

	@Override
	public Page<ErrorsEntity> findAll(Integer pageNumber) {
		// TODO Auto-generated method stub
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		return errorsJpaRepository.findAll(request);
	}

	@Override
	public Page<ErrorsEntity> findSearchAll(Integer pageNumber, Integer option,
			String keyword) {
		// TODO Auto-generated method stub
		String value = "%"+keyword+"%";//검색 조건
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		switch (option) {
			case 1:
				return errorsJpaRepository.findByErrorCodeLike(request ,value);
			case 2:
				return errorsJpaRepository.findByErrorMassageLike(request ,value);
		}
		
		return null;
	}
}
