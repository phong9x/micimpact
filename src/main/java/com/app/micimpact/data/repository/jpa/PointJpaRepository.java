package com.app.micimpact.data.repository.jpa;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.PointEntity;

/**
 * Repository : Point.
 */
public interface PointJpaRepository extends PagingAndSortingRepository<PointEntity, Integer> {

	
	@Query(
			"Select u From PointEntity u Where u.userId =?1 and u.creatat = ?2"
			)
	List<PointEntity> findByUserIdAndCreatat(Integer user_id, Date date);
}
