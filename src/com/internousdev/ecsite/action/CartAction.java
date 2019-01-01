package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.internousdev.ecsite.dao.CheckDBDAO;
import com.internousdev.ecsite.dto.CheckDBDTO;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport implements SessionAware {

	//フィールド
	private int count;
	private Map<String,Object> session;
	private int itemStock;
	private String stockMessage = "";

	//executeメソッド(sessionに追加してSUCCESSを返す)
	public String execute() {
		//在庫チェック
		CheckDBDAO checkDAO = new CheckDBDAO();
		CheckDBDTO checkDTO = new CheckDBDTO();
		checkDTO = checkDAO.getStock(session.get("id").toString());
		itemStock = checkDTO.getItemStock();
		if (itemStock < count) {
			stockMessage = "この商品は" + itemStock + "個までしかご購入いただけません。";
			return ERROR;
		}

		//カートに入れる
		else {
			String result = ERROR;
			//合計金額を計算する
			int intPrice = Integer.parseInt(session.get("buyItem_price").toString());
			int totalPrice = count * intPrice;
			session.put("count", count);
			session.put("total_price", totalPrice);

			//カートDBに格納する
			CartDAO cartDAO = new CartDAO();
			int count = cartDAO.addUserCart(session.get("login_user_id").toString(),
					session.get("id").toString(),
					session.get("count").toString(),
					session.get("total_price").toString());
			if(count > 0) {
				result = SUCCESS;
			}
			return result;
		}
	}

	//ゲッターセッター
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public String getStockMessage() {
		return stockMessage;
	}

	public void setStockMessage(String stockMessage) {
		this.stockMessage = stockMessage;
	}

}
