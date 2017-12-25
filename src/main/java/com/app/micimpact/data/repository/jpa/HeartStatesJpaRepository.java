package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.HeartStatesEntity;

/**
 * Repository : HeartStates.
 */
public interface HeartStatesJpaRepository extends PagingAndSortingRepository<HeartStatesEntity, Integer> {

}
