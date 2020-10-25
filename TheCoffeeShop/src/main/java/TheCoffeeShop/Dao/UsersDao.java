package TheCoffeeShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import TheCoffeeShop.Entity.Users;

@Repository
public class UsersDao extends BaseDao {
	public List<Users> GetDataUsers(){
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM user";
		list = _jdbcTemplate.query(sql, new MapperUsers());
		return list;
	}

	public int addAccount(Users user) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `user`( ");
		sql.append("    `username`, ");
		sql.append("    `password`, ");
		sql.append("    `email`, ");
		sql.append("    `address`, ");
		sql.append("    `phone`, ");
		sql.append("    `name` ");
		sql.append(") ");
		sql.append("VALUES( ");
		sql.append("    '"+ user.getUsername() +"', ");
		sql.append("    '"+ user.getPassword() +"', ");
		sql.append("    '"+ user.getEmail() +"', ");
		sql.append("    '"+ user.getAddress() +"', ");
		sql.append("    '"+ user.getPhone() +"', ");
		sql.append("    '"+ user.getName() +"' ");
		sql.append(")");
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public Users getUserByAcc(Users user) {
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM `user` WHERE `username` = '"  + user.getUsername() + "'";
		list = _jdbcTemplate.query(sql, new MapperUsers());
		return list.get(0);
	}
	

	
}
