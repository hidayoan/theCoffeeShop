package TheCoffeeShop.Dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Repository;

import TheCoffeeShop.Dto.ProductsDto;
import TheCoffeeShop.Dto.ProductsDtoMapper;

@Repository
public class ProductsDao extends BaseDao {
	
	public List<ProductsDto> GetDataProducts() {
		List<ProductsDto> list = new ArrayList<ProductsDto>();
		String sql = "SELECT * FROM `products` WHERE 1";
		list = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return list;
	}
	
	public ProductsDto GetDataProductsById(String id) {
		List<ProductsDto> list = new ArrayList<ProductsDto>();
		String sql = "SELECT * FROM products WHERE id = " + id;
		list = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return list.get(0);
	}
	
	public ProductsDto GetDataProductsById(long id) {
		List<ProductsDto> list = new ArrayList<ProductsDto>();
		String sql = "SELECT * FROM products WHERE id = '" + id +"'";
		list = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return list.get(0);
	}
	
	public List<ProductsDto> GetRandomProduct(){
		List<ProductsDto> list = new ArrayList<ProductsDto>();
		list =  GetDataProducts();
		 Collections.shuffle(list);
		 return list;
	}
}
