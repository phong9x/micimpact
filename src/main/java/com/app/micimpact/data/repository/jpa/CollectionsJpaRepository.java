package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.CollectionsEntity;

/**
 * Repository : Collections.
 */
public interface CollectionsJpaRepository extends PagingAndSortingRepository<CollectionsEntity, Integer> {

	public CollectionsEntity findByReveal(Integer reveal);
}
