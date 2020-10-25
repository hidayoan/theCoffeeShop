package TheCoffeeShop.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import TheCoffeeShop.Dto.CartDto;
import TheCoffeeShop.Dto.ProductsDto;
@Repository
public class CartDao extends BaseDao {
	
	@Autowired
	ProductsDao productsDao = new ProductsDao();
	@Autowired
	SizeProductDao sizeProductDao = new SizeProductDao();
	
	public HashMap<Long, CartDto> addCart(long id, int size, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		ProductsDto product = productsDao.GetDataProductsById(id);
		double price = sizeProductDao.GetDataSizeProductByIdProduct(id, size);
		long idCart = id*100 + size;
		if(product != null && cart.containsKey(idCart)) {
			itemCart = cart.get(idCart);
			itemCart.setQuanty(itemCart.getQuanty() + 1);
			itemCart.setTotalPrice(itemCart.getTotalPrice() + price);
		}
		else {
			itemCart.setSize(size);
			itemCart.setProduct(product);
			itemCart.setQuanty(1);
			itemCart.setTotalPrice(price);
		}
		System.out.println(idCart + "\n" + itemCart.getProduct().getId() + "\n" + itemCart.getTotalPrice());
		cart.put(idCart, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> editCart(long id, int quanty, HashMap<Long, CartDto> cart) {
		if(cart == null) {
			return cart;
		}
		CartDto itemCart = new CartDto();
		if(cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuanty(quanty);
			//itemCart.setTotalPrice(quanty * sizeProductDao.GetDataSizeProductByIdProduct(id, itemCart.getSize()) );
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart) {
		if(cart == null) {
			return cart;
		}
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	public int totalQuanty(HashMap<Long, CartDto> cart) {
		int totalQuanty = 0;
		for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalQuanty = totalQuanty + itemCart.getValue().getQuanty();
		}
		return totalQuanty;
	}
	
	
	public double totalPrice(HashMap<Long, CartDto> cart) {
		double totalPrice = 0;
		for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalPrice = totalPrice + itemCart.getValue().getTotalPrice();
		}
		return 0;
	}
}
