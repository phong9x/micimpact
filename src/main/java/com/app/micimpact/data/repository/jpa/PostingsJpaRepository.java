package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.PostingTypesEntity;
import com.app.micimpact.bean.jpa.PostingsEntity;

/**
 * Repository : Postings.
 */
public interface PostingsJpaRepository extends PagingAndSortingRepository<PostingsEntity, Integer> {
	Long					countByPostingTypes(PostingTypesEntity postingType);
	Page<PostingsEntity> 	findByPostingTypes(PostingTypesEntity typeId, Pageable page);
	Page<PostingsEntity> 	findByPostingTypesIn(List<PostingTypesEntity> arrTypeId, Pageable page);
	List<PostingsEntity>    findByParentIdAndPostingTypes(Integer parentId, PostingTypesEntity typeId);
	
	
	@Modifying
	@Query(value = "select * from postings where id < ?1 order by created_at desc limit ?2", nativeQuery = true)
	List<PostingsEntity>    findByLastId(Integer lastId, int count);

	@Modifying
	@Query(value = "select * from postings order by created_at desc limit ?1", nativeQuery = true)
	List<PostingsEntity>    findByCount(int count);
}
