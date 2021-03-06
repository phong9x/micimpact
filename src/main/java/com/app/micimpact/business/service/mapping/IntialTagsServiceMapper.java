/*
 * Created on 21 12월 2015 ( Time 20:20:27 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.IntialTags;
import com.app.micimpact.bean.jpa.IntialTagsEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class IntialTagsServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public IntialTagsServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'IntialTagsEntity' to 'IntialTags'
	 * @param intialTagsEntity
	 */
	public IntialTags mapIntialTagsEntityToIntialTags(IntialTagsEntity intialTagsEntity) {
		if(intialTagsEntity == null) {
			return null;
		}

		//--- Generic mapping 
		IntialTags intialTags = map(intialTagsEntity, IntialTags.class);

		return intialTags;
	}
	
	/**
	 * Mapping from 'IntialTags' to 'IntialTagsEntity'
	 * @param intialTags
	 * @param intialTagsEntity
	 */
	public void mapIntialTagsToIntialTagsEntity(IntialTags intialTags, IntialTagsEntity intialTagsEntity) {
		if(intialTags == null) {
			return;
		}

		//--- Generic mapping 
		map(intialTags, intialTagsEntity);

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