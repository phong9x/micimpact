package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.UserRoles;
import com.app.micimpact.bean.jpa.UserRolesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class UserRolesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public UserRolesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'UserRolesEntity' to 'UserRoles'
	 * @param userRolesEntity
	 */
	public UserRoles mapUserRolesEntityToUserRoles(UserRolesEntity userRolesEntity) {
		if(userRolesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		UserRoles userRoles = map(userRolesEntity, UserRoles.class);

		return userRoles;
	}
	
	/**
	 * Mapping from 'UserRoles' to 'UserRolesEntity'
	 * @param userRoles
	 * @param userRolesEntity
	 */
	public void mapUserRolesToUserRolesEntity(UserRoles userRoles, UserRolesEntity userRolesEntity) {
		if(userRoles == null) {
			return;
		}

		//--- Generic mapping 
		map(userRoles, userRolesEntity);

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
