package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.jpa.ChannelEntity;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
/**
 * Repository : Channel.
 */
public interface ChannelJpaRepository extends PagingAndSortingRepository<ChannelEntity, Integer> {
	Page<ChannelEntity> findAll(Pageable page);
	Page<ChannelEntity> findAllByIsShow(Pageable page,Integer is_show);
	List<ChannelEntity> findAll();
	@Query(
			"Select s From ChannelEntity s Where s.users.id = ?1"
			)
	List<ChannelEntity> getByUserId(Integer user_id);
	@Query(
			"Select s From ChannelEntity s Where s.users.id = ?1 "
			)
	Page<ChannelEntity> getBy_UserId(Integer user_id,Pageable pageable);
	
	@Query(
			"Select s From ChannelEntity s Where s.type = ?1 "
			)
	Page<ChannelEntity> findChannelByType(Integer type,Pageable pageable);
	
	
	Page<ChannelEntity> findChannelByTypeAndTitle(Integer type,Pageable pageable);
	
	@Transactional
	@Query(value = "select  c.id,c.title,c.introduce,c.likes,c.favorite,c.type,c.created_at,c.cards_recent_id,ca.thumbnail_url,ca.target_url,c.user_id,u.name,u.job "
			+ "from  channel c inner join users u on (c.user_id=u.id) inner join channel_like ch on (ch.channel_id=c.id)  right join cards ca on (ca.id=c.cards_recent_id) "
			+ "where ch.user_id=?1 order by c.id DESC limit ?2,?3", nativeQuery = true)
	List<Object[]>    findChannelLike( Integer user_id, Integer begin, Integer end);
	
	@Query(value = "select count(*) "
			+ "from  channel c inner join users u on (c.user_id=u.id) inner join channel_like ch on (ch.channel_id=c.id)  right join cards ca on (ca.id=c.cards_recent_id) "
			+ "where ch.user_id=?1", nativeQuery = true)
	Integer    totalPage_findChannelLike( Integer user_id);
}
