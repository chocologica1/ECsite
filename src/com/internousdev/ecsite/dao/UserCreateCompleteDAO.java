package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class UserCreateCompleteDAO {
	//メソッド(insert文、戻り値int)
	public int createUser(String loginUserId, String loginPassword, String userName) {
		//戻り値の初期化
		int ret = 0;
		//インスタンス化
		DateUtil dateUtil = new DateUtil();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		//SQL文
		String sql = "INSERT INTO login_user_transaction(login_id, login_pass, user_name, insert_date) VALUES(?, ?, ?, ?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			//?に値をセット
			ps.setString(1, loginUserId);
			ps.setString(2, loginPassword);
			ps.setString(3, userName);
			ps.setString(4, dateUtil.getDate());
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
		//戻り値を返す
		return ret;
	}
}
