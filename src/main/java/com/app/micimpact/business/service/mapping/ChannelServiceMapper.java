/*
 * Created on 30 Mar 2016 ( Time 14:51:03 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import com.app.micimpact.bean.Channel;
import com.app.micimpact.bean.jpa.ChannelEntity;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.bean.jpa.CardsEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class ChannelServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public ChannelServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'ChannelEntity' to 'Channel'
	 * @param channelEntity
	 */
	public Channel mapChannelEntityToChannel(ChannelEntity channelEntity) {
		if(channelEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Channel channel = map(channelEntity, Channel.class);

		//--- Link mapping ( link to Users )
		if(channelEntity.getUsers() != null) {
			channel.setUserId(channelEntity.getUsers().getId());
		}
		//--- Link mapping ( link to Cards )
		if(channelEntity.getCards() != null) {
			channel.setCardsRecentId(channelEntity.getCards().getId());
		}
		return channel;
	}
	
	/**
	 * Mapping from 'Channel' to 'ChannelEntity'
	 * @param channel
	 * @param channelEntity
	 */
	public void mapChannelToChannelEntity(Channel channel, ChannelEntity channelEntity) {
		if(channel == null) {
			return;
		}

		//--- Generic mapping 
		map(channel, channelEntity);

		//--- Link mapping ( link : channel )
		if( hasLinkToUsers(channel) ) {
			UsersEntity users1 = new UsersEntity();
			users1.setId( channel.getUserId() );
			channelEntity.setUsers( users1 );
		} else {
			channelEntity.setUsers( null );
		}

		//--- Link mapping ( link : channel )
		if( hasLinkToCards(channel) ) {
			CardsEntity cards2 = new CardsEntity();
			cards2.setId( channel.getCardsRecentId() );
			channelEntity.setCards( cards2 );
		} else {
			channelEntity.setCards( null );
		}

	}
	
	/**
	 * Verify that Users id is valid.
	 * @param Users Users
	 * @return boolean
	 */
	private boolean hasLinkToUsers(Channel channel) {
		if(channel.getUserId() != null) {
			return true;
		}
		return false;
	}

	/**
	 * Verify that Cards id is valid.
	 * @param Cards Cards
	 * @return boolean
	 */
	private boolean hasLinkToCards(Channel channel) {
		if(channel.getCardsRecentId() != null) {
			return true;
		}
		return false;
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