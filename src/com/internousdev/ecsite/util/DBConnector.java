package com.internousdev.ecsite.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	//JDBCドライバー名
	private String driverName = "com.mysql.jdbc.Driver";

	//データベース接続URL
	private String url = "jdbc:mysql://localhost/ecsite";

	//データベース接続ユーザー名
	private String user = "root";

	//データベース接続パスワード
	private String password = "mysql";

	//getConnectionメソッド
	public Connection getConnection() {
		Connection con = null;

		try {
			Class.forName(driverName);
			con = (Connection) DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
