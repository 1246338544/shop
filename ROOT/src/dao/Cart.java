package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class Cart {
	public Connection con;

	public String date;

	private Integer number;

	private Float price;

	private Integer productId;

	public String productName;

	private String userName;

	public Cart() {
		try {
			con = new Database().getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Integer checkout() throws SQLException {

		String sql = "set @uuid = uuid_short();set @date = now();update cart set order_id = @uuid, date = @date where user_name = ? and order_id is null;";
		PreparedStatement ps = con.prepareStatement(sql);
		int i = ps.executeUpdate();
		return i;
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

	public Connection getCon() {
		return con;
	}

	public String getDate() {
		return date;
	}

	public Integer getNumber() {
		if (number == null) {
			throw new NullPointerException();
		}
		return number;
	}

	public Float getPrice() {
		return price;
	}

	public Integer getProductId() {
		if (productId == null)
			throw new NullPointerException();
		return productId;
	}

	public String getProductName() {
		return productName;
	}
	public String getUserName() {
		if (userName == null)
			throw new NullPointerException();
		return userName;
	}
	public Integer insert() throws ClassNotFoundException, SQLException {

		String sql = "insert into cart (user_name, product_id) value(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, this.getUserName());
		ps.setInt(2, this.getProductId());
		try {
			Integer affectedNumber = ps.executeUpdate();
			return affectedNumber;
		} catch (SQLIntegrityConstraintViolationException e) {

		} finally {
			ps.close();
		}
		return -1;
	}
	public ArrayList<Cart> selectAllOrderById() {
		String sql = "select * from cart inner join product where cart.product_id = product.id and user_name = ? and order_id is not null group by order_id order by date desc;";
		PreparedStatement ps;
		ResultSet rs = null;
		ArrayList<Cart> carts = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, getUserName());
			rs = ps.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setUserName(rs.getString("user_name"));
				cart.setNumber(rs.getInt("number"));
				cart.setProductId(rs.getInt("product_id "));
				cart.setDate(rs.getString("date"));
				cart.setProductName(rs.getString("name"));
				carts.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return carts;
	}

	public ResultSet selectAllUnchecked() throws ClassNotFoundException, SQLException {
		String sql = "select * from cart inner join product where cart.product_id = product.id and user_name = ? and order_id is null;";
		PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.FETCH_FORWARD);
		ps.setString(1, getUserName());
		ResultSet rs = ps.executeQuery();
		return rs;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public void setDate(String date) {
		this.date = date;
	};

	public void setNumber(Integer number) {
		if (number == null) {
			throw new NullPointerException();
		}
		this.number = number;
	}

	public void setPrice(Float price) {
		if (price == null) {
			throw new NullPointerException();
		}
		this.price = price;
	}

	public void setProductId(Integer productId) {
		if (productId == null)
			throw new NullPointerException();
		this.productId = productId;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setUserName(String userName) {
		if (userName == null)
			throw new NullPointerException();
		this.userName = userName;
	}

	public Integer update() throws ClassNotFoundException, SQLException {

		String sql = "update cart set number=? where product_id = ? and user_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(3, this.getUserName());
		ps.setInt(2, this.getProductId());
		ps.setInt(1, this.getNumber());
		Integer affectedNumber = ps.executeUpdate();
		ps.close();
		return affectedNumber;
	}

	public Integer update(Integer number, Integer productId) throws ClassNotFoundException, SQLException {
		this.setNumber(number);
		this.setProductId(productId);
		return this.update();
	}
}
