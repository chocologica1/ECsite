package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {
	//フィールド
	private Map<String,Object> session;

	//exesuteメソッド
	public String execute() throws SQLException {
		//戻り値の初期化
		String result = ERROR;
		//インスタンス化

		//ログインされてない時loginを返す
		if(!session.containsKey("login_user_id")) {
			result = "login";
		}

		//ログインされていればマイページ
		else {
			result = SUCCESS;
		}

		return result;
	}


	//ゲッターセッター
	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
