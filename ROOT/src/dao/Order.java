package dao;

/**
 * 
 * @author joker
 *
 */
public class Order {
	private Product product;
	private Integer number;
	public Order(Product product, Integer number) {
		this.product = product;
		this.number = number;
	}
	public Product getProduct() {
		return product;
	}
	public Integer getNumber() {
		return number;
	}
	
}
