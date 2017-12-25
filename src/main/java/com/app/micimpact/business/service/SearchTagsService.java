/*
 * Created on 21 12월 2015 ( Time 20:29:14 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import com.app.micimpact.bean.SearchTags;

/**
 * Business Service Interface for entity SearchTags.
 */
public interface SearchTagsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	SearchTags findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<SearchTags> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	SearchTags save(SearchTags entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	SearchTags update(SearchTags entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	SearchTags create(SearchTags entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );


}