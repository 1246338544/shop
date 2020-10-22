package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Database;

public class Register {
	public static String check(String username, char[] password, char[] repeatPassword) throws SQLException, ClassNotFoundException {
		if (username.isBlank() || password.length == 0 || repeatPassword.length == 0) {
			return "�û��������벻��Ϊ�ջ���ֻ���пո�";
		}
		if (password.length != repeatPassword.length) return "���볤�Ȳ�һ��";
		for (int i = 0; i < password.length; i++) {
			if (password[i] != repeatPassword[i])
				return "���벻һ��";
		}

		Connection con = Database.getConnection();
		String sql = "insert into user values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.copyValueOf(password));
		try {
			if (ps.execute()) {
				return "ע��ɹ�<a href='/shop/shop/'>����˴������̳�</a>";
			} else {
				return "�û���������������û���";
			}
		}catch(java.sql.SQLIntegrityConstraintViolationException e) {
			return "�û���������������û���";
		}finally {
			con.close();
		}

	}
}
