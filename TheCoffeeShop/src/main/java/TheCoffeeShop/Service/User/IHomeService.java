package TheCoffeeShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Dto.ProductsDto;
import TheCoffeeShop.Entity.Categorys;
import TheCoffeeShop.Entity.Menus;
import TheCoffeeShop.Entity.SizeProduct;
import TheCoffeeShop.Entity.Slides;
import TheCoffeeShop.Entity.Users;
@Service
public interface IHomeService {
	@Autowired
	public List<Categorys> GetDataCategorys();
	public List<SizeProduct> GetDataSizeProducts();
	public List<Menus> GetDataMenus();
	public List<ProductsDto> GetDataProducts();
	public List<ProductsDto> GetRandomProduct();
 }
