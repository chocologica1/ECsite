package com.internousdev.ecsite.action;

import java.util.ArrayList;

import com.internousdev.ecsite.dao.ItemListDAO;
import com.internousdev.ecsite.dto.ItemListDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemListAction extends ActionSupport{
	//フィールド
	private ArrayList<ItemListDTO> itemList = new ArrayList<ItemListDTO>();

	//executeメソッド
	public String execute() {
		//インスタンス化
		ItemListDAO dao = new ItemListDAO();
		//DAOメソッド実行→Listに代入
		itemList = dao.getItemInfo();
		return SUCCESS;
	}

	//ゲッターセッター
	public ArrayList<ItemListDTO> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<ItemListDTO> itemList) {
		this.itemList = itemList;
	}

}
