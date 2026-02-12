package com.luminar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {

	private static Connection dbCon;
	private static String dbDriver;
	private static String dbURL;
	private static String userName;
	private static String passWord;

	private static void dbInit() {
		try {
			dbDriver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/luminar_examhub";
			userName = "root";
			passWord = "ragil123";
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void connect() throws ClassNotFoundException, SQLException {
		Connection conn = null;
		dbInit();
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL, userName, passWord);
			setDbcon(conn);

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		}
	}

	// -------------------------------------------------------------------------

	private static void setDbcon(Connection conn) {
		dbCon = conn;
	}

	// -------------------------------------------------------------------------

	public static Connection getDbCon() {
		return dbCon;
	}

	// -------------------------------------------------------------------------

	public static void closeDbCon() throws SQLException {
		try {
			dbCon.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

	}
}
