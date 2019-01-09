package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.ItemCreateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemCreateCompleteAction extends ActionSupport implements SessionAware {
	//フィールド
	private Map<String,Object> session;
	private String errorMessage = "";
	private String itemCreateError = "";

	//executeメソッド
	public String execute() {
		//戻り値の初期化
		String result = ERROR;
		//インスタンス化
		ItemCreateCompleteDAO dao = new ItemCreateCompleteDAO();
		//実行+処理
		int count = dao.createItem(
				session.get("itemName").toString(),
				session.get("itemPrice").toString(),
				session.get("itemStock").toString()
				);
		if(count > 0) {
			result = SUCCESS;
		} else {
			itemCreateError = "登録できませんでした。やり直してください。";
			result = ERROR;
		}
		return result;
	}

	//ゲッターセッター
	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public String getItemCreateError() {
		return this.itemCreateError;
	}

	public void setItemCreateError(String itemCreateError) {
		this.itemCreateError = itemCreateError;
	}

}
