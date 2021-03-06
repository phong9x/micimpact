/*
 * Created on 17 Mar 2016 ( Time 10:33:58 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.Channel;
import com.app.micimpact.web.common.ListItem;

public class ChannelListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public ChannelListItem(Channel channel) {
		super();

		this.value = ""
			 + channel.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = channel.toString();
	}

	@Override
	public String getValue() {
		return value;
	}

	@Override
	public String getLabel() {
		return label;
	}

}
