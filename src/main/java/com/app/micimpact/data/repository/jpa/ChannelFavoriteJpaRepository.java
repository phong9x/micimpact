package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.app.micimpact.bean.jpa.ChannelFavoriteEntity;
import com.app.micimpact.bean.jpa.ChannelLikeEntity;

/**
 * Repository : ChannelFavorite.
 */
public interface ChannelFavoriteJpaRepository extends PagingAndSortingRepository<ChannelFavoriteEntity, Integer> {
	
	List<ChannelFavoriteEntity> findByUserIdAndChannelId(Integer userId,Integer channeId);

}
