package com.internousdev.ecsite.dto;

public class PurchaseHistoryDTO {
	//フィールド
	private String userBuyItemId;
	private String itemName;
	private String itemPrice;
	private String totalPrice;
	private String count;
	private String payment;
	private String insert_date;

	//ゲッターセッター
	public String getUserBuyItemId() {
		return userBuyItemId;
	}
	public void setUserBuyItemId(String userBuyItemId) {
		this.userBuyItemId = userBuyItemId;
	}

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
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}

}
