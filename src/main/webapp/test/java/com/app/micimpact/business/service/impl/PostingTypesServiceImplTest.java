package com.app.micimpact.business.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import com.app.micimpact.bean.PostingTypes;
import com.app.micimpact.bean.jpa.PostingTypesEntity;
import java.util.List;
import com.app.micimpact.business.service.mapping.PostingTypesServiceMapper;
import com.app.micimpact.data.repository.jpa.PostingTypesJpaRepository;
import com.app.micimpact.test.PostingTypesFactoryForTest;
import com.app.micimpact.test.PostingTypesEntityFactoryForTest;
import com.app.micimpact.test.MockValues;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Test : Implementation of PostingTypesService
 */
@RunWith(MockitoJUnitRunner.class)
public class PostingTypesServiceImplTest {

	@InjectMocks
	private PostingTypesServiceImpl postingTypesService;
	@Mock
	private PostingTypesJpaRepository postingTypesJpaRepository;
	@Mock
	private PostingTypesServiceMapper postingTypesServiceMapper;
	
	private PostingTypesFactoryForTest postingTypesFactoryForTest = new PostingTypesFactoryForTest();

	private PostingTypesEntityFactoryForTest postingTypesEntityFactoryForTest = new PostingTypesEntityFactoryForTest();

	private MockValues mockValues = new MockValues();
	
	@Test
	public void findById() {
		// Given
		Integer id = mockValues.nextInteger();
		
		PostingTypesEntity postingTypesEntity = postingTypesJpaRepository.findOne(id);
		
		PostingTypes postingTypes = postingTypesFactoryForTest.newPostingTypes();
		when(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntity)).thenReturn(postingTypes);

		// When
		PostingTypes postingTypesFound = postingTypesService.findById(id);

		// Then
		assertEquals(postingTypes.getId(),postingTypesFound.getId());
	}

	@Test
	public void findAll() {
		// Given
		List<PostingTypesEntity> postingTypesEntitys = new ArrayList<PostingTypesEntity>();
		PostingTypesEntity postingTypesEntity1 = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		postingTypesEntitys.add(postingTypesEntity1);
		PostingTypesEntity postingTypesEntity2 = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		postingTypesEntitys.add(postingTypesEntity2);
		when(postingTypesJpaRepository.findAll()).thenReturn(postingTypesEntitys);
		
		PostingTypes postingTypes1 = postingTypesFactoryForTest.newPostingTypes();
		when(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntity1)).thenReturn(postingTypes1);
		PostingTypes postingTypes2 = postingTypesFactoryForTest.newPostingTypes();
		when(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntity2)).thenReturn(postingTypes2);

		// When
		List<PostingTypes> postingTypessFounds = postingTypesService.findAll();

		// Then
		assertTrue(postingTypes1 == postingTypessFounds.get(0));
		assertTrue(postingTypes2 == postingTypessFounds.get(1));
	}

	@Test
	public void create() {
		// Given
		PostingTypes postingTypes = postingTypesFactoryForTest.newPostingTypes();

		PostingTypesEntity postingTypesEntity = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		when(postingTypesJpaRepository.findOne(postingTypes.getId())).thenReturn(null);
		
		postingTypesEntity = new PostingTypesEntity();
		postingTypesServiceMapper.mapPostingTypesToPostingTypesEntity(postingTypes, postingTypesEntity);
		PostingTypesEntity postingTypesEntitySaved = postingTypesJpaRepository.save(postingTypesEntity);
		
		PostingTypes postingTypesSaved = postingTypesFactoryForTest.newPostingTypes();
		when(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntitySaved)).thenReturn(postingTypesSaved);

		// When
		PostingTypes postingTypesResult = postingTypesService.create(postingTypes);

		// Then
		assertTrue(postingTypesResult == postingTypesSaved);
	}

	@Test
	public void createKOExists() {
		// Given
		PostingTypes postingTypes = postingTypesFactoryForTest.newPostingTypes();

		PostingTypesEntity postingTypesEntity = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		when(postingTypesJpaRepository.findOne(postingTypes.getId())).thenReturn(postingTypesEntity);

		// When
		Exception exception = null;
		try {
			postingTypesService.create(postingTypes);
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
		PostingTypes postingTypes = postingTypesFactoryForTest.newPostingTypes();

		PostingTypesEntity postingTypesEntity = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		when(postingTypesJpaRepository.findOne(postingTypes.getId())).thenReturn(postingTypesEntity);
		
		PostingTypesEntity postingTypesEntitySaved = postingTypesEntityFactoryForTest.newPostingTypesEntity();
		when(postingTypesJpaRepository.save(postingTypesEntity)).thenReturn(postingTypesEntitySaved);
		
		PostingTypes postingTypesSaved = postingTypesFactoryForTest.newPostingTypes();
		when(postingTypesServiceMapper.mapPostingTypesEntityToPostingTypes(postingTypesEntitySaved)).thenReturn(postingTypesSaved);

		// When
		PostingTypes postingTypesResult = postingTypesService.update(postingTypes);

		// Then
		verify(postingTypesServiceMapper).mapPostingTypesToPostingTypesEntity(postingTypes, postingTypesEntity);
		assertTrue(postingTypesResult == postingTypesSaved);
	}

	@Test
	public void delete() {
		// Given
		Integer id = mockValues.nextInteger();

		// When
		postingTypesService.delete(id);

		// Then
		verify(postingTypesJpaRepository).delete(id);
		
	}

}
