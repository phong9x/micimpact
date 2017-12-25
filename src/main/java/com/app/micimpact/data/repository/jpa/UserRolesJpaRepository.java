package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.app.micimpact.bean.jpa.UserRolesEntity;

/**
 * Repository : UserRoles.
 */
public interface UserRolesJpaRepository extends PagingAndSortingRepository<UserRolesEntity, Integer> {
	@Modifying
	@Query(value = 
			"INSERT INTO user_roles VALUES (:id, :role)",
			nativeQuery = true
	)
	void saveUserRole(@Param("id") Integer id, @Param("role") String role);
	
	List<UserRolesEntity> findByRoleLike(String strRole);
	
}