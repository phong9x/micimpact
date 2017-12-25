package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.jpa.UploadFilesEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class UploadFilesServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public UploadFilesServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'UploadFilesEntity' to 'UploadFiles'
	 * @param uploadFilesEntity
	 */
	public UploadFiles mapUploadFilesEntityToUploadFiles(UploadFilesEntity uploadFilesEntity) {
		if(uploadFilesEntity == null) {
			return null;
		}

		//--- Generic mapping 
		UploadFiles uploadFiles = map(uploadFilesEntity, UploadFiles.class);

		return uploadFiles;
	}
	
	/**
	 * Mapping from 'UploadFiles' to 'UploadFilesEntity'
	 * @param uploadFiles
	 * @param uploadFilesEntity
	 */
	public void mapUploadFilesToUploadFilesEntity(UploadFiles uploadFiles, UploadFilesEntity uploadFilesEntity) {
		if(uploadFiles == null) {
			return;
		}

		//--- Generic mapping 
		map(uploadFiles, uploadFilesEntity);

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
