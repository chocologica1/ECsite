package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class ItemCreateCompleteDAO {
	//メソッド(insert文、戻り値int)
	public int createItem(String itemName, String itemPrice, String itemStock) {
		//戻り値の初期化
		int ret = 0;
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		DateUtil dateUtil = new DateUtil();
		//SQL文
		String sql = "INSERT INTO item_info_transaction(item_name, item_price, item_stock, insert_date) VALUES(?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
		//?に値をセット
			ps.setString(1, itemName);
			ps.setString(2, itemPrice);
			ps.setString(3, itemStock);
			ps.setString(4, dateUtil.getDate());
		//実行+処理
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(i + "件登録されました。");
				ret = i;
			} else {
				System.out.println("登録できませんでした。やり直してください。");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
}
