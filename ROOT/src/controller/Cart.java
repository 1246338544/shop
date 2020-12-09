package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;



public class Cart {
	public String getUserName() {
		if(userName == null) throw new NullPointerException(); 
		return userName;
	}
	public void setUserName(String userName) {
		if(userName == null) throw new NullPointerException(); 
		this.userName = userName;
	}
	public Integer getProductId() {
		if(productId == null) throw new NullPointerException();
		return productId;
	}
	public void setProductId(Integer productId) {
		if(productId == null) throw new NullPointerException();
		this.productId = productId;
	}
	private Integer number;
	public Integer getNumber() {
		if (number == null) {
			throw new NullPointerException();
		}
		return number;
	}
	public void setNumber(Integer number) {
		if (number == null) {
			throw new NullPointerException();
		}
		this.number = number;
	}
	public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	private String userName;
	private Integer productId;
	private Float price;
	public Connection con ;
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		if (price == null) {
			throw new NullPointerException();
		}
		this.price = price;
	}
	public Cart() throws ClassNotFoundException, SQLException 
	{con = new Database().getConnection();};
	public Integer insert() throws ClassNotFoundException, SQLException {
		
		String sql = "insert into cart (user_name, product_id) value(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2, this.getProductId());
		try {
		Integer affectedNumber = ps.executeUpdate();
		return affectedNumber;
		}catch (SQLIntegrityConstraintViolationException e) {
			
		}finally {
			ps.close();
		}
		return -1;
	}
	public Integer delete() throws ClassNotFoundException, SQLException {
		
		String sql = "delete from cart where user_name = ? and product_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2, this.getProductId());
		Integer affectedNumber = ps.executeUpdate();
		ps.close();
		return affectedNumber;
	}
	public Integer update() throws ClassNotFoundException, SQLException {
		
		String sql = "update cart set number=? where product_id = ? and user_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(3, this.getUserName());
		ps.setInt(2,this.getProductId());
		ps.setInt(1, this.getNumber());
		Integer affectedNumber = ps.executeUpdate();
		ps.close();
		return affectedNumber;
	}

	public ResultSet selectAllUnchecked() throws ClassNotFoundException, SQLException {
		String sql = "select * from cart inner join product where cart.product_id = product.id and user_name = ? and order_id is null;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, getUserName());
		ResultSet rs = ps.executeQuery();
		return rs;
	}
	public Integer update(Integer number,Integer productId) throws ClassNotFoundException, SQLException {
		this.setNumber(number);
		this.setProductId(productId);
		return this.update();
	}
	
	public Integer checkout() throws SQLException {
		
		String sql = "set @uuid = uuid_short();set @date = now();update cart set order_id = @uuid, date = @date where user_name = ? and order_id is null;";
		PreparedStatement ps = con.prepareStatement(sql);
		int i = ps.executeUpdate();
		return i;
	}
}
