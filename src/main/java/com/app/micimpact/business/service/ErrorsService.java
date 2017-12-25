
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.app.micimpact.bean.Errors;
import com.app.micimpact.bean.jpa.ErrorsEntity;

/**
 * Business Service Interface for entity Errors.
 */
public interface ErrorsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Errors findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Errors> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Errors save(Errors entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Errors update(Errors entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Errors create(Errors entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	Page<ErrorsEntity> findAll(Integer pageNumber);
	Page<ErrorsEntity> findSearchAll(Integer pageNumber, Integer option, String keyword);
}
