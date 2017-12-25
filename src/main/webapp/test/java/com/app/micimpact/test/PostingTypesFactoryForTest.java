package com.app.micimpact.test;

import com.app.micimpact.bean.PostingTypes;

public class PostingTypesFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public PostingTypes newPostingTypes() {

		Integer id = mockValues.nextInteger();

		PostingTypes postingTypes = new PostingTypes();
		postingTypes.setId(id);
		return postingTypes;
	}
	
}
