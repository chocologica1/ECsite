package com.internousdev.ecsite.dto;

public class LoginDTO {
	//フィールド
	private String loginUserId;
	private String loginPassword;
	private String userName;
	private boolean loginFlg = false;

	//ゲッターセッター
	public String getLoginUserId() {
		return this.loginUserId;
	}
	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}
	public String getLoginPassword() {
		return this.loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public String getUserName() {
		return this.userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean getLoginFlg() {
		return this.loginFlg;
	}
	public void setLoginFlg(boolean loginFlg) {
		this.loginFlg = loginFlg;
	}
}
