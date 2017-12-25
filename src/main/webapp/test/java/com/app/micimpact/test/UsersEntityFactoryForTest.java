package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.UsersEntity;

public class UsersEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public UsersEntity newUsersEntity() {

		Integer id = mockValues.nextInteger();

		UsersEntity usersEntity = new UsersEntity();
		usersEntity.setId(id);
		return usersEntity;
	}
	
}
