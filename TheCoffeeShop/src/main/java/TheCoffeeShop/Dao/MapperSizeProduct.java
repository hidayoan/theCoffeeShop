package TheCoffeeShop.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import TheCoffeeShop.Entity.SizeProduct;

public class MapperSizeProduct implements RowMapper<SizeProduct>{

	@Override
	public SizeProduct mapRow(ResultSet rs, int rowNum) throws SQLException {
		SizeProduct sizeProduct = new SizeProduct();
		sizeProduct.setIdProduct(rs.getInt("id_product"));
		sizeProduct.setSize(rs.getInt("size"));
		sizeProduct.setPrice(rs.getDouble("price"));
		return sizeProduct;
	}
	
}
