package com.app.micimpact.business.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.jpa.UploadFilesEntity;
import com.app.micimpact.business.service.mapping.UploadFilesServiceMapper;
import com.app.micimpact.data.repository.jpa.UploadFilesJpaRepository;
import com.app.micimpact.test.UploadFilesFactoryForTest;
import com.app.micimpact.test.UploadFilesEntityFactoryForTest;
import com.app.micimpact.test.MockValues;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Test : Implementation of UploadFilesService
 */
@RunWith(MockitoJUnitRunner.class)
public class UploadFilesServiceImplTest {

	@InjectMocks
	private UploadFilesServiceImpl uploadFilesService;
	@Mock
	private UploadFilesJpaRepository uploadFilesJpaRepository;
	@Mock
	private UploadFilesServiceMapper uploadFilesServiceMapper;
	
	private UploadFilesFactoryForTest uploadFilesFactoryForTest = new UploadFilesFactoryForTest();

	private UploadFilesEntityFactoryForTest uploadFilesEntityFactoryForTest = new UploadFilesEntityFactoryForTest();

	private MockValues mockValues = new MockValues();
	
	@Test
	public void findById() {
		// Given
		Integer id = mockValues.nextInteger();
		
		UploadFilesEntity uploadFilesEntity = uploadFilesJpaRepository.findOne(id);
		
		UploadFiles uploadFiles = uploadFilesFactoryForTest.newUploadFiles();
		when(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity)).thenReturn(uploadFiles);

		// When
		UploadFiles uploadFilesFound = uploadFilesService.findById(id);

		// Then
		assertEquals(uploadFiles.getId(),uploadFilesFound.getId());
	}

	@Test
	public void findAll() {
		// Given
		List<UploadFilesEntity> uploadFilesEntitys = new ArrayList<UploadFilesEntity>();
		UploadFilesEntity uploadFilesEntity1 = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		uploadFilesEntitys.add(uploadFilesEntity1);
		UploadFilesEntity uploadFilesEntity2 = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		uploadFilesEntitys.add(uploadFilesEntity2);
		when(uploadFilesJpaRepository.findAll()).thenReturn(uploadFilesEntitys);
		
		UploadFiles uploadFiles1 = uploadFilesFactoryForTest.newUploadFiles();
		when(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity1)).thenReturn(uploadFiles1);
		UploadFiles uploadFiles2 = uploadFilesFactoryForTest.newUploadFiles();
		when(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity2)).thenReturn(uploadFiles2);

		// When
		List<UploadFiles> uploadFilessFounds = uploadFilesService.findAll();

		// Then
		assertTrue(uploadFiles1 == uploadFilessFounds.get(0));
		assertTrue(uploadFiles2 == uploadFilessFounds.get(1));
	}

	@Test
	public void create() {
		// Given
		UploadFiles uploadFiles = uploadFilesFactoryForTest.newUploadFiles();

		UploadFilesEntity uploadFilesEntity = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		when(uploadFilesJpaRepository.findOne(uploadFiles.getId())).thenReturn(null);
		
		uploadFilesEntity = new UploadFilesEntity();
		uploadFilesServiceMapper.mapUploadFilesToUploadFilesEntity(uploadFiles, uploadFilesEntity);
		UploadFilesEntity uploadFilesEntitySaved = uploadFilesJpaRepository.save(uploadFilesEntity);
		
		UploadFiles uploadFilesSaved = uploadFilesFactoryForTest.newUploadFiles();
		when(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntitySaved)).thenReturn(uploadFilesSaved);

		// When
		UploadFiles uploadFilesResult = uploadFilesService.create(uploadFiles);

		// Then
		assertTrue(uploadFilesResult == uploadFilesSaved);
	}

	@Test
	public void createKOExists() {
		// Given
		UploadFiles uploadFiles = uploadFilesFactoryForTest.newUploadFiles();

		UploadFilesEntity uploadFilesEntity = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		when(uploadFilesJpaRepository.findOne(uploadFiles.getId())).thenReturn(uploadFilesEntity);

		// When
		Exception exception = null;
		try {
			uploadFilesService.create(uploadFiles);
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
		UploadFiles uploadFiles = uploadFilesFactoryForTest.newUploadFiles();

		UploadFilesEntity uploadFilesEntity = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		when(uploadFilesJpaRepository.findOne(uploadFiles.getId())).thenReturn(uploadFilesEntity);
		
		UploadFilesEntity uploadFilesEntitySaved = uploadFilesEntityFactoryForTest.newUploadFilesEntity();
		when(uploadFilesJpaRepository.save(uploadFilesEntity)).thenReturn(uploadFilesEntitySaved);
		
		UploadFiles uploadFilesSaved = uploadFilesFactoryForTest.newUploadFiles();
		when(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntitySaved)).thenReturn(uploadFilesSaved);

		// When
		UploadFiles uploadFilesResult = uploadFilesService.update(uploadFiles);

		// Then
		verify(uploadFilesServiceMapper).mapUploadFilesToUploadFilesEntity(uploadFiles, uploadFilesEntity);
		assertTrue(uploadFilesResult == uploadFilesSaved);
	}

	@Test
	public void delete() {
		// Given
		Integer id = mockValues.nextInteger();

		// When
		uploadFilesService.delete(id);

		// Then
		verify(uploadFilesJpaRepository).delete(id);
		
	}

}
