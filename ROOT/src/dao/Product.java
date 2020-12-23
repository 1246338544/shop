package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	String name;
	Float price;
	private Connection connection = null;
	public Product(){
	}
	public ArrayList<Product> getProduct(Integer offset,Integer limit) throws SQLException, ClassNotFoundException {
		this.connection = new Database().getConnection();
		String sql = "select id,name,price from product limit 10 offset ?";
		PreparedStatement ps = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ps.setInt(1,offset);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> products = new ArrayList<Product>();
		while(rs.next()) {
			Product product = new Product(rs.getInt(1),rs.getString(2),rs.getFloat(3));
			products.add(product);
		}
		rs.close();
		this.connection.close();
		return products;
	}
	public ArrayList<Product> getProduct(Integer offset,Integer limit,String search) throws SQLException, ClassNotFoundException {
		this.connection = new Database().getConnection();
		String sql = "select id,name,price from product where name like ?  limit 10 offset ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, '%'+search+'%');
		ps.setInt(2, offset*10);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> products = new ArrayList<Product>();
		while(rs.next()) {
			Product product = new Product(rs.getInt(1),rs.getString(2),rs.getFloat(3));
			products.add(product);
		}
		rs.close();
		this.connection.close();
		return products;
	}
	public static ArrayList<Product> cast(Object objs){
		if(objs==null) return null;
		ArrayList<Product> products = new ArrayList<Product>();
		for(Object obj:(ArrayList<?>)objs) {
			if(obj instanceof Product) {
				products.add((Product)obj);
			}else {
				throw new ClassCastException();
			}
		}
		return products;
	}
	public void close() throws SQLException {
		if(this.connection.isClosed()) return;
		connection.close();
	}
	
}