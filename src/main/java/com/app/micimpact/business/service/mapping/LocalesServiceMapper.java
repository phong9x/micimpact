/*
 * Created on 13 5�� 2015 ( Time 19:15:54 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Locales;
import com.app.micimpact.bean.jpa.LocalesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class LocalesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public LocalesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'LocalesEntity' to 'Locales'
	 * @param localesEntity
	 */
	public Locales mapLocalesEntityToLocales(LocalesEntity localesEntity) {
		if(localesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Locales locales = map(localesEntity, Locales.class);

		return locales;
	}
	
	/**
	 * Mapping from 'Locales' to 'LocalesEntity'
	 * @param locales
	 * @param localesEntity
	 */
	public void mapLocalesToLocalesEntity(Locales locales, LocalesEntity localesEntity) {
		if(locales == null) {
			return;
		}

		//--- Generic mapping 
		map(locales, localesEntity);

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