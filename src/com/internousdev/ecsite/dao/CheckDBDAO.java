package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.ecsite.dto.CheckDBDTO;
import com.internousdev.ecsite.util.DBConnector;

public class CheckDBDAO {
	//重複IDチェック
	public CheckDBDTO checkId(String loginUserId) {
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		CheckDBDTO dto = new CheckDBDTO();
		//SQL文
		String sql = "SELECT login_id FROM login_user_transaction WHERE login_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			//実行+処理
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dto.setLoginId(rs.getString("login_id"));
				dto.setSameId(true);
				System.out.println("このIDは使用できません");
			} else {
				 System.out.println("このIDは使用できます");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	//在庫チェック
	public CheckDBDTO getStock(String id) {
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		CheckDBDTO dto = new CheckDBDTO();
		//SQL文
		String sql = "SELECT item_stock FROM item_info_transaction WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			//実行
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int itemStock = Integer.parseInt(rs.getString("item_stock"));
				dto.setItemStock(itemStock);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
