package com.internousdev.ecsite.action;

import com.opensymphony.xwork2.ActionSupport;

public class ItemCreateAction extends ActionSupport {

	private String errorMessage = "";
	private String itemCreateError = "";

	public String execute() {

		return SUCCESS;

	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public String getItemCreateError() {
		return itemCreateError;
	}
}
