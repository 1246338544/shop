package jsp;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product implements Serializable{
	private static final long serialVersionUID = 1L;
	Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getPrice() {
		return price;
	}
	public Product(Integer id, String name, Float price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.numberOfProduct = 1;
	}
	
	public void setPrice(Float price) {
		this.price = price;
	}
	String name;
	Float price;
	Integer numberOfProduct;
	public Integer getNumberOfProduct() {
		return numberOfProduct;
	}
	public void setNumberOfProduct(Integer numberOfProduct) {
		this.numberOfProduct = numberOfProduct;
	}
	private Connection connection = null;
	public Product() throws SQLException, ClassNotFoundException {
	   java.lang.Class.forName(Config.DRIVE);
	   this.connection = DriverManager.getConnection(Config.URL, Config.USERNAME, Config.PASSWORD);	
	}
	public ResultSet getProduct(Integer offset,Integer limit) throws SQLException {
		String sql = "select id,name,price from product limit 10 offset ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1,offset*10);
		return ps.executeQuery();
	}
	public ResultSet getProduct(Integer offset,Integer limit,String search) throws SQLException {
		String sql = "select id,name,price from product where name like ?  limit 10 offset ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, '%'+search+'%');
		ps.setInt(2, offset*10);
		return ps.executeQuery();
	}
	public void close() throws SQLException {
		if(this.connection.isClosed()) return;
		connection.close();
	}
	
}
