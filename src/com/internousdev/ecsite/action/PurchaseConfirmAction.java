package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class PurchaseConfirmAction extends ActionSupport implements SessionAware {

	//フィールド
	private Map<String,Object> session;
	private String pay;

	//executeメソッド
	public String execute() {

		String payment = "支払い方法を選択してください";
		switch (pay) {
			case "1" :
				payment = "クレジットカード";
				break;
			case "2" :
				payment = "コンビニ決済";
				break;
			case "3" :
				payment = "銀行振込";
				break;
			case "4" :
				payment = "代金引換";
				break;
			default :
				System.out.println(payment);
		}
		session.put("pay", payment);
		return SUCCESS;

	}

	//ゲッターセッター
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
}
