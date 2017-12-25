package com.app.micimpact.test;

import com.app.micimpact.bean.Resources;

public class ResourcesFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public Resources newResources() {

		Integer id = mockValues.nextInteger();

		Resources resources = new Resources();
		resources.setId(id);
		return resources;
	}
	
}
