package com.app.micimpact.data.repository.jpa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.PopupsEntity;
import com.app.micimpact.bean.jpa.ResourcesEntity;

/**
 * Repository : Popups.
 */
public interface PopupsJpaRepository extends PagingAndSortingRepository<PopupsEntity, Integer> {
	Page<PopupsEntity> findAll(Pageable page);
	Page<PopupsEntity> findByNameLike(Pageable page, String name);
}
