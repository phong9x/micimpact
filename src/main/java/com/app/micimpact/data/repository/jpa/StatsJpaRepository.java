package com.app.micimpact.data.repository.jpa;

import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.StatsEntity;

/**
 * Repository : Stats.
 */
public interface StatsJpaRepository extends PagingAndSortingRepository<StatsEntity, Integer> {
	@Query(value = 
			"Select count(*) from stats where type=?1  ",
			nativeQuery = true
	)
	Integer total_statsCard(Integer type);
	
	@Query(value = 
			"Select count(*) from stats where type=?1 and CAST(?2 AS DATE) = CAST(create_at AS DATE)",
			nativeQuery = true
	)
	Integer statsCard_ByDate(Integer type,Date date);
	
	@Query(value = 
			"Select count(*) from stats where type=?1 and create_at >= ?2 and create_at <= ?3",
			nativeQuery = true
	)
	Integer statsCard_ByWeek(Integer type, Date start, Date end);
	
	@Query(value = 
			"Select count(*) from stats where type=?1 and MONTH(stats.create_at)=?2 and YEAR(stats.create_at)=?3 ",
			nativeQuery = true
	)
	Integer statsCard_ByMonth(Integer type, Integer month, Integer year);
	
}
