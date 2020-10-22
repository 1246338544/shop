package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
	
	private Connection connection = null;
	public Login() throws SQLException, ClassNotFoundException {
	   java.lang.Class.forName(Database.DRIVE);
	   this.connection = DriverManager.getConnection(Database.URL, Database.USERNAME, Database.PASSWORD);	
	}
	public boolean isLogin(String username,char[] password) throws SQLException {
		String sql = "select count(username) from user where username=? and password=?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.valueOf(password));
		ResultSet rs = ps.executeQuery();
		if(rs.next())		
		if(rs.getInt(1) == 1) {
			if(!this.connection.isClosed())
				connection.close();
			return true;
		}
		return false;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		new Login();
	}
}
