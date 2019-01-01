package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CartDAO;
import com.internousdev.ecsite.dao.PurchaseCompleteDAO;
import com.internousdev.ecsite.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseCompleteAction extends ActionSupport implements SessionAware {

	//フィールド
	private Map<String,Object> session;

	//executeメソッド
	public String execute() {
		PurchaseCompleteDAO pcDAO = new PurchaseCompleteDAO();

		//ループさせない処理
		String pay = session.get("pay").toString();
		String loginUserId = session.get("login_user_id").toString();
		ArrayList<CartDTO> purchaseList = (ArrayList<CartDTO>) session.get("myCartList");

		int result = 0;
		//ループさせる処理
		for(int index = 0; index < purchaseList.size(); index++) {
			//インスタンスの生成、Listの中のdtoインスタンスを代入
			CartDTO dto = new CartDTO();
			dto = purchaseList.get(index);
			//引数の準備
			String id = dto.getId();
			String totalPrice = dto.getTotalPrice();
			String count = dto.getCount();
			//daoメソッドの実行
			int i = pcDAO.addBuyItem(loginUserId, id, totalPrice, count, pay);
			int j = pcDAO.sellItem(id, count);
			if(i > 0 && j > 0) {
				result++;
			}
		}

		//購入処理がうまくいったらカートの中を削除
		if (result == purchaseList.size()) {
			CartDAO cartDAO = new CartDAO();
			cartDAO.emptyUserCart(loginUserId);
			session.remove("myCartList");
			return SUCCESS;
		} else {
			return ERROR;
		}
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
