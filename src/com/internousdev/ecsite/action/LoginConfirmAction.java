package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginConfirmAction extends ActionSupport implements SessionAware {
	//フィールド
	private Map<String,Object> session;
	private String message = "";

	//executeメソッド
	public String execute() {

		String result = ERROR;
		if(session.containsKey("login_user_id")) {
			result = SUCCESS;
		} else {
			result = "login";
		}
		return result;

	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getMessage() {
		return this.message;
	}

}
