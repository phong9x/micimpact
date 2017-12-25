package com.app.micimpact.test;

import com.app.micimpact.bean.Users;

public class UsersFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public Users newUsers() {

		Integer id = mockValues.nextInteger();

		Users users = new Users();
		users.setId(id);
		return users;
	}
	
}
