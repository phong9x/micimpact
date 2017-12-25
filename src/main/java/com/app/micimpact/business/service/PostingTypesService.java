
package com.app.micimpact.business.service;

import java.util.List;

import com.app.micimpact.bean.PostingTypes;

/**
 * Business Service Interface for entity PostingTypes.
 */
public interface PostingTypesService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	PostingTypes findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<PostingTypes> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	PostingTypes save(PostingTypes entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	PostingTypes update(PostingTypes entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	PostingTypes create(PostingTypes entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );


}
