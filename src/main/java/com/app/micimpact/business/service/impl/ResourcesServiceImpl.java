
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

import com.app.micimpact.bean.Resources;
import com.app.micimpact.bean.jpa.ResourcesEntity;
import com.app.micimpact.business.service.ResourcesService;
import com.app.micimpact.business.service.mapping.ResourcesServiceMapper;
import com.app.micimpact.data.repository.jpa.LocalesJpaRepository;
import com.app.micimpact.data.repository.jpa.ResourcesJpaRepository;
import com.app.micimpact.web.common.BasicEnvironment;

/**
 * Implementation of ResourcesService
 */
@Component
@Transactional
public class ResourcesServiceImpl implements ResourcesService {

	@Resource
	private ResourcesJpaRepository resourcesJpaRepository;

	@Resource
	private ResourcesServiceMapper resourcesServiceMapper;
	
	@Resource
	private LocalesJpaRepository localseJpaRepository;
	
	@Override
	public Resources findById(Integer id) {
		ResourcesEntity resourcesEntity = resourcesJpaRepository.findOne(id);
		return resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntity);
	}

	@Override
	public List<Resources> findAll() {
		Iterable<ResourcesEntity> entities = resourcesJpaRepository.findAll();
		List<Resources> beans = new ArrayList<Resources>();
		for(ResourcesEntity resourcesEntity : entities) {
			beans.add(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntity));
		}
		return beans;
	}

	@Override
	public Resources save(Resources resources) {
		return update(resources) ;
	}

	@Override
	public Resources create(Resources resources) {
		ResourcesEntity resourcesEntity;
		if(resources.getId() != null){
			resourcesEntity = resourcesJpaRepository.findOne(resources.getId());
			if( resourcesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		resourcesEntity = new ResourcesEntity();
		resourcesServiceMapper.mapResourcesToResourcesEntity(resources, resourcesEntity);
		ResourcesEntity resourcesEntitySaved = resourcesJpaRepository.save(resourcesEntity);
		return resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntitySaved);
	}

	@Override
	public Resources update(Resources resources) {
		ResourcesEntity resourcesEntity = resourcesJpaRepository.findOne(resources.getId());
		resourcesServiceMapper.mapResourcesToResourcesEntity(resources, resourcesEntity);
		ResourcesEntity resourcesEntitySaved = resourcesJpaRepository.save(resourcesEntity);
		return resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		resourcesJpaRepository.delete(id);
	}

	public ResourcesJpaRepository getResourcesJpaRepository() {
		return resourcesJpaRepository;
	}

	public void setResourcesJpaRepository(ResourcesJpaRepository resourcesJpaRepository) {
		this.resourcesJpaRepository = resourcesJpaRepository;
	}

	public ResourcesServiceMapper getResourcesServiceMapper() {
		return resourcesServiceMapper;
	}

	public void setResourcesServiceMapper(ResourcesServiceMapper resourcesServiceMapper) {
		this.resourcesServiceMapper = resourcesServiceMapper;
	}

	@Override
	public List<Resources> findByDomainLikeAndLocale(String strDomain, String strLoacle) {
		// TODO Auto-generated method stub
		String strKeyword = "%"+strDomain+"%";
		
		Iterable<ResourcesEntity> entities = resourcesJpaRepository.findByDomainLikeAndLocale(strKeyword, strLoacle);
		
		List<Resources> beansResources = new ArrayList<Resources>();
		
		for (ResourcesEntity resourceEntity : entities)
		{
			Resources resource = resourcesServiceMapper.mapResourcesEntityToResources(resourceEntity);
			beansResources.add(resource);
		}
		
		return beansResources;
	}

	@Override
	public List<Resources> findByDomainLike(String domain) {
		String strKeyword = "%"+domain+"%";
		
		Iterable<ResourcesEntity> entities = resourcesJpaRepository.findByDomainLike(strKeyword);
		
		List<Resources> beansResources = new ArrayList<Resources>();
		
		for (ResourcesEntity resourceEntity : entities)
		{
			Resources resource = resourcesServiceMapper.mapResourcesEntityToResources(resourceEntity);
			beansResources.add(resource);
		}
		
		return beansResources;
	}

	@Override
	public Page<ResourcesEntity> findAll(Integer pageNumber) {
		// TODO Auto-generated method stub
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		return resourcesJpaRepository.findAll(request);
	}

	@Override
	public Page<ResourcesEntity> findSearchAll(Integer pageNumber,
			Integer option, String keyword) {
		// TODO Auto-generated method stub
		String value = "%"+keyword+"%";//검색 조건
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));

		switch (option) {
			case 1:
				return resourcesJpaRepository.findByDomainLike(request ,value);
			case 2:
				return resourcesJpaRepository.findByLogicalValueLike(request ,value);
			case 3:
				return resourcesJpaRepository.findByValueLike(request ,value);
		}
		
		return null;
	}

}
