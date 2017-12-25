package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.Cards;
import com.app.micimpact.bean.jpa.CardsEntity;
import com.app.micimpact.bean.jpa.ChannelEntity;
import com.app.micimpact.bean.jpa.PostingsEntity;

/**
 * Repository : Cards.
 */ 
public interface CardsJpaRepository extends PagingAndSortingRepository<CardsEntity, Integer> {

	@Modifying
	@Query(value = "select * from cards where category_id is not null and created_at < (select created_at from cards where id = ?1) order by created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity>    findByLastId(Integer lastId, int count);

	@Modifying
	@Query(value = "select * from cards where category_id is not null  order by created_at desc limit ?1", nativeQuery = true)
	List<CardsEntity>    findByCount(int count);
		
	
	@Modifying
	@Query(value = "select * from cards where hit_count+count_like+share+comment_count < (select hit_count+count_like+share+comment_count from cards where id = ?1)  order by (hit_count+count_like+share+comment_count) desc limit ?2 ", nativeQuery = true)
	List<CardsEntity> 	findByWeekPopularByLastId(Integer lastId, Integer count);
	
	@Modifying
	@Query(value = "select * from cards order by (hit_count+count_like+share+comment_count) desc limit ?1", nativeQuery = true)
	List<CardsEntity> 	findByWeekPopular(Integer count);
	
	List<CardsEntity> 	findByIdIn(Integer[] card_ids);
	
	@Modifying
	@Query(value = "select * from cards where user_id=?1 order by created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity> 	findByUserId(Integer user_id, Integer count);	
	
	@Modifying
	@Query(value = "select * from cards where user_id=?1 and created_at < (select created_at from cards where id=?2) order by created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity> 	findByUserId(Integer user_id, Integer lastId, Integer count);
	
	@Modifying
	@Query(value = "select * from cards, card_tags where cards.id=card_tags.card_id and card_tags.name in ?1 order by cards.created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity> findByTagIn(String[] tags, Integer count);
	
	@Modifying
	@Query(value = "select * from cards, card_tags where cards.id=card_tags.card_id and card_tags.name in ?1 and created_at < (select created_at from cards where id=?2) order by cards.created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity> findByTagIn(String[] tags, Integer last_id, Integer count);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and created_at < (select created_at from cards where id = ?2)  order by created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity>    findByCategoryId(Integer categoryId, Integer lastId, int count);

	@Modifying
	@Query(value = "select * from cards where  category_id=?1  order by created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity>    findByCategoryId(Integer categoryId, int count);
		
	@Modifying
	@Query(value = "select cards.* from cards, likes where likes.user_id=?1 and likes.card_id=cards.id and likes.created_at < (select likes.created_at from likes where likes.user_id=?1 and likes.card_id = ?2) order by likes.created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity>    findByLikeUserId(Integer userId, Integer lastId, int count);

	@Modifying
	@Query(value = "select cards.* from cards, likes where likes.user_id=?1 and likes.card_id=cards.id order by likes.created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity>    findByLikeUserId(Integer userId, int count);	
	
	@Modifying
	@Query(value = "select * from cards order by count_like desc limit ?1", nativeQuery = true)
	List<CardsEntity> findBySortByLikes(Integer count);
	
	@Modifying
	@Query(value = "select * from cards where count_like < (select count_like from cards where id = ?1) order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findBySortByLikes(Integer last_id, Integer count);
	
	@Modifying
	@Query(value = "select * from cards where cards.id != ?2 order by count_like desc limit ?1", nativeQuery = true)
	List<CardsEntity> findBySortByLikesExceptCard(Integer count, Integer card_id);
	
	@Modifying
	@Query(value = "select * from cards where cards.id != ?3 and count_like < (select count_like from cards where id = ?1) order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findBySortByLikesExceptCard(Integer last_id, Integer count, Integer card_id);
	
	
	@Modifying
	@Query(value = "select * from cards where category_id is not null  order by count_like desc limit ?1", nativeQuery = true)
	List<CardsEntity> findByRecommendedSortByLikesExceptCard(Integer count);
	
	@Modifying
	@Query(value = "select * from cards where category_id is not null and count_like < (select count_like from cards where id = ?1) order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findByRecommendedSortByLikesExceptCard(Integer last_id, Integer count);

	@Modifying
	@Query(value = "select * from cards where category_id=?1  order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findByCategoryIdRecommendSortByLikesExceptCard(Integer categoryId, Integer count);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and  count_like < (select count_like from cards where id = ?2) order by count_like desc limit ?3", nativeQuery = true)
	List<CardsEntity> findByCategoryIdRecommendSortByLikesExceptCard(Integer categoryId, Integer last_id, Integer count);
	
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1  order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findByCategoryIdSortByLikes(Integer categoryId, Integer count);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and count_like < (select count_like from cards where id = ?2) order by count_like desc limit ?3", nativeQuery = true)
	List<CardsEntity> findByCategoryIdSortByLikes(Integer categoryId, Integer last_id, Integer count);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and cards.id !=?3  order by count_like desc limit ?2", nativeQuery = true)
	List<CardsEntity> findByCategoryIdSortByLikesExceptCard(Integer categoryId, Integer count, Integer card_id);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and cards.id !=?4 and count_like < (select count_like from cards where id = ?2) order by count_like desc limit ?3", nativeQuery = true)
	List<CardsEntity> findByCategoryIdSortByLikesExceptCard(Integer categoryId, Integer last_id, Integer count, Integer card_id);
	
	@Modifying
	@Query(value = "select cards.* from cards, main_list where cards.id=main_list.card_id and main_list.order > (select main_list.order from main_list where card_id=?1) order by main_list.order asc limit ?2", nativeQuery = true)
	List<CardsEntity>    findMainList(Integer lastId, int count);

	@Modifying
	@Query(value = "select cards.* from cards, main_list where cards.id=main_list.card_id order by main_list.order asc limit ?1", nativeQuery = true)
	List<CardsEntity>    findMainList(int count);
	
	Page<CardsEntity>    findByTitleLike(Pageable page, String title);
	Page<CardsEntity>    findByTitleLikeAndActorLike(Pageable page, String title,String actor);
	
	@Modifying
	@Query(value = "select * from cards where actor=?1 and created_at < (select created_at from cards where id=?2 ) order by created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity>    findByActor(String actor, Integer lastId, int count);

	@Modifying
	@Query(value = "select * from cards where actor=?1 order by created_at desc limit ?2", nativeQuery = true)
	List<CardsEntity>    findByActor(String actor, int count);
	
	@Modifying
	@Query(value = "select * from cards where category_id=?1 and id!=?2 order by created_at desc limit ?3", nativeQuery = true)
	List<CardsEntity>    findOtherCardByCategoryId(Integer categoryId, Integer currentId, int count);
	
	
	Page<CardsEntity> findByChannelId(Pageable page, Integer channelId);
	
	@Query(
			"Select s From CardsEntity s Where s.channelId = ?2 and s.title like ?1 "
			)
	Page<CardsEntity> findByChannel_Search(String title,Integer channelId,Pageable pageable);
	
	@Modifying
	@Query(value = "delete from cards where channel_id=?1", nativeQuery = true)
	void    deleteByChannelId(Integer channel_id);
	
	List<CardsEntity> findByChannelId(Integer channelId);
	
}
