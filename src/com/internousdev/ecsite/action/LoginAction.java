package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.LoginDAO;
import com.internousdev.ecsite.dto.LoginDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	//フィールド
	private String loginUserId;
	private String loginPassword;
	private String userName;
	private Map<String, Object> session;
	private String message = "";

	//executeメソッド
	public String execute() {

		//未入力エラー
		if(loginUserId.equals("") || loginPassword.equals("")) {
			message = "未入力の項目があります。";
			return ERROR;
		}

		//戻り値の初期化
		String result = ERROR;
		//インスタンス化
		LoginDAO loginDAO = new LoginDAO();
		LoginDTO loginDTO = new LoginDTO();
		//DAOメソッドの実行
		loginDTO = loginDAO.getLoginUserInfo(loginUserId, loginPassword);
		if (loginDTO.getLoginFlg()) {
			result = SUCCESS;
			session.put("login_user_id", loginDTO.getLoginUserId()); //ログイン判定用
			userName = loginDTO.getUserName(); //◯◯さんを表示させる用
			session.put("userName", userName);
		} else {
			message = "IDまたはパスワードが違います。";
		}
		return result;

	}

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
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Map<String, Object> getSession() {
		return this.session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public String getMessage() {
		return message;
	}

}
