package com.internousdev.ecsite.action;

import java.util.ArrayList;

import com.internousdev.ecsite.dao.UserListDAO;
import com.internousdev.ecsite.dto.UserListDTO;
import com.opensymphony.xwork2.ActionSupport;

public class UserListAction extends ActionSupport {
	//フィールド
	private ArrayList<UserListDTO> userList = new ArrayList<UserListDTO>();

	//executeメソッド
	public String execute() {
		UserListDAO dao = new UserListDAO();
		userList = dao.getUserInfo();
		return SUCCESS;
	}

	//ゲッターセッター
	public ArrayList<UserListDTO> getUserList() {
		return userList;
	}

	public void setUserList(ArrayList<UserListDTO> userList) {
		this.userList = userList;
	}

}
