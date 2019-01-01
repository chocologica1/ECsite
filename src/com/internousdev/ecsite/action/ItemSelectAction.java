package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemDAO;
import com.internousdev.ecsite.dao.CheckDBDAO;
import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.dto.CheckDBDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemSelectAction extends ActionSupport implements SessionAware {
	//フィールド
	private String id;
	private String itemName;
	private String itemPrice;
	private Map<String, Object> session;
	private int itemStock;
	private String soldOutMessage = "";

	//executeメソッド
	public String execute() {

		//一覧から来たときsessionにidを追加する
		if (id != null) {
			session.put("id", id);
		}

		//===売り切れチェック===
		CheckDBDAO checkDAO = new CheckDBDAO();
		CheckDBDTO checkDTO = new CheckDBDTO();
		checkDTO = checkDAO.getStock(session.get("id").toString());
		itemStock = checkDTO.getItemStock();
		if (itemStock <= 0) {
			soldOutMessage = "この商品は売り切れました。";
		}

		//===商品情報を取得===
		//インスタンス化
		BuyItemDAO buyItemDAO = new BuyItemDAO();
		BuyItemDTO buyItemDTO = new BuyItemDTO();

		//DAOメソッドの実行
		buyItemDTO = buyItemDAO.getItemInfo(session.get("id").toString());

		//表示用の値を取得(sessionでやっておかしくなるか検証する)
		itemName = buyItemDTO.getItemName();
		itemPrice = buyItemDTO.getItemPrice();
		//sessionに値を追加
		session.put("buyItem_name", itemName);
		session.put("buyItem_price", itemPrice);

		return SUCCESS;

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

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public String getSoldOutMessage() {
		return soldOutMessage;
	}

	public void setSoldOutMessage(String soldOutMessage) {
		this.soldOutMessage = soldOutMessage;
	}

}
