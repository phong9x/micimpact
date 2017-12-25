/*
 * Created on 9 12월 2015 ( Time 17:50:53 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.app.micimpact.bean.Tags;
import com.app.micimpact.bean.jpa.TagsEntity;

/**
 * Business Service Interface for entity Tags.
 */
public interface TagsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param name
	 * @return entity
	 */
	Tags findById( String name  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Tags> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Tags save(Tags entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Tags update(Tags entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Tags create(Tags entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param name
	 */
	void delete( String name );

	Page<TagsEntity> findAll(Integer page, Integer size);

}