package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ChannelLikeEntity;

/**
 * Repository : ChannelLike.
 */
public interface ChannelLikeJpaRepository extends PagingAndSortingRepository<ChannelLikeEntity, Integer> {
List<ChannelLikeEntity> findByUserIdAndChannelId(Integer userId,Integer channeId);
List<ChannelLikeEntity> findByUserId(Integer userId);
}
