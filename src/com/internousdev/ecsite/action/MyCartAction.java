package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.internousdev.ecsite.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyCartAction extends ActionSupport implements SessionAware {
	//フィールド
	private ArrayList<CartDTO> myCartList = new ArrayList<CartDTO>();
	private Map<String, Object> session;
	private String nullMessage = "";

	//executeメソッド
	public String execute() {

		String result = ERROR;

		CartDAO cartDAO = new CartDAO();
		myCartList = cartDAO.getUsetCartInfo(session.get("login_user_id").toString());
		if (myCartList.size() == 0) {
			nullMessage = "カートの中に商品がありません。";
		} else {
			session.put("myCartList", myCartList);
		}
		result = SUCCESS;

		return result;
	}

	//ゲッターセッター
	public ArrayList<CartDTO> getMyCartList() {
		return myCartList;
	}

	public void setMyCartList(ArrayList<CartDTO> myCartList) {
		this.myCartList = myCartList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getNullMessage() {
		return nullMessage;
	}
}
