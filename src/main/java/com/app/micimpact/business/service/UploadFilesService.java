
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.jpa.UploadFilesEntity;

/**
 * Business Service Interface for entity UploadFiles.
 */
public interface UploadFilesService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	UploadFiles findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<UploadFiles> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	UploadFiles save(UploadFiles entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	UploadFiles update(UploadFiles entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	UploadFiles create(UploadFiles entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	List<UploadFiles> findByDomainLike(String domain);
	List<UploadFiles> findByOwnerAndDomain(Integer owner, String domain);
	List<UploadFiles> findByIdIn(List<Integer> ids);
	void deleteIn(List<Integer> ids);
	
	Page<UploadFilesEntity> findAll(Integer pageNumber);
	Page<UploadFilesEntity> findSearchAll(Integer pageNumber, Integer option, String keyword);
}
