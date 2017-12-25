package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.Likes;
import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.LikesEntity;

/**
 * Repository : Likes.
 */
public interface LikesJpaRepository extends PagingAndSortingRepository<LikesEntity, Integer> {
	
	LikesEntity findByUserIdAndCardId(Integer user_id, Integer card_id);
	
}
