
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

import com.app.micimpact.bean.HeartStates;
import com.app.micimpact.bean.Postings;
import com.app.micimpact.bean.jpa.HeartStatesEntity;
import com.app.micimpact.bean.jpa.PostingTypesEntity;
import com.app.micimpact.bean.jpa.PostingsEntity;
import com.app.micimpact.business.service.PostingsService;
import com.app.micimpact.business.service.mapping.PostingsServiceMapper;
import com.app.micimpact.data.repository.jpa.PostingsJpaRepository;
import com.app.micimpact.web.common.BasicEnvironment;

/**
 * Implementation of PostingsService
 */
@Component
@Transactional
public class PostingsServiceImpl implements PostingsService {

	@Resource
	private PostingsJpaRepository postingsJpaRepository;

	@Resource
	private PostingsServiceMapper postingsServiceMapper;
	
	@Override
	public Postings findById(Integer id) {
		PostingsEntity postingsEntity = postingsJpaRepository.findOne(id);
		return postingsServiceMapper.mapPostingsEntityToPostings(postingsEntity);
	}

	@Override
	public List<Postings> findAll() {
		Iterable<PostingsEntity> entities = postingsJpaRepository.findAll();
		List<Postings> beans = new ArrayList<Postings>();
		for(PostingsEntity postingsEntity : entities) {
			beans.add(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntity));
		}
		return beans;
	}
	
	@Override
	public Postings save(Postings postings) {
		return update(postings) ;
	}

	@Override
	public Postings create(Postings postings) {
		PostingsEntity postingsEntity;
		if(postings.getId() != null){
			postingsEntity = postingsJpaRepository.findOne(postings.getId());
			if( postingsEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		postingsEntity = new PostingsEntity();
		postingsServiceMapper.mapPostingsToPostingsEntity(postings, postingsEntity);
		PostingsEntity postingsEntitySaved = postingsJpaRepository.save(postingsEntity);
		return postingsServiceMapper.mapPostingsEntityToPostings(postingsEntitySaved);
	}

	@Override
	public Postings update(Postings postings) {
		PostingsEntity postingsEntity = postingsJpaRepository.findOne(postings.getId());
		postingsServiceMapper.mapPostingsToPostingsEntity(postings, postingsEntity);
		PostingsEntity postingsEntitySaved = postingsJpaRepository.save(postingsEntity);
		return postingsServiceMapper.mapPostingsEntityToPostings(postingsEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		postingsJpaRepository.delete(id);
	}

	public PostingsJpaRepository getPostingsJpaRepository() {
		return postingsJpaRepository;
	}

	public void setPostingsJpaRepository(PostingsJpaRepository postingsJpaRepository) {
		this.postingsJpaRepository = postingsJpaRepository;
	}

	public PostingsServiceMapper getPostingsServiceMapper() {
		return postingsServiceMapper;
	}

	public void setPostingsServiceMapper(PostingsServiceMapper postingsServiceMapper) {
		this.postingsServiceMapper = postingsServiceMapper;
	}
	
	@Override
	public Page<PostingsEntity> findAll(Integer pageNumber, int iType)
	{
		PostingTypesEntity postingType = new PostingTypesEntity();
		postingType.setId(iType);
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, Sort.Direction.DESC, "createdAt");
		return postingsJpaRepository.findByPostingTypes(postingType, request);
	}

	
	@Override
	public Page<PostingsEntity> findAll(Integer pageNumber, List<Integer> arrType)
	{
		List<PostingTypesEntity> postingTypes = new ArrayList<PostingTypesEntity>();
		for(Integer type : arrType){
			PostingTypesEntity postingType = new PostingTypesEntity();
			postingType.setId(type);
			postingTypes.add(postingType);
		}
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				new Sort(new Order(Direction.DESC, "postingTypes"), new Order(Direction.DESC, "parentId"), new Order(Direction.ASC, "id")));
		return postingsJpaRepository.findByPostingTypesIn(postingTypes, request);
	}
	
	@Override
	public List<Postings> findByLastId(Integer lastId, int count)
	{
		Iterable<PostingsEntity> entities = postingsJpaRepository.findByLastId(lastId, count);
		List<Postings> beans = new ArrayList<Postings>();
		for(PostingsEntity bean : entities) {
			beans.add(postingsServiceMapper.mapPostingsEntityToPostings(bean));
		}
		
		return beans;
	}
	
	@Override
	public List<Postings> findByCount(int count)
	{
		Iterable<PostingsEntity> entities = postingsJpaRepository.findByCount(count);
		List<Postings> beans = new ArrayList<Postings>();
		for(PostingsEntity bean : entities) {
			beans.add(postingsServiceMapper.mapPostingsEntityToPostings(bean));
		}
		
		return beans;
	}
	
	@Override
	public List<PostingsEntity> findByParentIdAndPostingTypes(Integer parentId, Integer type){
		PostingTypesEntity postingTypesEntity = new PostingTypesEntity();
		postingTypesEntity.setId(type);
		return postingsJpaRepository.findByParentIdAndPostingTypes(parentId, postingTypesEntity);
	}
}
