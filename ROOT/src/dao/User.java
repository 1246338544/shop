package dao;

import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import exception.UserException;

public class User {
	
	private User() {

	}
	public static boolean isExist(PasswordAuthentication pa) throws Exception {
		Connection connection = new Database().getConnection();
		String sql = "select count(name) from user where name=? and password=?";
		PreparedStatement ps = connection.prepareStatement(sql);
		if(pa.getUserName().length()<1||pa.getUserName().length()>20) throw new Exception("用户名不得为空或者长于20字符");
		ps.setString(1, pa.getUserName());
		ps.setString(2, String.valueOf(pa.getPassword()));
		ResultSet rs = ps.executeQuery();
		if(rs.next());		
		int result = rs.getInt(1) ;
		rs.close();
		connection.close();
		return result==1?true:false;
	}
	
	public static boolean regist(PasswordAuthentication pa) throws SQLException, ClassNotFoundException, UserException {
	
		if (pa.getUserName().length()<1||pa.getUserName().length()>20) throw new UserException("用户名不得为空，而且长度不能超过20");
		Connection con = new Database().getConnection();
		String sql = "insert into user values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pa.getUserName());
		ps.setString(2, String.copyValueOf(pa.getPassword()));
		try {
			return ps.executeUpdate()==1?true:false;
			 
		}catch(java.sql.SQLIntegrityConstraintViolationException e) {
			return false;
		}finally {
			con.close();
		}

	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		new User();
	}
}
