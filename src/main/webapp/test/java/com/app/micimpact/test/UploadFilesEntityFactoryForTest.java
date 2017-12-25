package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.UploadFilesEntity;

public class UploadFilesEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public UploadFilesEntity newUploadFilesEntity() {

		Integer id = mockValues.nextInteger();

		UploadFilesEntity uploadFilesEntity = new UploadFilesEntity();
		uploadFilesEntity.setId(id);
		return uploadFilesEntity;
	}
	
}
