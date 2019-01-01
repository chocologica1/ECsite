package com.internousdev.ecsite.action;

import java.util.ArrayList;

import com.internousdev.ecsite.dao.ItemListDAO;
import com.internousdev.ecsite.dto.ItemListDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ItemListDeleteConfirmAction extends ActionSupport {
	//フィールド
	private ArrayList<ItemListDTO> deleteItemList = new ArrayList<ItemListDTO>(); //表示用

	//executeメソッド
	public String execute() {
		ItemListDAO itemListDAO = new ItemListDAO();
		deleteItemList = itemListDAO.getItemInfo();
		return SUCCESS;
	}

	//ゲッターセッター
	public ArrayList<ItemListDTO> getDeleteItemList() {
		return deleteItemList;
	}

	public void setDeleteItemList(ArrayList<ItemListDTO> deleteItemList) {
		this.deleteItemList = deleteItemList;
	}

}
