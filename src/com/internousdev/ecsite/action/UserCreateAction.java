package com.internousdev.ecsite.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserCreateAction extends ActionSupport {

	private String errorMessage = "";
	private String nullMessage = "";

	public String execute() {

		return SUCCESS;

	}

	public String getErrorMessage() {
		return errorMessage;
	}
	public String getNullMessage() {
		return nullMessage;
	}
}
