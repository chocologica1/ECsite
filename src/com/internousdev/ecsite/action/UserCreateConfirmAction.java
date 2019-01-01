package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.CheckDBDAO;
import com.internousdev.ecsite.dto.CheckDBDTO;
import com.opensymphony.xwork2.ActionSupport;

public class UserCreateConfirmAction extends ActionSupport implements SessionAware {
	//フィールド
	private String loginUserId;
	private String loginPassword;
	private String userName;
	private Map<String,Object> session;
	private String errorMessage = "";
	private String nullMessage = "";

	//executeメソッド
	public String execute() {
		//戻り値の初期化
		String result = "ERROR";

		//空欄がなければSessionに追加してSUCCESSを返す
		if (!(loginUserId.equals("")) && !(loginPassword.equals("")) && !(userName.equals(""))) {
			//ログインIDの重複があればエラーメッセージを指定してERRORを返す
			if (checkId(loginUserId)) {
				errorMessage = loginUserId + " は既に使われているIDです。変更してください。";
				result = ERROR;
			} else {
				session.put("loginUserId", loginUserId);
				session.put("loginPassword", loginPassword);
				session.put("userName", userName);
				result = SUCCESS;
			}
		}

		//空欄があればエラーメッセージを指定してERRORを返す
		else {
			nullMessage = "未入力の項目があります。"; //スライドはセッターを使ってる
			result = ERROR;
		}


		return result;
	}

	//ログインIDの重複をチェックするメソッド
	public boolean checkId(String loginUserId) {
		//インスタンス化
		CheckDBDAO dao = new CheckDBDAO();
		CheckDBDTO dto = new CheckDBDTO();
		//daoメソッドの実行
		dto = dao.checkId(loginUserId);
		return dto.isSameId();
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
		return this.userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getErrorMessage() {
		return this.errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getNullMessage() {
		return nullMessage;
	}
	public void setNullMessage(String nullMessage) {
		this.nullMessage = nullMessage;
	}
	public Map<String,Object> getSession() {
		return this.session;
	}
	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
}
