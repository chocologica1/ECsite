package com.internousdev.ecsite.action;

import com.internousdev.ecsite.dao.UserListDeleteCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UserListDeleteCompleteAction extends ActionSupport  {
	public String execute() {
		String result = ERROR;
		UserListDeleteCompleteDAO dao = new UserListDeleteCompleteDAO();
		int count = dao.deleteAllUsers();
		if(count > 0) {
			result = SUCCESS;
		}
		return result;
	}
}
