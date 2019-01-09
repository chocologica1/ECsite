package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.PurchaseHistoryDTO;
import com.internousdev.ecsite.util.DBConnector;

public class PurchaseHistoryDAO {

	//購入履歴表示(select)
	public ArrayList<PurchaseHistoryDTO> getPurchaseHistory(String loginUserId) {
		//インスタンス化
		ArrayList<PurchaseHistoryDTO> purchaseHistoryDTOList = new ArrayList<PurchaseHistoryDTO>(); //購入履歴を一覧で表示するためにListを使う
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		//SQL文
		String sql = "SELECT ubit.id, iit.item_name, iit.item_price, ubit.total_price, ubit.total_count, ubit.pay, ubit.insert_date "
				+ "FROM user_buy_item_transaction ubit "
				+ "LEFT JOIN item_info_transaction iit "
				+ "ON ubit.item_transaction_id = iit.id "
				+ "WHERE ubit.user_master_id = ? "
				+ "ORDER BY insert_date DESC";
		try {
			PreparedStatement ps = con.prepareCall(sql);
			//?に値をセット
			ps.setString(1, loginUserId);
			//実行+処理
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//セッターを使う＆格納のためにインスタンス化
				PurchaseHistoryDTO dto = new PurchaseHistoryDTO();
				//DBから取得した値をDTOに値を格納
				dto.setUserBuyItemId(rs.getString("id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setItemPrice(rs.getString("item_price"));
				dto.setTotalPrice(rs.getString("total_price"));
				dto.setCount(rs.getString("total_count"));
				dto.setPayment(rs.getString("pay"));
				dto.setInsert_date(rs.getString("insert_date"));
				//Listに追加
				purchaseHistoryDTOList.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return purchaseHistoryDTOList;
	}

	//選択削除時の表示(select)
	public ArrayList<PurchaseHistoryDTO> getUserBuyItemInfo(String loginUserId, String userBuyItemId) {
		ArrayList<PurchaseHistoryDTO> userBuyItemList = new ArrayList<PurchaseHistoryDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT ubit.id, iit.item_name, iit.item_price, ubit.total_price, ubit.total_count, ubit.pay, ubit.insert_date "
				+ "FROM user_buy_item_transaction ubit "
				+ "LEFT JOIN item_info_transaction iit "
				+ "ON ubit.item_transaction_id = iit.id "
				+ "WHERE ubit.user_master_id = ? AND ubit.id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, userBuyItemId);

			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				PurchaseHistoryDTO dto = new PurchaseHistoryDTO();
				dto.setUserBuyItemId(rs.getString("id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setItemPrice(rs.getString("item_price"));
				dto.setTotalPrice(rs.getString("total_price"));
				dto.setCount(rs.getString("total_count"));
				dto.setPayment(rs.getString("pay"));
				dto.setInsert_date(rs.getString("insert_date"));
				userBuyItemList.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userBuyItemList;
	}


	//全件削除メソッド(delete文、戻り値int)
	public int emptyPurchaseHistory(String loginUserId) {
		//戻り値の初期化
		int ret = 0;
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		//SQL文
		String sql = "DELETE FROM user_buy_item_transaction WHERE user_master_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			//?に値をセット
			ps.setString(1, loginUserId);
			//実行+処理
			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println("全件削除されました");
				ret = i;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}


	//選択削除メソッド(delete文、戻り値int)
	public int deleteBuyItemHistory(String loginUserId, String deleteHistoryId) {

		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "DELETE FROM user_buy_item_transaction WHERE user_master_id = ? AND id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, deleteHistoryId);

			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(i + "件削除されました");
				ret = i;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}

}
