package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.UserRoles;
import com.app.micimpact.web.common.ListItem;

public class UserRolesListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public UserRolesListItem(UserRoles userRoles) {
		super();

		this.value = ""
			 + userRoles.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = userRoles.getRole();
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
