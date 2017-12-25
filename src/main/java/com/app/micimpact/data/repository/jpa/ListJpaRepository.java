package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ListEntity;

/**
 * Repository : List.
 */
public interface ListJpaRepository extends PagingAndSortingRepository<ListEntity, Integer> {

}
