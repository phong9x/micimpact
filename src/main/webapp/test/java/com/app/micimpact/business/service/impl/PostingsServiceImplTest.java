package com.app.micimpact.business.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import com.app.micimpact.bean.Postings;
import com.app.micimpact.bean.jpa.PostingsEntity;
import java.util.Date;
import com.app.micimpact.business.service.mapping.PostingsServiceMapper;
import com.app.micimpact.data.repository.jpa.PostingsJpaRepository;
import com.app.micimpact.test.PostingsFactoryForTest;
import com.app.micimpact.test.PostingsEntityFactoryForTest;
import com.app.micimpact.test.MockValues;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Test : Implementation of PostingsService
 */
@RunWith(MockitoJUnitRunner.class)
public class PostingsServiceImplTest {

	@InjectMocks
	private PostingsServiceImpl postingsService;
	@Mock
	private PostingsJpaRepository postingsJpaRepository;
	@Mock
	private PostingsServiceMapper postingsServiceMapper;
	
	private PostingsFactoryForTest postingsFactoryForTest = new PostingsFactoryForTest();

	private PostingsEntityFactoryForTest postingsEntityFactoryForTest = new PostingsEntityFactoryForTest();

	private MockValues mockValues = new MockValues();
	
	@Test
	public void findById() {
		// Given
		Integer id = mockValues.nextInteger();
		
		PostingsEntity postingsEntity = postingsJpaRepository.findOne(id);
		
		Postings postings = postingsFactoryForTest.newPostings();
		when(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntity)).thenReturn(postings);

		// When
		Postings postingsFound = postingsService.findById(id);

		// Then
		assertEquals(postings.getId(),postingsFound.getId());
	}

	@Test
	public void findAll() {
		// Given
		List<PostingsEntity> postingsEntitys = new ArrayList<PostingsEntity>();
		PostingsEntity postingsEntity1 = postingsEntityFactoryForTest.newPostingsEntity();
		postingsEntitys.add(postingsEntity1);
		PostingsEntity postingsEntity2 = postingsEntityFactoryForTest.newPostingsEntity();
		postingsEntitys.add(postingsEntity2);
		when(postingsJpaRepository.findAll()).thenReturn(postingsEntitys);
		
		Postings postings1 = postingsFactoryForTest.newPostings();
		when(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntity1)).thenReturn(postings1);
		Postings postings2 = postingsFactoryForTest.newPostings();
		when(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntity2)).thenReturn(postings2);

		// When
		List<Postings> postingssFounds = postingsService.findAll();

		// Then
		assertTrue(postings1 == postingssFounds.get(0));
		assertTrue(postings2 == postingssFounds.get(1));
	}

	@Test
	public void create() {
		// Given
		Postings postings = postingsFactoryForTest.newPostings();

		PostingsEntity postingsEntity = postingsEntityFactoryForTest.newPostingsEntity();
		when(postingsJpaRepository.findOne(postings.getId())).thenReturn(null);
		
		postingsEntity = new PostingsEntity();
		postingsServiceMapper.mapPostingsToPostingsEntity(postings, postingsEntity);
		PostingsEntity postingsEntitySaved = postingsJpaRepository.save(postingsEntity);
		
		Postings postingsSaved = postingsFactoryForTest.newPostings();
		when(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntitySaved)).thenReturn(postingsSaved);

		// When
		Postings postingsResult = postingsService.create(postings);

		// Then
		assertTrue(postingsResult == postingsSaved);
	}

	@Test
	public void createKOExists() {
		// Given
		Postings postings = postingsFactoryForTest.newPostings();

		PostingsEntity postingsEntity = postingsEntityFactoryForTest.newPostingsEntity();
		when(postingsJpaRepository.findOne(postings.getId())).thenReturn(postingsEntity);

		// When
		Exception exception = null;
		try {
			postingsService.create(postings);
		} catch(Exception e) {
			exception = e;
		}

		// Then
		assertTrue(exception instanceof IllegalStateException);
		assertEquals("already.exists", exception.getMessage());
	}

	@Test
	public void update() {
		// Given
		Postings postings = postingsFactoryForTest.newPostings();

		PostingsEntity postingsEntity = postingsEntityFactoryForTest.newPostingsEntity();
		when(postingsJpaRepository.findOne(postings.getId())).thenReturn(postingsEntity);
		
		PostingsEntity postingsEntitySaved = postingsEntityFactoryForTest.newPostingsEntity();
		when(postingsJpaRepository.save(postingsEntity)).thenReturn(postingsEntitySaved);
		
		Postings postingsSaved = postingsFactoryForTest.newPostings();
		when(postingsServiceMapper.mapPostingsEntityToPostings(postingsEntitySaved)).thenReturn(postingsSaved);

		// When
		Postings postingsResult = postingsService.update(postings);

		// Then
		verify(postingsServiceMapper).mapPostingsToPostingsEntity(postings, postingsEntity);
		assertTrue(postingsResult == postingsSaved);
	}

	@Test
	public void delete() {
		// Given
		Integer id = mockValues.nextInteger();

		// When
		postingsService.delete(id);

		// Then
		verify(postingsJpaRepository).delete(id);
		
	}

}
