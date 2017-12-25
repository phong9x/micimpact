/*
 * Created on 21 12월 2015 ( Time 20:29:14 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import com.app.micimpact.bean.ListCards;

/**
 * Business Service Interface for entity ListCards.
 */
public interface ListCardsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	ListCards findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<ListCards> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	ListCards save(ListCards entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	ListCards update(ListCards entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	ListCards create(ListCards entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );


}
