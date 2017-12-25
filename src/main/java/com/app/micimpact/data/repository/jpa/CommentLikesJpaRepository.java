package com.app.micimpact.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.CommentLikesEntity;

/**
 * Repository : CommentLikes.
 */
public interface CommentLikesJpaRepository extends PagingAndSortingRepository<CommentLikesEntity, Integer> {

	CommentLikesEntity findByUserIdAndCardIdAndCommentId(Integer userId, Integer cardId, Integer commentId);
}
