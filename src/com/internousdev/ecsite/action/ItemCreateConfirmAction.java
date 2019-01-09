package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ItemCreateConfirmAction extends ActionSupport implements SessionAware {
	//フィールド
	private String itemName;
	private String itemPrice;
	private String itemStock;
	private String imageFileName;
	private String errorMessage = "";
	private String itemCreateError = "";
	private Map<String, Object> session;

	//executeメソッド
	public String execute() {
		//戻り値の初期化
		String result = ERROR;

		//空欄がなければSUCCESSを返してSessionに追加
		if (!(itemName.equals("")) && !(itemPrice.equals("")) && !(itemStock.equals(""))) {
			session.put("itemName", itemName);
			session.put("itemPrice", itemPrice);
			session.put("itemStock", itemStock);
			if (imageFileName.equals("")) {
				session.put("imageFileName", "noimage.jpg");
			} else {
				session.put("imageFileName", imageFileName);
			}
			result = SUCCESS;
		}

		//空欄があればERRORを返してerrorMessage
		else {
			errorMessage = "未入力の項目があります。";
			result = ERROR;
		}

		return result;
	}

	//ゲッターセッター
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemStock() {
		return itemStock;
	}

	public void setItemStock(String itemStock) {
		this.itemStock = itemStock;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getItemCreateError() {
		return itemCreateError;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
