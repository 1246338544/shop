package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
	
	private Connection connection = null;
	public Login() throws SQLException, ClassNotFoundException {
	   java.lang.Class.forName(Config.DRIVE);
	   this.connection = DriverManager.getConnection(Config.URL, Config.USERNAME, Config.PASSWORD);	
	}
	public boolean isLogin(String username,char[] password) throws SQLException {
		String sql = "select count(username) from user where username=? and password=?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.valueOf(password));
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		if(rs.getInt(1) == 1) return true;
		
		return false;
	}
	public void close() throws SQLException {
		if(this.connection.isClosed()) return;
		connection.close();
	}
	
}
