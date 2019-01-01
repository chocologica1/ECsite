package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.CartDTO;
import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class CartDAO {

	//カートDBに追加するメソッド
	public int addUserCart(String loginUserId, String id, String count, String totalPrice) {
		//戻り値の初期化
		int ret = 0;
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		DateUtil dateUtil = new DateUtil();
		//SQL文
		String sql = "INSERT INTO user_cart_transaction(user_master_id, item_transaction_id, count, total_price, insert_date) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			//?に値をセット
			ps.setString(1, loginUserId);
			ps.setString(2, id);
			ps.setString(3, count);
			ps.setString(4, totalPrice);
			ps.setString(5, dateUtil.getDate());
			//実行
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(i + "件登録されました");
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


	//カートを表示するメソッド(select文、戻り値List)
	public ArrayList<CartDTO> getUsetCartInfo(String loginUserId) {
		ArrayList<CartDTO> myCartList = new ArrayList<CartDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "SELECT uct.id, uct.item_transaction_id, iit.item_name, iit.item_price, uct.count, uct.total_price, uct.insert_date "
				+ "FROM user_cart_transaction AS uct "
				+ "JOIN item_info_transaction AS iit "
				+ "ON uct.item_transaction_id = iit.id "
				+ "WHERE uct.user_master_id = ? "
				+ "ORDER BY uct.insert_date ASC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setUserCartId(rs.getString("id"));
				dto.setId(rs.getString("item_transaction_id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setItemPrice(rs.getString("item_price"));
				dto.setCount(rs.getString("count"));
				dto.setTotalPrice(rs.getString("total_price"));
				dto.setInsertDate(rs.getString("insert_date"));
				myCartList.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myCartList;

	}

	//カートの合計金額を計算する
	public int addTotalPrice(String loginUserId) {
		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT total_price FROM user_cart_transaction WHERE user_master_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int intTotalPrice  = Integer.parseInt(rs.getString("total_price"));
				ret += intTotalPrice;
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


	//カートを空にするメソッド(delete)
	public int emptyUserCart(String loginUserId) {
		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "DELETE FROM user_cart_transaction WHERE user_master_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println(i + "件削除されました");
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


	//カートの商品を1件削除するメソッド(delete文、戻り値int)
	public int deleteCartInfo(String loginUserId, String userCartId) {
		int ret = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "DELETE FROM user_cart_transaction WHERE id = ? AND user_master_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userCartId);
			ps.setString(2, loginUserId);
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(i + "件削除されました");
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


	//カートを1件表示するメソッド(select)
	public ArrayList<CartDTO> getUserCartItem(String loginUserId, String userCartId) {
		ArrayList<CartDTO> userCartList = new ArrayList<CartDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "SELECT uct.id, uct.item_transaction_id, iit.item_name, iit.item_price, uct.count, uct.total_price, uct.insert_date "
				+ "FROM user_cart_transaction AS uct "
				+ "JOIN item_info_transaction AS iit "
				+ "ON uct.item_transaction_id = iit.id "
				+ "WHERE uct.user_master_id = ? AND uct.id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, userCartId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setUserCartId(rs.getString("id"));
				dto.setId(rs.getString("item_transaction_id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setItemPrice(rs.getString("item_price"));
				dto.setCount(rs.getString("count"));
				dto.setTotalPrice(rs.getString("total_price"));
				dto.setInsertDate(rs.getString("insert_date"));
				userCartList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return userCartList;
	}

}
