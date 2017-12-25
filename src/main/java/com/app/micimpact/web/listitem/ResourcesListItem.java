package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.Resources;
import com.app.micimpact.web.common.ListItem;

public class ResourcesListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public ResourcesListItem(Resources resources) {
		super();

		this.value = ""
			 + resources.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = resources.toString();
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
