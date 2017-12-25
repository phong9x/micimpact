package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.PostingTypesEntity;

/**
 * Repository : PostingTypes.
 */
public interface PostingTypesJpaRepository extends PagingAndSortingRepository<PostingTypesEntity, Integer> {

}
