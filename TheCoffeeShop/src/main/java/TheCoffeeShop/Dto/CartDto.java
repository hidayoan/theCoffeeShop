package TheCoffeeShop.Dto;

public class CartDto {
	private int quanty;
	private double totalPrice;
	private ProductsDto product;
	int Size;
	
	public int getSize() {
		return Size;
	}
	public void setSize(int size) {
		Size = size;
	}
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public ProductsDto getProduct() {
		return product;
	}
	public void setProduct(ProductsDto product) {
		this.product = product;
	}
	
	public CartDto(int quanty, double totalPrice, ProductsDto product, int size) {
		this.quanty = quanty;
		this.totalPrice = totalPrice;
		this.product = product;
		this.Size = size;
	}
	
	public CartDto() {
	}
	
}
