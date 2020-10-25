package TheCoffeeShop.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import TheCoffeeShop.Entity.Menus;

public class MapperMenus implements RowMapper<Menus> {

	
	public Menus mapRow(ResultSet rs, int rowNum) throws SQLException {
		Menus menus = new Menus();
		menus.setId(rs.getInt("id"));
		menus.setName(rs.getString("name"));
		menus.setUrl(rs.getString("url"));
		menus.setPosition(rs.getInt("position"));
		return menus;
	}
	
}
