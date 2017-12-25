package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.app.micimpact.bean.MainList;
import com.app.micimpact.bean.jpa.MainListEntity;

/**
 * Repository : MainList.
 */
public interface MainListJpaRepository extends PagingAndSortingRepository<MainListEntity, Integer> {
	@Modifying
	@Query(value = 
			"INSERT INTO main_list (main_list.card_id, main_list.order) VALUES (:card_id, :order)",
			nativeQuery = true
	)
	void createMainList(@Param("card_id") Integer card_id, @Param("order") Integer order);
	
	@Modifying
	@Query(value = 
			"UPDATE main_list SET main_list.order = :order WHERE id = :id",
			nativeQuery = true
	)
	void updateMainListOrder(@Param("order") Integer card_id, @Param("id") Integer order);
	
	List<MainList> findAllByOrderByOrderAsc();
}
