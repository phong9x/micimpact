package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ReportEntity;
 
/**
 * Repository : Report.
 */
public interface ReportJpaRepository extends PagingAndSortingRepository<ReportEntity, Integer> {
	
	Page<ReportEntity> findAll(Pageable pageable);

	@Modifying
	@Query(value = "select c.id,u.name,c.body,c.count_report, c.is_show from comments c  inner join users u on c.user_id=u.id where  c.count_report>0 order by c.count_report DESC limit ?1,?2", nativeQuery = true)
	List<Object[]>    findReportComment( int begin,int end);
	
	
	@Query(value = "select count(*) from comments c  inner join users u on c.user_id=u.id where  c.count_report>0", nativeQuery = true)
	Integer   totalCommentPage();
	
	@Modifying
	@Query(value = "select c.id,u.name,c.body,c.count_report, c.is_show from cards c  inner join users u on c.user_id=u.id where  c.count_report>0 order by c.count_report DESC limit ?1,?2", nativeQuery = true)
	List<Object[]>    findReportCard( int begin,int end);
	
	@Query(value = "select count(*) from cards c  inner join users u on c.user_id=u.id where  c.count_report>0", nativeQuery = true)
	Integer   totalCardPage();
	
	
}
