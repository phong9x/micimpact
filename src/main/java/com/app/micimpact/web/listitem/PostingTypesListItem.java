package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.PostingTypes;
import com.app.micimpact.web.common.ListItem;

public class PostingTypesListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public PostingTypesListItem(PostingTypes postingTypes) {
		super();

		this.value = ""
			 + postingTypes.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = postingTypes.toString();
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
