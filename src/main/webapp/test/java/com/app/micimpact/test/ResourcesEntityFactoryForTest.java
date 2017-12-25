package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.ResourcesEntity;

public class ResourcesEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public ResourcesEntity newResourcesEntity() {

		Integer id = mockValues.nextInteger();

		ResourcesEntity resourcesEntity = new ResourcesEntity();
		resourcesEntity.setId(id);
		return resourcesEntity;
	}
	
}
