package com.app.micimpact.test;

import com.app.micimpact.bean.jpa.PostingTypesEntity;

public class PostingTypesEntityFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public PostingTypesEntity newPostingTypesEntity() {

		Integer id = mockValues.nextInteger();

		PostingTypesEntity postingTypesEntity = new PostingTypesEntity();
		postingTypesEntity.setId(id);
		return postingTypesEntity;
	}
	
}
