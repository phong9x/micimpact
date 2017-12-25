
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.app.micimpact.bean.PostingTypes;
import com.app.micimpact.bean.jpa.PostingTypesEntity;
import java.util.List;
import com.app.micimpact.business.service.PostingTypesService;
import com.app.micimpact.business.service.mapping.PostingTypesServiceMapper;
import com.app.micimpact.data.repository.jpa.PostingTypesJpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of PostingTypesService
 */
@Component
@Transactional
public class PostingTypesServiceImpl implements PostingTypesService {

	@Resource
	private PostingTypesJpaRepository postingTypesJpaRepository;

	@Resource
	private PostingTypesServiceMapper postingTypesServiceMapper;
	
	@Override
	public PostingTypes findById(Integer id) {
		PostingTypesEntity postingTypesEntity = postingTypesJpaRepository.findOne(id);
		return postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntity);
	}

	@Override
	public List<PostingTypes> findAll() {
		Iterable<PostingTypesEntity> entities = postingTypesJpaRepository.findAll();
		List<PostingTypes> beans = new ArrayList<PostingTypes>();
		for(PostingTypesEntity postingTypesEntity : entities) {
			beans.add(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntity));
		}
		return beans;
	}

	@Override
	public PostingTypes save(PostingTypes postingTypes) {
		return update(postingTypes) ;
	}

	@Override
	public PostingTypes create(PostingTypes postingTypes) {
		PostingTypesEntity postingTypesEntity;
		if(postingTypes.getId() != null){
			postingTypesEntity = postingTypesJpaRepository.findOne(postingTypes.getId());
			if( postingTypesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		postingTypesEntity = new PostingTypesEntity();
		postingTypesServiceMapper.mapPostingTypesToPostingTypesEntity(postingTypes, postingTypesEntity);
		PostingTypesEntity postingTypesEntitySaved = postingTypesJpaRepository.save(postingTypesEntity);
		return postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntitySaved);
	}

	@Override
	public PostingTypes update(PostingTypes postingTypes) {
		PostingTypesEntity postingTypesEntity = postingTypesJpaRepository.findOne(postingTypes.getId());
		postingTypesServiceMapper.mapPostingTypesToPostingTypesEntity(postingTypes, postingTypesEntity);
		PostingTypesEntity postingTypesEntitySaved = postingTypesJpaRepository.save(postingTypesEntity);
		return postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		postingTypesJpaRepository.delete(id);
	}

	public PostingTypesJpaRepository getPostingTypesJpaRepository() {
		return postingTypesJpaRepository;
	}

	public void setPostingTypesJpaRepository(PostingTypesJpaRepository postingTypesJpaRepository) {
		this.postingTypesJpaRepository = postingTypesJpaRepository;
	}

	public PostingTypesServiceMapper getPostingTypesServiceMapper() {
		return postingTypesServiceMapper;
	}

	public void setPostingTypesServiceMapper(PostingTypesServiceMapper postingTypesServiceMapper) {
		this.postingTypesServiceMapper = postingTypesServiceMapper;
	}

}
