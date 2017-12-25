package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.SearchTagsEntity;

/**
 * Repository : SearchTags.
 */
public interface SearchTagsJpaRepository extends PagingAndSortingRepository<SearchTagsEntity, Integer> {

}
