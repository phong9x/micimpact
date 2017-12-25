/*
 * Created on 9 12월 2015 ( Time 17:43:41 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.app.micimpact.bean.PageReport;
import com.app.micimpact.bean.Report;
import com.app.micimpact.bean.jpa.ReportEntity;

/**
 * Business Service Interface for entity Report.
 */
public interface ReportService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Report findById( Integer id  ) ;

	/**
	 * Loads all entities.
	 * @return all entities
	 */
	List<Report> findAll();

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Report save(Report entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Report update(Report entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Report create(Report entity);

	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Page<ReportEntity> findAll(Integer page, Integer size);
	
	PageReport    findReportComment( Integer page, Integer size);
	
	PageReport    findReportCard( Integer page, Integer size);
}