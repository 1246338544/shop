package controller;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import entity.Result;


public class Register {
	
	public static Result check(String username, char[] password, char[] repeatPassword) throws SQLException, ClassNotFoundException {
		if (username.isBlank() || password.length == 0 || repeatPassword.length == 0) {
			return new Result("用户名和密码不能为空或者只含有空格",false);
		}
		if (username.length()<1||username.length()>20) return new Result("用户名长度1~20位",false);

		if (password.length != repeatPassword.length) return new Result("密码长度不一致",false);
		for (int i = 0; i < password.length; i++) {
			if (password[i] != repeatPassword[i])
				return new Result("密码不一致",false);
		}

		Connection con = Database.getConnection();
		String sql = "insert into user values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.copyValueOf(password));
		try {
			if(ps.executeUpdate()==1)
			 return new Result("注册成功",true);
			else return new Result("注册失败",false);
		}catch(java.sql.SQLIntegrityConstraintViolationException e) {
			return new Result("用户名重名，请更换用户名",false);
		}finally {
			con.close();
		}

	}

}

