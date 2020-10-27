package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



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
	private String userName;
	private Integer productId;
	private Float price;
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		if (price == null) {
			throw new NullPointerException();
		}
		this.price = price;
	}
	public Cart() {};
	public Integer insert() throws ClassNotFoundException, SQLException {
		Connection conn = Database.getConnection();
		String sql = "insert into cart (user_name, product_id) value(?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2, this.getProductId());
		Integer affectedNumber = ps.executeUpdate();
		conn.close();
		return affectedNumber;
	}
	public Integer delete() throws ClassNotFoundException, SQLException {
		Connection conn = Database.getConnection();
		String sql = "delete from cart where user_name = ? and product_id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2, this.getProductId());
		Integer affectedNumber = ps.executeUpdate();
		conn.close();
		return affectedNumber;
	}
	public Integer update() throws ClassNotFoundException, SQLException {
		Connection conn = Database.getConnection();
		String sql = "update cart set product_id = ? and user_name = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2,this.getProductId());
		Integer affectedNumber = ps.executeUpdate();
		conn.close();
		return affectedNumber;
	}
	public Integer update(Float price) throws ClassNotFoundException, SQLException {
		this.setPrice(price);
		return this.update();
	}
}
