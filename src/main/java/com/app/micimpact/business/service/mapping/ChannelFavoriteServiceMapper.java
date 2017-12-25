/*
 * Created on 21 Mar 2016 ( Time 16:47:12 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.ChannelFavorite;
import com.app.micimpact.bean.jpa.ChannelFavoriteEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class ChannelFavoriteServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public ChannelFavoriteServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'ChannelFavoriteEntity' to 'ChannelFavorite'
	 * @param channelFavoriteEntity
	 */
	public ChannelFavorite mapChannelFavoriteEntityToChannelFavorite(ChannelFavoriteEntity channelFavoriteEntity) {
		if(channelFavoriteEntity == null) {
			return null;
		}

		//--- Generic mapping 
		ChannelFavorite channelFavorite = map(channelFavoriteEntity, ChannelFavorite.class);

		return channelFavorite;
	}
	
	/**
	 * Mapping from 'ChannelFavorite' to 'ChannelFavoriteEntity'
	 * @param channelFavorite
	 * @param channelFavoriteEntity
	 */
	public void mapChannelFavoriteToChannelFavoriteEntity(ChannelFavorite channelFavorite, ChannelFavoriteEntity channelFavoriteEntity) {
		if(channelFavorite == null) {
			return;
		}

		//--- Generic mapping 
		map(channelFavorite, channelFavoriteEntity);

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