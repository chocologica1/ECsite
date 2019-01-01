package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.PurchaseHistoryDAO;
import com.internousdev.ecsite.dto.PurchaseHistoryDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseHistoryAction extends ActionSupport implements SessionAware{

	//フィールド
	private Map<String,Object> session;
	private ArrayList<PurchaseHistoryDTO> purchaseList = new ArrayList<PurchaseHistoryDTO>();

	//exesuteメソッド
	public String execute() {
		//戻り値の初期化
		String result = ERROR;
		//インスタンス化
		PurchaseHistoryDAO dao = new PurchaseHistoryDAO();

		//ログインされてない時loginを返す
		if(!session.containsKey("login_user_id")) {
			result = "login";
		}

		//ログインされていれば購入履歴
		else {
			purchaseList = dao.getPurchaseHistory(session.get("login_user_id").toString());
			result = SUCCESS;
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


	public ArrayList<PurchaseHistoryDTO> getPurchaseList() {
		return purchaseList;
	}


	public void setPurchaseList(ArrayList<PurchaseHistoryDTO> purchaseList) {
		this.purchaseList = purchaseList;
	}
}
