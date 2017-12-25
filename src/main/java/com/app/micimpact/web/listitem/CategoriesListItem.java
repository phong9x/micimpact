package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.Categories;
import com.app.micimpact.web.common.ListItem;

public class CategoriesListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public CategoriesListItem(Categories categories) {
		super();

		this.value = ""
			 + categories.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = categories.getName();
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
