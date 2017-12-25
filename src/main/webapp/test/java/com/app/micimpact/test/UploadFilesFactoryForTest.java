package com.app.micimpact.test;

import com.app.micimpact.bean.UploadFiles;

public class UploadFilesFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public UploadFiles newUploadFiles() {

		Integer id = mockValues.nextInteger();

		UploadFiles uploadFiles = new UploadFiles();
		uploadFiles.setId(id);
		return uploadFiles;
	}
	
}
