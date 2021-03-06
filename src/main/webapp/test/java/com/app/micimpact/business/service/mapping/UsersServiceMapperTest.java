/*
 * Created on 13 5월 2015 ( Time 11:43:18 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service.mapping;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.bean.jpa.UserRolesEntity;
import com.app.micimpact.test.MockValues;

/**
 * Test : Mapping between entity beans and display beans.
 */
public class UsersServiceMapperTest {

	private UsersServiceMapper usersServiceMapper;

	private static ModelMapper modelMapper = new ModelMapper();

	private MockValues mockValues = new MockValues();
	
	
	@BeforeClass
	public static void setUp() {
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}
	
	@Before
	public void before() {
		usersServiceMapper = new UsersServiceMapper();
		usersServiceMapper.setModelMapper(modelMapper);
	}
	
	/**
	 * Mapping from 'UsersEntity' to 'Users'
	 * @param usersEntity
	 */
	@Test
	public void testMapUsersEntityToUsers() {

	}
	
	/**
	 * Test : Mapping from 'Users' to 'UsersEntity'
	 */
	@Test
	public void testMapUsersToUsersEntity() {
		// Given
//		Users users = new Users();
//		users.setUsername(mockValues.nextString(255));
//		users.setPassword(mockValues.nextString(256));
//		users.setName(mockValues.nextString(255));
//		users.setEmail(mockValues.nextString(255));
//		users.setPhone(mockValues.nextString(128));
//		users.setCreateDate(mockValues.nextDate());
//		users.setUpdateDate(mockValues.nextDate());
//		users.setRoleId(mockValues.nextInteger());
//
//		UsersEntity usersEntity = new UsersEntity();
//		
//		// When
//		usersServiceMapper.mapUsersToUsersEntity(users, usersEntity);
//		
//		// Then
//		assertEquals(users.getUsername(), usersEntity.getUsername());
//		assertEquals(users.getPassword(), usersEntity.getPassword());
//		assertEquals(users.getName(), usersEntity.getName());
//		assertEquals(users.getEmail(), usersEntity.getEmail());
//		assertEquals(users.getPhone(), usersEntity.getPhone());
//		assertEquals(users.getCreateDate(), usersEntity.getCreateDate());
//		assertEquals(users.getUpdateDate(), usersEntity.getUpdateDate());
//		assertEquals(users.getRoleId(), usersEntity.getUserRoles().getId());
	}

}