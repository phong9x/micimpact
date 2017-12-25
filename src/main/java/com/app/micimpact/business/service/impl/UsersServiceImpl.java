package com.app.micimpact.business.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.business.service.UsersService;
import com.app.micimpact.business.service.mapping.UsersServiceMapper;
import com.app.micimpact.data.repository.jpa.UsersJpaRepository;
import com.app.micimpact.web.common.BasicEnvironment;
import com.app.micimpact.web.common.Kakao;
import com.app.micimpact.web.common.Naver;

/**
 * Implementation of UsersService
 */
@Component
@Transactional
public class UsersServiceImpl implements UsersService {

	@Resource
	private UsersJpaRepository usersJpaRepository;

	@Resource
	private UsersServiceMapper usersServiceMapper;
	
	@Override
	public Users findById(Integer id) {
		UsersEntity usersEntity = usersJpaRepository.findOne(id);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}

	@Override
	public List<Users> findAll() {
		Iterable<UsersEntity> entities = usersJpaRepository.findAll();
		List<Users> beans = new ArrayList<Users>();
		for(UsersEntity usersEntity : entities) {
			beans.add(usersServiceMapper.mapUsersEntityToUsers(usersEntity));
		}
		return beans;
	}

	@Override
	public Users save(Users users) {
		return update(users) ;
	}

	@Override
	public Users create(Users users) {
		UsersEntity usersEntity;
		if(users.getId() != null){
			usersEntity = usersJpaRepository.findOne(users.getId());
			if( usersEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		usersEntity = new UsersEntity();
		usersServiceMapper.mapUsersToUsersEntity(users, usersEntity);
		UsersEntity usersEntitySaved = usersJpaRepository.save(usersEntity);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntitySaved);
	}

	@Override
	public Users update(Users users) {
		UsersEntity usersEntity = usersJpaRepository.findOne(users.getId());
		usersServiceMapper.mapUsersToUsersEntity(users, usersEntity);
		UsersEntity usersEntitySaved = usersJpaRepository.save(usersEntity);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		usersJpaRepository.delete(id);
	}

	public UsersJpaRepository getUsersJpaRepository() {
		return usersJpaRepository;
	}

	public void setUsersJpaRepository(UsersJpaRepository usersJpaRepository) {
		this.usersJpaRepository = usersJpaRepository;
	}

	public UsersServiceMapper getUsersServiceMapper() {
		return usersServiceMapper;
	}

	public void setUsersServiceMapper(UsersServiceMapper usersServiceMapper) {
		this.usersServiceMapper = usersServiceMapper;
	}
	
	@Override
	public Users checkUser(String email) {
		// TODO Auto-generated method stub
		UsersEntity usersEntity = usersJpaRepository.findByEmailAndFag(email, 1);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}
	
	
	@Override
	public Users checkSnsUser(String token, String type) {
		
		UsersEntity usersEntity = null;
		if (type.equals("1")){
			usersEntity = usersJpaRepository.findByFacebookTokenAndFag(token, 1);
		}else if (type.equals("2")){
			try {
				Naver n =new Naver();
				String unix_id=n.getIdNaver(token);
				System.out.println(unix_id);
				usersEntity = usersJpaRepository.findByLineTokenAndFag(unix_id, 1);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else{	
			try {
				Kakao k =new Kakao();
				String unix_id= k.getUnixId_ByAccessToken(token);
				usersEntity = usersJpaRepository.findByKakaotalkTokenAndFag(unix_id, 1);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		}
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}

	
	@Override
	public Users findUser(Users users, Integer option) {
		// TODO Auto-generated method stub
		UsersEntity usersEntity = new UsersEntity();
		usersEntity = usersJpaRepository.findByNameAndEmailAndFag(users.getName(), users.getEmail(), 1);
//		switch (option) {
//			case 1:
//				usersEntity = usersJpaRepository.findByNameAndEmail(users.getName(), users.getEmail());
//				break;
//			case 2:
//				usersEntity = usersJpaRepository.findByNameAndEmailAndPhoneAndUsername(users.getName(), users.getEmail(), users.getPhone(), users.getUsername());
//				break;
//		}
		
		
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}

	@Override
	public Page<UsersEntity> findAll(Integer pageNumber, Integer state) {
		// TODO Auto-generated method stub
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		System.out.println("test : " + state);
		
		return usersJpaRepository.findByFag(request, state);
	}

	@Override
	public Page<UsersEntity> findSearchAll(Integer pageNumber, Integer option, String keyword) {
		// TODO Auto-generated method stub
		
		
		String value = "%"+keyword+"%";//검색 조건
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		switch (option) {
			case 2:
				return usersJpaRepository.findByNameLike(request ,value);
			case 4:
				return usersJpaRepository.findByEmailLike(request ,value);
		}
		
		return null;
		
	
	}

	@Override
	public List<Users> findByListLimit(int i) {
		
		PageRequest request =  new PageRequest(0, 5, new Sort(new Order(Direction.DESC, "id")));
		
		Iterable<UsersEntity> entities = usersJpaRepository.findByFag(request, i);
		List<Users> beans = new ArrayList<Users>();
		for(UsersEntity usersEntity : entities) {
			beans.add(usersServiceMapper.mapUsersEntityToUsers(usersEntity));
		}
		return beans;
	}
	
	@Override
	public List<Users> findByIdIn(Integer[] ids) {
		Iterable<UsersEntity> entities = usersJpaRepository.findByIdIn(ids);
		List<Users> beans = new ArrayList<Users>();
		for(UsersEntity usersEntity : entities) {
			beans.add(usersServiceMapper.mapUsersEntityToUsers(usersEntity));
		}
		return beans;
	}

	@Override
	public Users findByEmail(String email) {
		UsersEntity usersEntity = usersJpaRepository.findByEmailAndFag(email, 1);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}
	
	@Override
	public Users findByEmailAndName(String email, String userName) {
		UsersEntity usersEntity = usersJpaRepository.findByNameAndEmailAndFag(userName, email, 1);
		return usersServiceMapper.mapUsersEntityToUsers(usersEntity);
	}

	@Override
	public void updatePointLevel(Integer point, Integer level, Integer user_id) {
		usersJpaRepository.updatePointLevel(point, level, user_id);
		
	}

	@Override
	public Integer countJoinUser_ByDay(Date createAT) {
		try {
			return usersJpaRepository.countJoinUser_ByDay(createAT);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer countJoinUser_ByWeek(Date start, Date end) {
		try {
			return usersJpaRepository.countJoinUser_ByWeek(start, end);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer countJoinUser_ByMonth(Integer month, Integer year) {
		try {
			return usersJpaRepository.countJoinUser_ByMonth(month, year);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer totalJoinUsery() {
		try {
			return usersJpaRepository.totalJoinUsery();
		} catch (Exception e) {
			return null;
		}
	}

	

}
