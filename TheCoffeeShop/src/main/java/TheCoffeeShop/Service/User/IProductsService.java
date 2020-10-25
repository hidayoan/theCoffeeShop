package TheCoffeeShop.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Dto.ProductsDto;

@Service
public interface IProductsService {
	@Autowired
	public ProductsDto GetDataProductsById(String id);
	@Autowired
	public ProductsDto GetDataProductsById(long id);
}
