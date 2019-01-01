package com.internousdev.ecsite.dto;

public class BuyItemDTO {
	//フィールド
	private String id;
	private String itemName;
	private String itemPrice;

	//ゲッターセッター
	public String getId() {
		return this.id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItemName() {
		return this.itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemPrice() {
		return this.itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
}
