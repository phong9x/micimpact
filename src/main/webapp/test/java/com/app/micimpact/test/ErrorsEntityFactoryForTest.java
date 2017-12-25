package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.ErrorsEntity;

public class ErrorsEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public ErrorsEntity newErrorsEntity() {

		Integer id = mockValues.nextInteger();

		ErrorsEntity errorsEntity = new ErrorsEntity();
		errorsEntity.setId(id);
		return errorsEntity;
	}
	
}
