package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.ResourcesEntity;

/**
 * Repository : Resources.
 */
public interface ResourcesJpaRepository extends PagingAndSortingRepository<ResourcesEntity, Integer> {
	List<ResourcesEntity> findByDomainLikeAndLocale(String strDomain, String strLocale);
	List<ResourcesEntity> findByDomainLike(String domain);
	
	Page<ResourcesEntity> findAll(Pageable page);
	Page<ResourcesEntity> findByDomainLike(Pageable page, String domain);
	Page<ResourcesEntity> findByLogicalValueLike(Pageable page, String logicalValue);
	Page<ResourcesEntity> findByValueLike(Pageable page, String value);
}
