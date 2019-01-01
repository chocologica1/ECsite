package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.UserListDTO;
import com.internousdev.ecsite.util.DBConnector;

public class UserListDAO {
	//メソッド(insert文、戻り値List)
	public ArrayList<UserListDTO> getUserInfo() {
		//インスタンス化
		ArrayList<UserListDTO> userListDTOList = new ArrayList<UserListDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		//SQL文
		String sql = "SELECT * FROM login_user_transaction ORDER BY id ASC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			//実行+処理
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				//dtoインスタンスの生成
				UserListDTO dto = new UserListDTO();
				//dtoインスタンスにDBから取得した値を格納
				dto.setId(rs.getString("id"));
				dto.setLoginId(rs.getString("login_id"));
				dto.setPassword(rs.getString("login_pass"));
				dto.setUserName(rs.getString("user_name"));
				dto.setInsertDate(rs.getString("insert_date"));
				dto.setUpdateDate(rs.getString("update_date"));
				//Listに追加
				userListDTOList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userListDTOList;
	}
}
