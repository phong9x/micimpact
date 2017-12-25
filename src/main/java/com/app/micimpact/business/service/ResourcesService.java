
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.app.micimpact.bean.Resources;
import com.app.micimpact.bean.jpa.ResourcesEntity;

/**
 * Business Service Interface for entity Resources.
 */
public interface ResourcesService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Resources findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Resources> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Resources save(Resources entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Resources update(Resources entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Resources create(Resources entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	List<Resources> findByDomainLikeAndLocale(String strDomain, String strLocale);
	List<Resources> findByDomainLike(String domain);
	
	Page<ResourcesEntity> findAll(Integer pageNumber);
	Page<ResourcesEntity> findSearchAll(Integer pageNumber, Integer option, String keyword);
}
