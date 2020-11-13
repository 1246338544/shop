package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	public static final String USERNAME="joker";
	public static final String PASSWORD="952727";
	public static final String URL="jdbc:mysql://localhost/shop?";
	public static final String DRIVE = "com.mysql.cj.jdbc.Driver";
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		java.lang.Class.forName(Database.DRIVE);
		return DriverManager.getConnection(Database.URL, Database.USERNAME, Database.PASSWORD);	
	}
}
