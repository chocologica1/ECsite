package com.internousdev.ecsite.action;

import java.util.ArrayList;

import com.internousdev.ecsite.dao.ItemListDAO;
import com.internousdev.ecsite.dto.ItemListDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemAction extends ActionSupport {
	//フィールド
	private ArrayList<ItemListDTO> itemList = new ArrayList<ItemListDTO>();

	//executeメソッド
	public String execute() {
		//インスタンス化
		ItemListDAO dao = new ItemListDAO();
		//daoメソッドの実行
		itemList = dao.getItemInfo();

		return SUCCESS;
	}

	//ゲッターセッター
	public ArrayList<ItemListDTO> getItemList() {
		return itemList;
	}
}
