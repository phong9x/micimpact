/*
 * Created on 21 12월 2015 ( Time 20:29:14 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import com.app.micimpact.bean.Likes;

/**
 * Business Service Interface for entity Likes.
 */
public interface LikesService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Likes findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Likes> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Likes save(Likes entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Likes update(Likes entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Likes create(Likes entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Likes findByUserIdAndCardId(Integer user_id, Integer card_id);
}