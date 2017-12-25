package com.app.micimpact.data.repository.jpa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.CategoriesEntity;

/**
 * Repository : Categories.
 */
public interface CategoriesJpaRepository extends PagingAndSortingRepository<CategoriesEntity, Integer> {
Page<CategoriesEntity> findAll(Pageable pageable);
}
