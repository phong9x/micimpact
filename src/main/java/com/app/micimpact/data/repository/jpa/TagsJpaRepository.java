package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.ChannelEntity;
import com.app.micimpact.bean.jpa.TagsEntity;

/**
 * Repository : Tags.
 */
public interface TagsJpaRepository extends PagingAndSortingRepository<TagsEntity, String> {
	Page<TagsEntity> findAll(Pageable page);
	@Query(
			"Select s From TagsEntity s "
			)
	Page<TagsEntity> findByPage(Pageable page);
}
