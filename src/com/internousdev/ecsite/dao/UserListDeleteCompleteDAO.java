package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;

public class UserListDeleteCompleteDAO {
	//メソッド(delete文、戻り値int)
	public int deleteAllUsers() {
		//戻り値の初期化
		int ret = 0;
		//インスタンス化
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		//SQL文
		String sql = "DELETE FROM login_user_transaction";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println("削除されました。");
				ret = i;
			} else {
				System.out.println("削除に失敗しました。");
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
