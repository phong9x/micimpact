/*
 * Created on 20 5�� 2015 ( Time 17:27:55 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.app.micimpact.bean.Popups;
import com.app.micimpact.bean.jpa.PopupsEntity;

/**
 * Business Service Interface for entity Popups.
 */
public interface PopupsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Popups findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Popups> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Popups save(Popups entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Popups update(Popups entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Popups create(Popups entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Page<PopupsEntity> findAll(Integer pageNumber);
	Page<PopupsEntity> findSearchAll(Integer pageNumber, Integer option, String keyword);
}
