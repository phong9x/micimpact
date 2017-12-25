package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.Comments;
import com.app.micimpact.bean.jpa.CommentsEntity;

/**
 * Repository : Comments.
 */
public interface CommentsJpaRepository extends PagingAndSortingRepository<CommentsEntity, Integer> {

	@Modifying
	@Query(value = "select comments.id, comments.card_id, comments.user_id, comments.body, comments.count_like, users.name, comments.created_at, EXISTS(select * from comment_likes where comments.id=comment_likes.comment_id and comment_likes.user_id=?1) as me from comments, users where  comments.is_show=1 and users.id=comments.user_id and comments.card_id=?2 and created_at < (select created_at from comments where id = ?3) and card_id=?2 order by comments.created_at desc limit ?4", nativeQuery = true)
	List<Object[]>    findByCardId(Integer userId, Integer cardId, Integer lastId, int count);

	@Modifying
	@Query(value = "select comments.id, comments.card_id, comments.user_id, comments.body, comments.count_like, users.name, comments.created_at, EXISTS(select * from comment_likes where comments.id=comment_likes.comment_id and comment_likes.user_id=?1) as me from comments, users where comments.is_show=1 and   users.id=comments.user_id and comments.card_id=?2 order by comments.created_at desc limit ?3", nativeQuery = true)
	List<Object[]>    findByCardId(Integer userId, Integer cardId, int count);
	
	@Modifying
	@Query(value = "select comments.id, comments.card_id, comments.user_id, comments.body, comments.count_like, users.name, comments.created_at from comments, users where comments.is_show=1 and  users.id=comments.user_id and comments.card_id=?1 order by comments.count_like desc limit ?2", nativeQuery = true)
	List<Object[]>    findByCardId(Integer cardId, int count);
	
	@Modifying
	@Query(value = "select  c.id,c.card_id,c.user_id,u.name,c.body,c.created_at,c.is_show from  comments c inner join users u on c.user_id=u.id where c.card_id=?1 order by c.id DESC limit ?2,?3", nativeQuery = true)
	List<Object[]>    findComment( Integer comment_id, int begin,int end);
	
	@Query(value = "select  count(*) from  comments c inner join users u on c.user_id=u.id where c.card_id=?1 order by c.id DESC ", nativeQuery = true)
	Integer    totalPage( Integer comment_id);
	
	@Query(
			"Select s From CommentsEntity s Where s.cardId = ?1"
			)
	Page<CommentsEntity> getBy_CardId(Integer cardId,Pageable pageable);
	
	@Query(
			"Select s From CommentsEntity s Where s.countReport >0"
			)
	Page<CommentsEntity> findAllReport(Pageable pageable);
		
}
