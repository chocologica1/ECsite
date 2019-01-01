package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseAction extends ActionSupport implements SessionAware {

	//フィールド
	private Map<String, Object> session;

	//executeメソッド
	public String execute() {

		//支払い金額を取得する
		CartDAO cartDAO = new CartDAO();
		int purchasePrice = cartDAO.addTotalPrice(session.get("login_user_id").toString());
		session.put("purchasePrice", purchasePrice);

		 return SUCCESS;
	}

	//ゲッターセッター
	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
