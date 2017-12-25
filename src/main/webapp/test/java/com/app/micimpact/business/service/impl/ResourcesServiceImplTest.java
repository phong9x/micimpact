package com.app.micimpact.business.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import com.app.micimpact.bean.Resources;
import com.app.micimpact.bean.jpa.ResourcesEntity;
import com.app.micimpact.business.service.mapping.ResourcesServiceMapper;
import com.app.micimpact.data.repository.jpa.ResourcesJpaRepository;
import com.app.micimpact.test.ResourcesFactoryForTest;
import com.app.micimpact.test.ResourcesEntityFactoryForTest;
import com.app.micimpact.test.MockValues;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Test : Implementation of ResourcesService
 */
@RunWith(MockitoJUnitRunner.class)
public class ResourcesServiceImplTest {

	@InjectMocks
	private ResourcesServiceImpl resourcesService;
	@Mock
	private ResourcesJpaRepository resourcesJpaRepository;
	@Mock
	private ResourcesServiceMapper resourcesServiceMapper;
	
	private ResourcesFactoryForTest resourcesFactoryForTest = new ResourcesFactoryForTest();

	private ResourcesEntityFactoryForTest resourcesEntityFactoryForTest = new ResourcesEntityFactoryForTest();

	private MockValues mockValues = new MockValues();
	
	@Test
	public void findById() {
		// Given
		Integer id = mockValues.nextInteger();
		
		ResourcesEntity resourcesEntity = resourcesJpaRepository.findOne(id);
		
		Resources resources = resourcesFactoryForTest.newResources();
		when(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntity)).thenReturn(resources);

		// When
		Resources resourcesFound = resourcesService.findById(id);

		// Then
		assertEquals(resources.getId(),resourcesFound.getId());
	}

	@Test
	public void findAll() {
		// Given
		List<ResourcesEntity> resourcesEntitys = new ArrayList<ResourcesEntity>();
		ResourcesEntity resourcesEntity1 = resourcesEntityFactoryForTest.newResourcesEntity();
		resourcesEntitys.add(resourcesEntity1);
		ResourcesEntity resourcesEntity2 = resourcesEntityFactoryForTest.newResourcesEntity();
		resourcesEntitys.add(resourcesEntity2);
		when(resourcesJpaRepository.findAll()).thenReturn(resourcesEntitys);
		
		Resources resources1 = resourcesFactoryForTest.newResources();
		when(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntity1)).thenReturn(resources1);
		Resources resources2 = resourcesFactoryForTest.newResources();
		when(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntity2)).thenReturn(resources2);

		// When
		List<Resources> resourcessFounds = resourcesService.findAll();

		// Then
		assertTrue(resources1 == resourcessFounds.get(0));
		assertTrue(resources2 == resourcessFounds.get(1));
	}

	@Test
	public void create() {
		// Given
		Resources resources = resourcesFactoryForTest.newResources();

		ResourcesEntity resourcesEntity = resourcesEntityFactoryForTest.newResourcesEntity();
		when(resourcesJpaRepository.findOne(resources.getId())).thenReturn(null);
		
		resourcesEntity = new ResourcesEntity();
		resourcesServiceMapper.mapResourcesToResourcesEntity(resources, resourcesEntity);
		ResourcesEntity resourcesEntitySaved = resourcesJpaRepository.save(resourcesEntity);
		
		Resources resourcesSaved = resourcesFactoryForTest.newResources();
		when(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntitySaved)).thenReturn(resourcesSaved);

		// When
		Resources resourcesResult = resourcesService.create(resources);

		// Then
		assertTrue(resourcesResult == resourcesSaved);
	}

	@Test
	public void createKOExists() {
		// Given
		Resources resources = resourcesFactoryForTest.newResources();

		ResourcesEntity resourcesEntity = resourcesEntityFactoryForTest.newResourcesEntity();
		when(resourcesJpaRepository.findOne(resources.getId())).thenReturn(resourcesEntity);

		// When
		Exception exception = null;
		try {
			resourcesService.create(resources);
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
		Resources resources = resourcesFactoryForTest.newResources();

		ResourcesEntity resourcesEntity = resourcesEntityFactoryForTest.newResourcesEntity();
		when(resourcesJpaRepository.findOne(resources.getId())).thenReturn(resourcesEntity);
		
		ResourcesEntity resourcesEntitySaved = resourcesEntityFactoryForTest.newResourcesEntity();
		when(resourcesJpaRepository.save(resourcesEntity)).thenReturn(resourcesEntitySaved);
		
		Resources resourcesSaved = resourcesFactoryForTest.newResources();
		when(resourcesServiceMapper.mapResourcesEntityToResources(resourcesEntitySaved)).thenReturn(resourcesSaved);

		// When
		Resources resourcesResult = resourcesService.update(resources);

		// Then
		verify(resourcesServiceMapper).mapResourcesToResourcesEntity(resources, resourcesEntity);
		assertTrue(resourcesResult == resourcesSaved);
	}

	@Test
	public void delete() {
		// Given
		Integer id = mockValues.nextInteger();

		// When
		resourcesService.delete(id);

		// Then
		verify(resourcesJpaRepository).delete(id);
		
	}

}
