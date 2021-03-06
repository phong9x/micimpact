/*
 * Created on 11 Apr 2016 ( Time 11:30:53 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service;

import java.util.Date;
import java.util.List;

import com.app.micimpact.bean.Stats;

/**
 * Business Service Interface for entity Stats.
 */
public interface StatsService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Stats findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Stats> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Stats save(Stats entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Stats update(Stats entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Stats create(Stats entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Integer total_statsCard(Integer type);
	
	Integer statsCard_ByDate(Integer type,Date date);
	
	Integer statsCard_ByWeek(Integer type, Date start, Date end);
	
	Integer statsCard_ByMonth(Integer type, Integer month, Integer year);

}
