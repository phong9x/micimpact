package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.PostingsEntity;

public class PostingsEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public PostingsEntity newPostingsEntity() {

		Integer id = mockValues.nextInteger();

		PostingsEntity postingsEntity = new PostingsEntity();
		postingsEntity.setId(id);
		return postingsEntity;
	}
	
}
