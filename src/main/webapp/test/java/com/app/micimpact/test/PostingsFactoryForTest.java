package com.app.micimpact.test;

import com.app.micimpact.bean.Postings;

public class PostingsFactoryForTest {

	private MockValues mockValues = new MockValues();
	
	public Postings newPostings() {

		Integer id = mockValues.nextInteger();

		Postings postings = new Postings();
		postings.setId(id);
		return postings;
	}
	
}
