package TheCoffeeShop.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import TheCoffeeShop.Entity.Users;

public class MapperUsers implements RowMapper<Users> {

	@Override
	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		Users users = new Users();
		users.setId(rs.getInt("id"));
		users.setUsername(rs.getString("username"));
		users.setPassword(rs.getString("password"));
		users.setEmail(rs.getString("email"));
		users.setAddress(rs.getString("address"));
		users.setPhone(rs.getString("phone"));
		users.setName(rs.getString("name"));
		return users;
	}
	
}
