package com.app.micimpact.test;

import com.app.micimpact.bean.UserRoles;

public class UserRolesFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public UserRoles newUserRoles() {

		Integer id = mockValues.nextInteger();

		UserRoles userRoles = new UserRoles();
		userRoles.setId(id);
		return userRoles;
	}
	
}
