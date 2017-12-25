package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.UserRolesEntity;

public class UserRolesEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public UserRolesEntity newUserRolesEntity() {

		Integer id = mockValues.nextInteger();

		UserRolesEntity userRolesEntity = new UserRolesEntity();
		userRolesEntity.setId(id);
		return userRolesEntity;
	}
	
}
