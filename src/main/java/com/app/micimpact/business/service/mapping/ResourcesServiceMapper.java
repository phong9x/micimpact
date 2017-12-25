package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Resources;
import com.app.micimpact.bean.jpa.ResourcesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class ResourcesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public ResourcesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'ResourcesEntity' to 'Resources'
	 * @param resourcesEntity
	 */
	public Resources mapResourcesEntityToResources(ResourcesEntity resourcesEntity) {
		if(resourcesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Resources resources = map(resourcesEntity, Resources.class);

		return resources;
	}
	
	/**
	 * Mapping from 'Resources' to 'ResourcesEntity'
	 * @param resources
	 * @param resourcesEntity
	 */
	public void mapResourcesToResourcesEntity(Resources resources, ResourcesEntity resourcesEntity) {
		if(resources == null) {
			return;
		}

		//--- Generic mapping 
		map(resources, resourcesEntity);

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
