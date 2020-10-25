package TheCoffeeShop.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class ProductsDtoMapper implements RowMapper<ProductsDto> {

	
	public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductsDto products = new ProductsDto();
		
		products.setId(rs.getLong("id"));
		products.setName(rs.getString("name"));
		products.setId_category(rs.getInt("id_category"));
		products.setStatus(rs.getBoolean("status"));
		products.setDescription(rs.getString("description"));
		products.setImg(rs.getString("img"));
		products.setSale(rs.getInt("sale"));
		products.setHighlight(rs.getBoolean("highlight"));
		products.setNew_product(rs.getBoolean("new_product"));
		products.setDetail(rs.getString("detail"));
		//products.setCreated_at(rs.getString("created_at"));
		//products.setUpdated_ad(rs.getString("updated_at"));
		return products;
	}
	
}
