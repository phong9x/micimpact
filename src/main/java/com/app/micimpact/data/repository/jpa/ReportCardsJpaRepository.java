package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ReportCardsEntity;

/**
 * Repository : ReportCards.
 */
public interface ReportCardsJpaRepository extends PagingAndSortingRepository<ReportCardsEntity, Integer> {

}
