package com.app.micimpact.data.repository.jpa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.IntialTagsEntity;
import com.app.micimpact.bean.jpa.TagsEntity;

/**
 * Repository : Cards.
 */ 
public interface IntialTagsJpaRepository extends PagingAndSortingRepository<IntialTagsEntity, Integer> {
	Page<IntialTagsEntity> findAll(Pageable page);
}
