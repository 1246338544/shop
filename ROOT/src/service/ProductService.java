package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.Product;

public class ProductService {
	private ProductService() {
	};

	public static ArrayList<Product> getProduct(Integer offset, Integer limit, String search) throws ClassNotFoundException, SQLException {
		Product product = new Product();
		if (search == null)
			return product.getProduct(offset, limit);
		else
			return product.getProduct(offset, limit, search);
	}
}
