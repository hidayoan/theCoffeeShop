package TheCoffeeShop.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Dao.ProductsDao;
import TheCoffeeShop.Dto.ProductsDto;

@Service
public class ProductServicesIplement implements IProductsService {

	@Autowired
	ProductsDao productsDao = new ProductsDao();
	
	
	public ProductsDto GetDataProductsById(String id) {
		return productsDao.GetDataProductsById(id);
	}
	public ProductsDto GetDataProductsById(long id) {
		// TODO Auto-generated method stub
		return productsDao.GetDataProductsById(id);
	}

}