package TheCoffeeShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import TheCoffeeShop.Entity.SizeProduct;

@Repository
public class SizeProductDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<SizeProduct> GetDataSizeProduct(){
		List<SizeProduct> list = new ArrayList<SizeProduct>();
		String sql = "SELECT * FROM sizeproduct";
		list = _jdbcTemplate.query(sql, new MapperSizeProduct());
		return list;
	}
	
	public double GetDataSizeProductByIdProduct(long id, int size){
		List<SizeProduct> list = new ArrayList<SizeProduct>();
		String sql = "SELECT * FROM `sizeproduct` WHERE `id_product` = '" + id + "' AND `size` = '" + size + "'";
		list = _jdbcTemplate.query(sql, new MapperSizeProduct());
		return list.get(0).getPrice();
	}
}
