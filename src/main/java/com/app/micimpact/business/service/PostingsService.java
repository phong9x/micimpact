
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.app.micimpact.bean.PostingTypes;
import com.app.micimpact.bean.Postings;
import com.app.micimpact.bean.jpa.PostingsEntity;

/**
 * Business Service Interface for entity Postings.
 */
public interface PostingsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Postings findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Postings> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Postings save(Postings entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Postings update(Postings entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Postings create(Postings entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	Page<PostingsEntity> findAll(Integer pageNumber, List<Integer> arrType);
	Page<PostingsEntity> findAll(Integer pageNumber, int Type);
	List<PostingsEntity> findByParentIdAndPostingTypes(Integer parentId, Integer type);
	List<Postings> findByLastId(Integer lastId, int count);
	List<Postings> findByCount(int count);
}
