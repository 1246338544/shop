package service;

/**
 * 
 * @author joker
 *
 * 订单的实体类，number为数量。
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
