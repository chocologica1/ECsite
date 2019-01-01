package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	public String execute() {
		//管理者ログインへ
		String result = "login";

		//管理者がログインしていたら管理者ページへ
		if (session.containsKey("adminId")) {
			result = SUCCESS;
		}

		return result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
