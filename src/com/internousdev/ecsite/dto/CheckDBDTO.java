package com.internousdev.ecsite.dto;

public class CheckDBDTO {
	//フィールド
	private String loginId;
	private boolean sameId = false;
	private int itemStock;

	//ゲッターセッター
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public boolean isSameId() {
		return sameId;
	}

	public void setSameId(boolean sameId) {
		this.sameId = sameId;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}


}
