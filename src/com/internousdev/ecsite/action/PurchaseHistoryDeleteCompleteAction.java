package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.PurchaseHistoryDAO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseHistoryDeleteCompleteAction  extends ActionSupport implements SessionAware{
	//フィールド
	private Map<String,Object> session;

	//メソッド
	public String execute() {
		//戻り値の初期化
		int count = 0;
		String result = ERROR;

		//インスタンス化
		PurchaseHistoryDAO dao = new PurchaseHistoryDAO();

		//全件削除時
		if (session.get("deleteHistoryId").toString().equals("all")) {
			//ユーザーIDを引数にしてDAOのdeleteメソッドを実行
			count = dao.emptyPurchaseHistory(session.get("login_user_id").toString());
		//選択削除時
		} else {
			count = dao.deleteBuyItemHistory(session.get("login_user_id").toString(), session.get("deleteHistoryId").toString());
		}

		//処理
		 if (count > 0) {
			result = SUCCESS;
			session.remove("deleteHistoryId");
		}
		return result;
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
