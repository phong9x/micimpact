package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ListCardsEntity;

/**
 * Repository : ListCards.
 */
public interface ListCardsJpaRepository extends PagingAndSortingRepository<ListCardsEntity, Integer> {

}
