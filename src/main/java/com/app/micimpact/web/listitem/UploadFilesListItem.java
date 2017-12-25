package com.app.micimpact.web.listitem;

import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.web.common.ListItem;

public class UploadFilesListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public UploadFilesListItem(UploadFiles uploadFiles) {
		super();

		this.value = ""
			 + uploadFiles.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = uploadFiles.toString();
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
