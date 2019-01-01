package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.opensymphony.xwork2.ActionSupport;

public class MyCartDeleteCompleteAction extends ActionSupport implements SessionAware {

	//フィールド
	private String deleteCartId;
	private Map<String,Object> session;

	//executeメソッド
	public String execute() {
		CartDAO cartDAO = new CartDAO();

		int count = 0;
		//全件削除
		if(deleteCartId.equals("all")) {
			count = cartDAO.emptyUserCart(session.get("login_user_id").toString());
		} else {
			count = cartDAO.deleteCartInfo(session.get("login_user_id").toString(), deleteCartId);
		}
		if (count > 0) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	//ゲッターセッター
	public String getDeleteCartId() {
		return deleteCartId;
	}

	public void setDeleteCartId(String deleteCartId) {
		this.deleteCartId = deleteCartId;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
