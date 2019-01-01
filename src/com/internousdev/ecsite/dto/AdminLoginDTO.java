package com.internousdev.ecsite.dto;

public class AdminLoginDTO {
	//フィールド
	private String adminId;
	private String adminPass;
	private boolean adminFlg = false;

	//ゲッターセッター
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	public boolean isAdminFlg() {
		return adminFlg;
	}
	public void setAdminFlg(boolean adminFlg) {
		this.adminFlg = adminFlg;
	}



}
