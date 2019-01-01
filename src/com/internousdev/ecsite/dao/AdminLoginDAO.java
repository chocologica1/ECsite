package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.ecsite.dto.AdminLoginDTO;
import com.internousdev.ecsite.util.DBConnector;

public class AdminLoginDAO {
	//メソッド(select文、戻り値DTO)
	public AdminLoginDTO getAdminInfo(String adminId, String adminPass) {
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		AdminLoginDTO dto = new AdminLoginDTO();
		//SQL文
		String sql = "SELECT * FROM admin_user_transaction WHERE admin_id = ? AND admin_pass = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, adminId);
			ps.setString(2, adminPass);
			//実行+dtoに格納
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				dto.setAdminId(rs.getString("admin_id").toString());
				dto.setAdminPass(rs.getString("admin_pass").toString());
				dto.setAdminFlg(true);
				System.out.println("ログインしました");
			} else {
				System.out.println("ログインできませんでした");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
