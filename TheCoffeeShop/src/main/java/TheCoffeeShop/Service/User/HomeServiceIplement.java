package TheCoffeeShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Dao.CategorysDao;
import TheCoffeeShop.Dao.MenusDao;
import TheCoffeeShop.Dao.ProductsDao;
import TheCoffeeShop.Dao.SizeProductDao;
import TheCoffeeShop.Dao.UsersDao;
import TheCoffeeShop.Dto.ProductsDto;
import TheCoffeeShop.Entity.Categorys;
import TheCoffeeShop.Entity.Menus;
import TheCoffeeShop.Entity.SizeProduct;
import TheCoffeeShop.Entity.Slides;
import TheCoffeeShop.Entity.Users;

@Service
public class HomeServiceIplement implements IHomeService {
	
	 @Autowired
	private CategorysDao categorysDao;
	public List<Categorys> GetDataCategorys() {
		return categorysDao.GetDataCategorys();
	}
	 @Autowired
	private SizeProductDao sizeProductDao;
	public List<SizeProduct> GetDataSizeProducts(){
		return sizeProductDao.GetDataSizeProduct();
	}
	@Autowired
	private MenusDao menusDao;
	public List<Menus> GetDataMenus() {
		return menusDao.GetDataMenus();
	}
	
	@Autowired
	private ProductsDao productsDao;
	public List<ProductsDto> GetDataProducts() {
		return productsDao.GetDataProducts();	
	}
	
	@Autowired
	private ProductsDao productsDao2;
	public List<ProductsDto> GetRandomProduct() {
		return productsDao2.GetRandomProduct();	
	}


	


}
