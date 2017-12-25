/*
 * Created on 9 12월 2015 ( Time 17:41:16 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.app.micimpact.bean.Comments;
import com.app.micimpact.bean.PageComment;
import com.app.micimpact.bean.jpa.CommentsEntity;

/**
 * Business Service Interface for entity Comments.
 */
public interface CommentsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Comments findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Comments> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Comments save(Comments entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Comments update(Comments entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Comments create(Comments entity);
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	List<Comments>    findByCardId(Integer userId, Integer cardId, Integer lastId, int count);
	List<Comments>    findByCardId(Integer userId, Integer cardId, int count);
	List<Comments>    findByCardId(Integer cardId, int count);
	Page<CommentsEntity> getBy_UserId(Integer cardId,Integer page, Integer size , String order);
	PageComment    findComment( Integer comment_id, Integer page, Integer size);
	Page<CommentsEntity> findAllReport(Integer page, Integer size);
}