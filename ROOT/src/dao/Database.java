package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {
	public final String USERNAME="joker";
	public final String PASSWORD="952727aA~";
	public final String URL="jdbc:mysql://localhost/shop?serverTimezone=UTC";
	public final String DRIVE = "com.mysql.cj.jdbc.Driver";
	public Connection con;
	public Database() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVE);
		con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		return con;
	}
}
