/*
 * Created on 9 12월 2015 ( Time 17:41:09 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;

import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Categories;
import com.app.micimpact.bean.jpa.CategoriesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class CategoriesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public CategoriesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'CategoriesEntity' to 'Categories'
	 * @param categoriesEntity
	 */
	public Categories mapCategoriesEntityToCategories(CategoriesEntity categoriesEntity) {
		if(categoriesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Categories categories = map(categoriesEntity, Categories.class);

		return categories;
	}
	
	/**
	 * Mapping from 'Categories' to 'CategoriesEntity'
	 * @param categories
	 * @param categoriesEntity
	 */
	public void mapCategoriesToCategoriesEntity(Categories categories, CategoriesEntity categoriesEntity) {
		if(categories == null) {
			return;
		}

		//--- Generic mapping 
		map(categories, categoriesEntity);

	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	protected ModelMapper getModelMapper() {
		return modelMapper;
	}

	protected void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

}