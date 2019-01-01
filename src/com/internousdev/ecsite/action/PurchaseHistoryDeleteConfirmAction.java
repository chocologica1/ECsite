package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.PurchaseHistoryDAO;
import com.internousdev.ecsite.dto.PurchaseHistoryDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseHistoryDeleteConfirmAction extends ActionSupport implements SessionAware {
	//フィールド
	private String deleteHistoryId;
	private Map<String,Object> session;
	private ArrayList<PurchaseHistoryDTO> purchaseDeleteList = new ArrayList<PurchaseHistoryDTO>(); //表示用

	//executeメソッド
	public String execute() {

		String result = ERROR;

		PurchaseHistoryDAO purchaseHistoryDAO = new PurchaseHistoryDAO();
		session.put("deleteHistoryId", deleteHistoryId);

		//全件削除
		if (deleteHistoryId.equals("all")) {
			purchaseDeleteList = purchaseHistoryDAO.getPurchaseHistory(session.get("login_user_id").toString());
		}
		//選択削除
		else {
			purchaseDeleteList = purchaseHistoryDAO.getUserBuyItemInfo(session.get("login_user_id").toString(), deleteHistoryId);
		}

		if(purchaseDeleteList.size() > 0) {
			result = SUCCESS;
		}

		return result;
	}

	//ゲッターセッター
	public String getDeleteHistoryId() {
		return deleteHistoryId;
	}

	public void setDeleteHistoryId(String deleteHistoryId) {
		this.deleteHistoryId = deleteHistoryId;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<PurchaseHistoryDTO> getPurchaseDeleteList() {
		return purchaseDeleteList;
	}

	public void setPurchaseDeleteList(ArrayList<PurchaseHistoryDTO> purchaseDeleteList) {
		this.purchaseDeleteList = purchaseDeleteList;
	}
}
