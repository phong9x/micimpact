package com.app.micimpact.data.repository.jpa;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.app.micimpact.bean.Users;
import com.app.micimpact.bean.jpa.UsersEntity;

/**
 * Repository : Users.
 */
public interface UsersJpaRepository extends PagingAndSortingRepository<UsersEntity, Integer> {
	
	UsersEntity findByEmailAndFag(String email, Integer flag);

	UsersEntity findByNameAndEmailAndFag(String name, String email, Integer flag);
	
	UsersEntity findByFacebookTokenAndFag(String token, Integer fag);
	
	UsersEntity findByKakaotalkTokenAndFag(String token, Integer fag);
	
	UsersEntity findByLineTokenAndFag(String token, Integer fag);
	
	Page<UsersEntity> findByFag(Pageable page, Integer fag);

	Page<UsersEntity> findByNameLike(Pageable page, String value);

	Page<UsersEntity> findByEmailLike(Pageable page, String value);
	
	List<UsersEntity> findByIdIn(Integer[] ids);
	
	@Modifying
	@Query(value = 
			"UPDATE users SET users.point = ?1,  users.level = ?2 WHERE users.id = ?3",
			nativeQuery = true
	)
	void updatePointLevel(Integer point,  Integer level, Integer user_id);
	
	
	@Query(value = 
			"Select count(*) from users where users.fag=1",
			nativeQuery = true
	)
	Integer totalJoinUsery();
	
	@Query(value = 
			"Select count(*) from users where users.created_at=?1 and users.fag=1",
			nativeQuery = true
	)
	Integer countJoinUser_ByDay(Date createAT);
	
	
	@Query(value = 
			"Select count(*) from users where users.created_at > ?1 and users.created_at < ?2 and users.fag=1",
			nativeQuery = true
	)
	Integer countJoinUser_ByWeek(Date start, Date end);
	
	@Query(value = 
			"Select count(*) from users where MONTH(users.created_at)=?1 and YEAR(users.created_at)=?2 and users.fag=1",
			nativeQuery = true
	)
	Integer countJoinUser_ByMonth(Integer month, Integer year);
	
	
}
