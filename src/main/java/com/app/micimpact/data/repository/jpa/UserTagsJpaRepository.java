package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.UserTags;
import com.app.micimpact.bean.jpa.UserTagsEntity;

/**
 * Repository : UserTags.
 */
public interface UserTagsJpaRepository extends PagingAndSortingRepository<UserTagsEntity, Integer> {

	@Modifying
	@Transactional
	@Query("delete from UserTagsEntity where userId = ?1")
	public void deleteByUserId(Integer user_id);
	
	public List<UserTagsEntity> findByUserId(Integer user_id);
}
