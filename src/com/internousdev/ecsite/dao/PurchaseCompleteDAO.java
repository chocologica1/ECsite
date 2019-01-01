package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class PurchaseCompleteDAO {

	//購入メソッド(insert)
	public int addBuyItem(String loginUserId, String id, String totalPrice, String count, String pay) {
		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		DateUtil dateUtil = new DateUtil();
		String sql = "INSERT INTO user_buy_item_transaction(item_transaction_id, total_price, total_count, user_master_id, pay, insert_date)"
				+ "VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, totalPrice);
			ps.setString(3, count);
			ps.setString(4, loginUserId);
			ps.setString(5, pay);
			ps.setString(6, dateUtil.getDate());
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(i + "件登録しました");
				ret = i;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}


	//在庫を減らすメソッド(update)
	public int sellItem(String id, String count) {
		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		DateUtil dateUtil = new DateUtil();
		String sql = "UPDATE item_info_transaction SET item_stock = item_stock - ?, update_date = ? WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, count);
			ps.setString(2, dateUtil.getDate());
			ps.setString(3, id);
			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println(i + "件更新しました");
				ret = i;
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
