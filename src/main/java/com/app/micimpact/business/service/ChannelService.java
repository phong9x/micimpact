/*
 * Created on 11 Mar 2016 ( Time 15:21:06 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.app.micimpact.bean.Channel;
import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.ChannelEntity;

/**
 * Business Service Interface for entity Channel.
 */
public interface ChannelService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Channel findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Channel> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Channel save(Channel entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Channel update(Channel entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Channel create(Channel entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Page<ChannelEntity> findAll(Integer pageNumber);
	Page<ChannelEntity> findAllByIsShow(Integer pageNumber,Integer is_show);
	
	List<ChannelEntity> findByUserId(Integer user_id);
	
	List<ChannelEntity> findAllEntity();
	
	ChannelEntity findOne(Integer id);
	
	Page<ChannelEntity> getBy_UserId(Integer user_id,Integer page,Integer size);
	
	Page<ChannelEntity> findChannelByType(Integer type,Integer page,Integer size);
	
	List<ChannelEntity>    findChannelLike( Integer user_id, Integer page, Integer size);
	
	Integer    totalPage_findChannelLike( Integer user_id);
}