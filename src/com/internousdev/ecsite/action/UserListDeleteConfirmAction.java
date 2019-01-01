package com.internousdev.ecsite.action;

import java.util.ArrayList;

import com.internousdev.ecsite.dao.UserListDAO;
import com.internousdev.ecsite.dto.UserListDTO;
import com.opensymphony.xwork2.ActionSupport;

public class UserListDeleteConfirmAction extends ActionSupport {
	//フィールド
	private ArrayList<UserListDTO> deleteUserList = new ArrayList<UserListDTO>();

	//executeメソッド
	public String execute() {
		UserListDAO dao = new UserListDAO();
		deleteUserList = dao.getUserInfo();
		return SUCCESS;
	}

	//ゲッターセッター
	public ArrayList<UserListDTO> getDeleteUserList() {
		return deleteUserList;
	}

	public void setDeleteUserList(ArrayList<UserListDTO> deleteUserList) {
		this.deleteUserList = deleteUserList;
	}


}
