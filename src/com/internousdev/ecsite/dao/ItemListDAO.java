package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.ItemListDTO;
import com.internousdev.ecsite.util.DBConnector;

public class ItemListDAO {
	//メソッド(seect文、戻り値List)
	public ArrayList<ItemListDTO> getAllItemList() {
		//インスタンス化
		ArrayList<ItemListDTO> itemListDTOList = new ArrayList<ItemListDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		//SQL文
		String sql = "SELECT * FROM item_info_transaction ORDER BY id ASC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			//DBから取得した値をDTOに格納
			while(rs.next()) {
				ItemListDTO dto = new ItemListDTO(); //必ずwhile文の中でインスタンスを生成する
				dto.setId(rs.getString("id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setItemPrice(rs.getString("item_price"));
				dto.setItemStock(rs.getString("item_stock"));
				dto.setInsertDate(rs.getString("insert_date"));
				dto.setUpdateDate(rs.getString("update_date"));
				//Listに追加
				itemListDTOList.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemListDTOList;
	}
}
