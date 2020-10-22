package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Database;

public class Register {
	public static String check(String username, char[] password, char[] repeatPassword) throws SQLException, ClassNotFoundException {
		if (username.isBlank() || password.length == 0 || repeatPassword.length == 0) {
			return "用户名和密码不能为空或者只含有空格";
		}
		if (password.length != repeatPassword.length) return "密码长度不一致";
		for (int i = 0; i < password.length; i++) {
			if (password[i] != repeatPassword[i])
				return "密码不一致";
		}

		Connection con = Database.getConnection();
		String sql = "insert into user values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.copyValueOf(password));
		try {
			if (ps.execute()) {
				return "注册成功<a href='/shop/shop/'>点击此处返回商城</a>";
			} else {
				return "用户名重名，请更换用户名";
			}
		}catch(java.sql.SQLIntegrityConstraintViolationException e) {
			return "用户名重名，请更换用户名";
		}finally {
			con.close();
		}

	}
}
