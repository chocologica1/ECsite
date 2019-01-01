package com.internousdev.ecsite.dto;

public class CartDTO {
	//フィールド
	private String userCartId;
	private String id;
	private String itemName;
	private String itemPrice;
	private String count;
	private String totalPrice;
	private String insertDate;
//	private int purchasePrice;

	//ゲッターセッター
	public String getUserCartId() {
		return userCartId;
	}
	public void setUserCartId(String userCartId) {
		this.userCartId = userCartId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
//	public int getPurchasePrice() {
//		return purchasePrice;
//	}
//	public void setPurchasePrice(int purchasePrice) {
//		this.purchasePrice = purchasePrice;
//	}
}
