package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.AdminLoginDAO;
import com.internousdev.ecsite.dto.AdminLoginDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLoginAction extends ActionSupport implements SessionAware {
	//フィールド
	private String adminId;
	private String adminPass;
	private String message = "";
	private boolean adminFlg = false;
	private Map<String,Object> session;

	//executeメソッド
	public String execute() {
		//戻り値の初期化
		String result = ERROR;
		//インスタンス化
		AdminLoginDAO dao = new AdminLoginDAO();
		AdminLoginDTO dto = new AdminLoginDTO();

		//daoメソッドの実行
		dto = dao.getAdminInfo(adminId, adminPass);
		//ログイン判定
		adminFlg = dto.isAdminFlg();
		//ログイン成功
		if (adminFlg == true) {
			session.put("adminId", dto.getAdminId());
			result = SUCCESS;
		}
		//ログイン失敗
		else {
			message = "IDとパスワードが違います。";
			result = ERROR;
		}

		return result;
	}

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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isAdominFlg() {
		return adminFlg;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
