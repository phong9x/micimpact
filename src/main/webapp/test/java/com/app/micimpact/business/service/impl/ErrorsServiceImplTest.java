package com.app.micimpact.business.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import com.app.micimpact.bean.Errors;
import com.app.micimpact.bean.jpa.ErrorsEntity;
import com.app.micimpact.business.service.mapping.ErrorsServiceMapper;
import com.app.micimpact.data.repository.jpa.ErrorsJpaRepository;
import com.app.micimpact.test.ErrorsFactoryForTest;
import com.app.micimpact.test.ErrorsEntityFactoryForTest;
import com.app.micimpact.test.MockValues;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Test : Implementation of ErrorsService
 */
@RunWith(MockitoJUnitRunner.class)
public class ErrorsServiceImplTest {

	@InjectMocks
	private ErrorsServiceImpl errorsService;
	@Mock
	private ErrorsJpaRepository errorsJpaRepository;
	@Mock
	private ErrorsServiceMapper errorsServiceMapper;
	
	private ErrorsFactoryForTest errorsFactoryForTest = new ErrorsFactoryForTest();

	private ErrorsEntityFactoryForTest errorsEntityFactoryForTest = new ErrorsEntityFactoryForTest();

	private MockValues mockValues = new MockValues();
	
	@Test
	public void findById() {
		// Given
		Integer id = mockValues.nextInteger();
		
		ErrorsEntity errorsEntity = errorsJpaRepository.findOne(id);
		
		Errors errors = errorsFactoryForTest.newErrors();
		when(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntity)).thenReturn(errors);

		// When
		Errors errorsFound = errorsService.findById(id);

		// Then
		assertEquals(errors.getId(),errorsFound.getId());
	}

	@Test
	public void findAll() {
		// Given
		List<ErrorsEntity> errorsEntitys = new ArrayList<ErrorsEntity>();
		ErrorsEntity errorsEntity1 = errorsEntityFactoryForTest.newErrorsEntity();
		errorsEntitys.add(errorsEntity1);
		ErrorsEntity errorsEntity2 = errorsEntityFactoryForTest.newErrorsEntity();
		errorsEntitys.add(errorsEntity2);
		when(errorsJpaRepository.findAll()).thenReturn(errorsEntitys);
		
		Errors errors1 = errorsFactoryForTest.newErrors();
		when(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntity1)).thenReturn(errors1);
		Errors errors2 = errorsFactoryForTest.newErrors();
		when(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntity2)).thenReturn(errors2);

		// When
		List<Errors> errorssFounds = errorsService.findAll();

		// Then
		assertTrue(errors1 == errorssFounds.get(0));
		assertTrue(errors2 == errorssFounds.get(1));
	}

	@Test
	public void create() {
		// Given
		Errors errors = errorsFactoryForTest.newErrors();

		ErrorsEntity errorsEntity = errorsEntityFactoryForTest.newErrorsEntity();
		when(errorsJpaRepository.findOne(errors.getId())).thenReturn(null);
		
		errorsEntity = new ErrorsEntity();
		errorsServiceMapper.mapErrorsToErrorsEntity(errors, errorsEntity);
		ErrorsEntity errorsEntitySaved = errorsJpaRepository.save(errorsEntity);
		
		Errors errorsSaved = errorsFactoryForTest.newErrors();
		when(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntitySaved)).thenReturn(errorsSaved);

		// When
		Errors errorsResult = errorsService.create(errors);

		// Then
		assertTrue(errorsResult == errorsSaved);
	}

	@Test
	public void createKOExists() {
		// Given
		Errors errors = errorsFactoryForTest.newErrors();

		ErrorsEntity errorsEntity = errorsEntityFactoryForTest.newErrorsEntity();
		when(errorsJpaRepository.findOne(errors.getId())).thenReturn(errorsEntity);

		// When
		Exception exception = null;
		try {
			errorsService.create(errors);
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
		Errors errors = errorsFactoryForTest.newErrors();

		ErrorsEntity errorsEntity = errorsEntityFactoryForTest.newErrorsEntity();
		when(errorsJpaRepository.findOne(errors.getId())).thenReturn(errorsEntity);
		
		ErrorsEntity errorsEntitySaved = errorsEntityFactoryForTest.newErrorsEntity();
		when(errorsJpaRepository.save(errorsEntity)).thenReturn(errorsEntitySaved);
		
		Errors errorsSaved = errorsFactoryForTest.newErrors();
		when(errorsServiceMapper.mapErrorsEntityToErrors(errorsEntitySaved)).thenReturn(errorsSaved);

		// When
		Errors errorsResult = errorsService.update(errors);

		// Then
		verify(errorsServiceMapper).mapErrorsToErrorsEntity(errors, errorsEntity);
		assertTrue(errorsResult == errorsSaved);
	}

	@Test
	public void delete() {
		// Given
		Integer id = mockValues.nextInteger();

		// When
		errorsService.delete(id);

		// Then
		verify(errorsJpaRepository).delete(id);
		
	}

}
