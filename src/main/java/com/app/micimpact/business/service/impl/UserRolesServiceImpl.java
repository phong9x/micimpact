
package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.UserRoles;
import com.app.micimpact.bean.jpa.UserRolesEntity;
import com.app.micimpact.business.service.UserRolesService;
import com.app.micimpact.business.service.mapping.UserRolesServiceMapper;
import com.app.micimpact.data.repository.jpa.UserRolesJpaRepository;

/**
 * Implementation of UserRolesService
 */
@Component
@Transactional
public class UserRolesServiceImpl implements UserRolesService {

	@Resource
	private UserRolesJpaRepository userRolesJpaRepository;

	@Resource
	private UserRolesServiceMapper userRolesServiceMapper;
	
	@Override
	public UserRoles findById(Integer id) {
		UserRolesEntity userRolesEntity = userRolesJpaRepository.findOne(id);
		return userRolesServiceMapper.mapUserRolesEntityToUserRoles(userRolesEntity);
	}

	@Override
	public List<UserRoles> findAll() {
		Iterable<UserRolesEntity> entities = userRolesJpaRepository.findAll();
		List<UserRoles> beans = new ArrayList<UserRoles>();
		for(UserRolesEntity userRolesEntity : entities) {
			beans.add(userRolesServiceMapper.mapUserRolesEntityToUserRoles(userRolesEntity));
		}
		return beans;
	}

	@Override
	public UserRoles save(UserRoles userRoles) {
		return update(userRoles) ;
	}

	@Override
	public UserRoles create(UserRoles userRoles) {
		UserRolesEntity userRolesEntity;
		if(userRoles.getId() != null){
			userRolesEntity = userRolesJpaRepository.findOne(userRoles.getId());
			if( userRolesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		userRolesEntity = new UserRolesEntity();
		userRolesServiceMapper.mapUserRolesToUserRolesEntity(userRoles, userRolesEntity);
		System.out.println("==============userRolesEntity.getId()=========== : "+userRolesEntity.getId());
		System.out.println("==============userRolesEntity.getRole()=========== : "+userRolesEntity.getRole());
		userRolesEntity.setId(10);
		userRolesEntity.setRole("ROLE_PAKK");
		UserRolesEntity userRolesEntitySaved = userRolesJpaRepository.save(userRolesEntity);
		System.out.println("=================555===========");
		return userRolesServiceMapper.mapUserRolesEntityToUserRoles(userRolesEntitySaved);
	}

	@Override
	public UserRoles update(UserRoles userRoles) {
		UserRolesEntity userRolesEntity = userRolesJpaRepository.findOne(userRoles.getId());
		userRolesServiceMapper.mapUserRolesToUserRolesEntity(userRoles, userRolesEntity);
		UserRolesEntity userRolesEntitySaved = userRolesJpaRepository.save(userRolesEntity);
		return userRolesServiceMapper.mapUserRolesEntityToUserRoles(userRolesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		userRolesJpaRepository.delete(id);
	}

	public UserRolesJpaRepository getUserRolesJpaRepository() {
		return userRolesJpaRepository;
	}

	public void setUserRolesJpaRepository(UserRolesJpaRepository userRolesJpaRepository) {
		this.userRolesJpaRepository = userRolesJpaRepository;
	}

	public UserRolesServiceMapper getUserRolesServiceMapper() {
		return userRolesServiceMapper;
	}

	public void setUserRolesServiceMapper(UserRolesServiceMapper userRolesServiceMapper) {
		this.userRolesServiceMapper = userRolesServiceMapper;
	}

	@Override
	public List<UserRoles> findByRoleLike(String strRole) {
		// TODO Auto-generated method stub
		String strKeyword = "%"+strRole+"%";
		
		Iterable<UserRolesEntity> entities = userRolesJpaRepository.findByRoleLike(strKeyword);
		
		List<UserRoles> beansUserRoles = new ArrayList<UserRoles>();
		
		for (UserRolesEntity userRolesEntity : entities)
		{
			UserRoles userRole = userRolesServiceMapper.mapUserRolesEntityToUserRoles(userRolesEntity);
			beansUserRoles.add(userRole);
		}
		
		return beansUserRoles;
	}

	@Override
	public void saveUserRole(Integer id, String role) {
		// TODO Auto-generated method stub
		userRolesJpaRepository.saveUserRole(id, role);
	}

}
