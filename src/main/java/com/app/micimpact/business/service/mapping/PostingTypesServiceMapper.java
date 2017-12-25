package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.PostingTypes;
import com.app.micimpact.bean.jpa.PostingTypesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class PostingTypesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public PostingTypesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'PostingTypesEntity' to 'PostingTypes'
	 * @param postingTypesEntity
	 */
	public PostingTypes mapPostingTypesEntityToPostingTypes(PostingTypesEntity postingTypesEntity) {
		if(postingTypesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		PostingTypes postingTypes = map(postingTypesEntity, PostingTypes.class);

		return postingTypes;
	}
	
	/**
	 * Mapping from 'PostingTypes' to 'PostingTypesEntity'
	 * @param postingTypes
	 * @param postingTypesEntity
	 */
	public void mapPostingTypesToPostingTypesEntity(PostingTypes postingTypes, PostingTypesEntity postingTypesEntity) {
		if(postingTypes == null) {
			return;
		}

		//--- Generic mapping 
		map(postingTypes, postingTypesEntity);

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
