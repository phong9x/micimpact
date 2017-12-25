package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.CardTags;
import com.app.micimpact.bean.jpa.CardTagsEntity;

/**
 * Repository : Cards.
 */ 
public interface CardTagsJpaRepository extends PagingAndSortingRepository<CardTagsEntity, Integer> {
	List<CardTagsEntity> findByCardIdIn(Integer card_ids[]);
	
	@Modifying
	@Transactional
	@Query("delete from CardTagsEntity where cardId = ?1")
	public void deleteByCardId(Integer cardId);
	
	@Modifying
	@Transactional
	@Query(value = "delete card_tags from card_tags where  card_tags.card_id in (select id from cards where cards.channel_id=?1)", nativeQuery = true)
	void    deleteByChannelId(Integer channel_id);
}
