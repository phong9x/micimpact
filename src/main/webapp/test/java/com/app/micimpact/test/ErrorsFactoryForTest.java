package com.app.micimpact.test;

import com.app.micimpact.bean.Errors;

public class ErrorsFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public Errors newErrors() {

		Integer id = mockValues.nextInteger();

		Errors errors = new Errors();
		errors.setId(id);
		return errors;
	}
	
}
