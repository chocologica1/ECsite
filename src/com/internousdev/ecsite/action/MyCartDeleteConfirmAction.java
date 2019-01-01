package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.internousdev.ecsite.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyCartDeleteConfirmAction extends ActionSupport implements SessionAware  {

	//フィールド
	private String deleteCartId;
	private ArrayList<CartDTO> userCartDeleteList = new ArrayList<CartDTO>();
	private Map<String, Object> session;

	//executeメソッド
	public String execute() {

		CartDAO cartDAO = new CartDAO();

		//全削除
		 if (deleteCartId.equals("all")) {
			userCartDeleteList = cartDAO.getUsetCartInfo(session.get("login_user_id").toString());
		}
		//選択削除
		else {
			userCartDeleteList = cartDAO.getUserCartItem(session.get("login_user_id").toString(), deleteCartId);
		}

		if(userCartDeleteList.size() > 0) {
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

	public ArrayList<CartDTO> getUserCartDeleteList() {
		return userCartDeleteList;
	}

	public void setUserCartDeleteList(ArrayList<CartDTO> userCartDeleteList) {
		this.userCartDeleteList = userCartDeleteList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
