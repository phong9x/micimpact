package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Errors;
import com.app.micimpact.bean.jpa.ErrorsEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class ErrorsServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public ErrorsServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'ErrorsEntity' to 'Errors'
	 * @param errorsEntity
	 */
	public Errors mapErrorsEntityToErrors(ErrorsEntity errorsEntity) {
		if(errorsEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Errors errors = map(errorsEntity, Errors.class);

		return errors;
	}
	
	/**
	 * Mapping from 'Errors' to 'ErrorsEntity'
	 * @param errors
	 * @param errorsEntity
	 */
	public void mapErrorsToErrorsEntity(Errors errors, ErrorsEntity errorsEntity) {
		if(errors == null) {
			return;
		}

		//--- Generic mapping 
		map(errors, errorsEntity);

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
