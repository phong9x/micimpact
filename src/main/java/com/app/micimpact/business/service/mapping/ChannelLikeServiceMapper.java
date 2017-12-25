/*
 * Created on 21 Mar 2016 ( Time 16:47:12 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.ChannelLike;
import com.app.micimpact.bean.jpa.ChannelLikeEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class ChannelLikeServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public ChannelLikeServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'ChannelLikeEntity' to 'ChannelLike'
	 * @param channelLikeEntity
	 */
	public ChannelLike mapChannelLikeEntityToChannelLike(ChannelLikeEntity channelLikeEntity) {
		if(channelLikeEntity == null) {
			return null;
		}

		//--- Generic mapping 
		ChannelLike channelLike = map(channelLikeEntity, ChannelLike.class);

		return channelLike;
	}
	
	/**
	 * Mapping from 'ChannelLike' to 'ChannelLikeEntity'
	 * @param channelLike
	 * @param channelLikeEntity
	 */
	public void mapChannelLikeToChannelLikeEntity(ChannelLike channelLike, ChannelLikeEntity channelLikeEntity) {
		if(channelLike == null) {
			return;
		}

		//--- Generic mapping 
		map(channelLike, channelLikeEntity);

	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	protected ModelMapper getModelMapper() {
		return modelMapper;
	}

	protected void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

}