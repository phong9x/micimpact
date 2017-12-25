package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.Users;
import com.app.micimpact.web.common.ListItem;

public class UsersListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public UsersListItem(Users users) {
		super();

		this.value = ""
			 + users.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = users.toString();
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
