package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Database;

public class Register {
	public static Result check(String username, char[] password, char[] repeatPassword) throws SQLException, ClassNotFoundException {
		if (username.isBlank() || password.length == 0 || repeatPassword.length == 0) {
			return new Result("�û��������벻��Ϊ�ջ���ֻ���пո�",false);
		}
		if (password.length != repeatPassword.length) return new Result("���볤�Ȳ�һ��",false);
		for (int i = 0; i < password.length; i++) {
			if (password[i] != repeatPassword[i])
				return new Result("���벻һ��",false);
		}

		Connection con = Database.getConnection();
		String sql = "insert into user values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, String.copyValueOf(password));
		try {
			if (ps.execute()) {
				return new Result("ע��ɹ�<a href='/shop/shop/'>����˴������̳�</a>",true);
			} else {
				return new Result("�û���������������û���",false);
			}
		}catch(java.sql.SQLIntegrityConstraintViolationException e) {
			return new Result("�û���������������û���",false);
		}finally {
			con.close();
		}

	}

}
class Result{
	String message;
	boolean result;
	public Result(String message,boolean result){
		this.message = message;
		this.result = result;
	}
}
