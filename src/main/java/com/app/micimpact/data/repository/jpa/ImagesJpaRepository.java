package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.ImagesEntity;

/**
 * Repository : Images.
 */
public interface ImagesJpaRepository extends PagingAndSortingRepository<ImagesEntity, Integer> {
	

	List<ImagesEntity> findByCardIdIn(Integer card_ids[]);
	List<ImagesEntity> findByIdIn(Integer card_ids[]);
}
