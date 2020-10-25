package TheCoffeeShop.Service.User;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import TheCoffeeShop.Dto.CartDto;

@Service
public interface ICartService {
	
	public HashMap<Long, CartDto> addCart(long id,int size, HashMap<Long, CartDto> cart);
	
	public HashMap<Long, CartDto> editCart(long id, int quanty, HashMap<Long, CartDto> cart);
	
	public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart);
	
	public int totalQuanty(HashMap<Long, CartDto> cart);
	
	public double totalPrice(HashMap<Long, CartDto> cart);
}
