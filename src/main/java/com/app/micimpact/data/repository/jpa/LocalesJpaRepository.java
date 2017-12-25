package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.LocalesEntity;

/**
 * Repository : Locales.
 */
public interface LocalesJpaRepository extends PagingAndSortingRepository<LocalesEntity, Integer> {
	Page<LocalesEntity> findAll(Pageable page);
	Page<LocalesEntity> findByLanguageLike(Pageable page, String domain);
}
