package com.internousdev.ecsite.action;

import com.internousdev.ecsite.dao.ItemListDeleteCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemListDeleteCompleteAction extends ActionSupport {
	public String execute() {
		String result = ERROR;
		ItemListDeleteCompleteDAO dao = new ItemListDeleteCompleteDAO();
		int count = dao.deleteAllItems();
		if (count > 0) {
			result = SUCCESS;
		}	else {

		}
		return result;
	}
}
