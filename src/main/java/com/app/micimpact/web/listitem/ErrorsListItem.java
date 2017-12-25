package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.Errors;
import com.app.micimpact.web.common.ListItem;

public class ErrorsListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public ErrorsListItem(Errors errors) {
		super();

		this.value = ""
			 + errors.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = errors.toString();
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
