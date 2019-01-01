package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.util.DBConnector;

public class BuyItemDAO {
	//メソッド(select文、戻り値DTO型)
	public BuyItemDTO getItemInfo(String id) {
		BuyItemDTO buyItemDTO = new BuyItemDTO();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT id, item_name, item_price FROM item_info_transaction WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if(rs.next()) {
				buyItemDTO.setId(rs.getString("id"));
				buyItemDTO.setItemName(rs.getString("item_name"));
				buyItemDTO.setItemPrice(rs.getString("item_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyItemDTO;
	}
}
